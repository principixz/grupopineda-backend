
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");
class Modelo extends BaseController {

      public function __construct(){
            parent::__construct();
            $this->load->model('Modelo_m');  
            $this->load->model('Marca_m');  
            $this->objOfJwt = new ImplementJwt();
            $this->handleCors();

            if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
                  header("HTTP/1.1 200 OK");
                  exit();
            }
        }

        private function handleCors(){
            if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
                header("Access-Control-Allow-Origin: *");
                header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
                header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, Origin, Accept");
                header("Access-Control-Allow-Credentials: true");
                header("Content-Type: application/json; charset=UTF-8");
                http_response_code(200);
                exit;
            }
    
            header("Access-Control-Allow-Origin: *");
            header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
            header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, Origin, Accept");
            header("Access-Control-Allow-Credentials: true");
            header("Content-Type: application/json; charset=UTF-8");
      }
 

    /**
     * Obtener todas las modelos
     * Endpoint: /api/modelos
     * Método: GET
     */
    public function get_modelos() {
      try {
          // Obtener los encabezados de la solicitud
          $headers = $this->input->request_headers();
          
          // Validar el token de autorización
          $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
                $this->output
                    ->set_status_header(201) // Código 401 - Unauthorized
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
                return; // Detener la ejecución
            }
          if (!$data_token) {
              throw new CustomException('Token de autorización inválido.', 401); // 401 - No autorizado
          }

          // Obtener las modelos de la base de datos
          $data['modelo'] = $this->Modelo_m->obtener_todos('modelo');
          if ($data['modelo'] === false) {
              throw new CustomException('No se pudieron obtener las modelos.', 500); // 500 - Error interno
          }

          $transformed_data = array_map(function($modelo) {
            // Condición para asignar acciones según el estado de la modelo
            $action = ($modelo['modelo_estado'] == 1) 
                ? ['edit' => 'edit', 'delete' => 'delete'] 
                : ['edit' => 'edit', 'activate' => 'sync'];

            return [
                'id' => $modelo['id'],  // Formatear el ID de la modelo
                'modelo_descripcion' => $modelo['modelo_descripcion'],
                'marca_id' => $modelo['marca_id'],
                'marca_descripcion' => $modelo['marca_descripcion'],
                'status' => [
                    'inProgress' => $modelo['modelo_estado'] == 1 ? 'Activo' : 'Inactivo'  // Ajustar el estado según el valor de 'modelo_estado'
                ],
                'action' => $action  // Asignar las acciones correspondientes
            ];
        }, $data['modelo']);
        $marcas = $this->Marca_m->obtener_activos('marca');
          // Respuesta exitosa
          $this->output
              ->set_status_header(200)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'marcas' => $marcas,
                  'data' => $transformed_data
              ]));

      } catch (CustomException $e) {
          // Manejo de excepciones personalizadas (por ejemplo, problemas con el token)
          log_message('error', 'Error en get_modelos: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));

      } catch (Exception $e) {
          // Manejo general de excepciones
          log_message('error', 'Error en get_modelos: ' . $e->getMessage());
          $this->output
              ->set_status_header(500) // Código 500 - Error interno del servidor
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Ocurrió un problema interno del servidor.'
              ]));
      }
  }

    public function post_modelo() {
        try {
            // Obtener el token de la solicitud
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
                $this->output
                    ->set_status_header(201) // Código 401 - Unauthorized
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
                return; // Detener la ejecución
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }

            // Obtener los datos de la nueva modelo
            $nuevaModelo = json_decode(file_get_contents('php://input'), true);
            if (empty($nuevaModelo['nombre_modelo'])) {
                throw new CustomException('El nombre de la modelo es obligatorio.', 400);
            }
            if (empty($nuevaModelo['marcaid'])) {
                throw new CustomException('La marca es obligatorio.', 400);
            }

            $modeloId = isset($nuevaModelo['modeloid']) ? trim($nuevaModelo['modeloid']) : null;

            // Iniciar la transacción
            $this->db->trans_begin();

            if (!empty($modeloId)) {
                $this->db->where('id', $modeloId);
                $query = $this->db->get('modelo');

                if ($query->num_rows() == 0) {
                    $this->db->trans_rollback();
                    throw new CustomException('El modelo con este ID no existe.', 404);
                }

                // Actualizar la modelo
                $data = [
                    'modelo_descripcion' => $nuevaModelo['nombre_modelo'],
                    'marca_id' => $nuevaModelo['marcaid'],
                    'fecha_actualizacion' => date('Y-m-d H:i:s')
                ];
                $actualizado = $this->Modelo_m->actualizar('modelo', $modeloId, $data);

                if (!$actualizado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al actualizar la modelo.', 500);
                }
                $this->db->where('id', $modeloId);
                $id = $modeloId;
            } else {
                $this->db->where('modelo_descripcion', $nuevaModelo['nombre_modelo']);
                $query = $this->db->get('modelo');

                if ($query->num_rows() > 0) {
                    $this->db->trans_rollback();
                    throw new CustomException('El modelo con este nombre ya existe.', 400);
                }

                // Insertar nueva modelo
                $data = [
                    'modelo_descripcion' => $nuevaModelo['nombre_modelo'],
                    'modelo_estado' => 1,
                    'marca_id' => $nuevaModelo['marcaid'],
                    'fecha_creacion' => date('Y-m-d H:i:s')
                ];

                $insertado = $this->Modelo_m->insertar('modelo', $data);

                if (!$insertado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al crear la modelo.', 500);
                }
                $id = $insertado['id'];
                $this->db->trans_commit();
            }
            $modeloActualizada = $this->Modelo_m->obtener_por_id('modelo',$id );
            $this->db->trans_commit();
            $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'status' => true,
                    'message' => 'Modelo actualizada satisfactoriamente',
                    'data' => [
                        'id' => $modeloActualizada['id'],  // Formatear el ID de la modelo
                        'modelo_descripcion' => $modeloActualizada['modelo_descripcion'],
                        'marca_id' => $modeloActualizada['marca_id'],
                        'marca_descripcion' => $modeloActualizada['marca_descripcion'],
                        'status' => ['inProgress' => $modeloActualizada['modelo_estado'] == 1 ? 'Activo' : 'Inactivo'],
                        'action' => [
                            'edit' => 'edit',
                            'delete' => 'delete'
                        ]
                    ]
            ]));
    } catch (CustomException $e) {
        log_message('error', 'Error en modelo: ' . $e->getMessage());
        $this->output
            ->set_status_header($e->getHttpCode())
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'error' => $e->getMessage()
            ]));
    } catch (Exception $e) {
        log_message('error', 'Error en modelo: ' . $e->getMessage());
        $this->db->trans_rollback();
        $this->output
            ->set_status_header(500)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'error' => 'Error interno del servidor.'
            ]));
    }
}


  public function delete_modelo($id) {
      try {
          // Obtener el token de la solicitud
          $headers = $this->input->request_headers();
          $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
                $this->output
                    ->set_status_header(201) // Código 401 - Unauthorized
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
                return; // Detener la ejecución
            }
          
          if (!$data_token) {
              throw new CustomException('Token de autorización inválido.', 401);
          }
  
          // Verificar si el ID es válido
          if (empty($id)) {
              throw new CustomException('ID de la modelo es obligatorio.', 400);
          }
  
          // Cambiar el estado de la modelo a 0 (eliminar lógicamente)
          $data = [
              'modelo_estado' => 0  // Estado 0 para indicar "eliminado"
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('id', $id);
          $update = $this->db->update('modelo', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la modelo.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Modelo eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_modelo: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_modelo: ' . $e->getMessage());
          $this->output
              ->set_status_header(500)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Error interno del servidor.'
              ]));
      }
  }

  public function reactivar_modelo($id) {
      try {
          // Obtener el token de la solicitud
          $headers = $this->input->request_headers();
          $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
                $this->output
                    ->set_status_header(201) // Código 401 - Unauthorized
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
                return; // Detener la ejecución
            }
          
          if (!$data_token) {
              throw new CustomException('Token de autorización inválido.', 401);
          }
  
          // Verificar si el ID es válido
          if (empty($id)) {
              throw new CustomException('ID de la modelo es obligatorio.', 400);
          }
  
          // Cambiar el estado de la modelo a 0 (eliminar lógicamente)
          $data = [
              'modelo_estado' => 1  // Estado 0 para indicar "eliminado"
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('id', $id);
          $update = $this->db->update('modelo', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la modelo.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Modelo eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_modelo: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_modelo: ' . $e->getMessage());
          $this->output
              ->set_status_header(500)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Error interno del servidor.'
              ]));
      }
  }
}
?>