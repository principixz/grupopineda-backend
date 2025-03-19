
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");
class Marca extends BaseController {

      public function __construct(){
            parent::__construct();
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
	public function index(){
            $data=array();
            $data["titulo_descripcion"]="Lista de marca de producto";
            $data["tabla"]=$this->Mantenimiento_m->consulta3("select * from marca where marca_estado=1");
            $this->vista("Marca_producto/index",$data);
	}

    /**
     * Obtener todas las marcas
     * Endpoint: /api/marcas
     * Método: GET
     */
    public function get_marcas() {
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

          // Obtener las marcas de la base de datos
          $data['marca'] = $this->Marca_m->obtener_todos('marca');
          if ($data['marca'] === false) {
              throw new CustomException('No se pudieron obtener las marcas.', 500); // 500 - Error interno
          }

          $transformed_data = array_map(function($marca) {
            // Condición para asignar acciones según el estado de la marca
            $action = ($marca['marca_estado'] == 1) 
                ? ['edit' => 'edit', 'delete' => 'delete'] 
                : ['edit' => 'edit', 'activate' => 'sync'];

            return [
                'marca_id' => $marca['marca_id'],  // Formatear el ID de la marca
                'marca_descripcion' => $marca['marca_descripcion'],
                'status' => [
                    'inProgress' => $marca['marca_estado'] == 1 ? 'Activo' : 'Inactivo'  // Ajustar el estado según el valor de 'marca_estado'
                ],
                'action' => $action  // Asignar las acciones correspondientes
            ];
        }, $data['marca']);

          // Respuesta exitosa
          $this->output
              ->set_status_header(200)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'data' => $transformed_data
              ]));

      } catch (CustomException $e) {
          // Manejo de excepciones personalizadas (por ejemplo, problemas con el token)
          log_message('error', 'Error en get_marcas: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));

      } catch (Exception $e) {
          // Manejo general de excepciones
          log_message('error', 'Error en get_marcas: ' . $e->getMessage());
          $this->output
              ->set_status_header(500) // Código 500 - Error interno del servidor
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Ocurrió un problema interno del servidor.'
              ]));
      }
  }

  public function post_marca() {
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

        // Obtener los datos de la nueva marca
        $nuevaMarca = json_decode(file_get_contents('php://input'), true);
        if (empty($nuevaMarca['nombre_marca'])) {
            throw new CustomException('El nombre de la marca es obligatorio.', 400);
        }

        $marcaId = isset($nuevaMarca['marcaid']) ? trim($nuevaMarca['marcaid']) : null;

        // Iniciar la transacción
        $this->db->trans_begin();

        if (!empty($marcaId)) {
            $this->db->where('marca_id', $marcaId);
            $query = $this->db->get('marca');

            if ($query->num_rows() == 0) {
                $this->db->trans_rollback();
                throw new CustomException('La marca con este ID no existe.', 404);
            }

            // Actualizar la marca
            $data = [
                'marca_descripcion' => $nuevaMarca['nombre_marca'],
                'fecha_actualizacion' => date('Y-m-d H:i:s')
            ];
            $actualizado = $this->Marca_m->actualizar('marca', $marcaId, $data);

            if (!$actualizado['estado']) {
                $this->db->trans_rollback();
                throw new CustomException('Error al actualizar la marca.', 500);
            }
            $this->db->where('marca_id', $marcaId);
            $marcaActualizada = $this->db->get('marca')->row_array();
            // Confirmar transacción
            $this->db->trans_commit();

            // Responder con éxito
            $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'status' => true,
                    'message' => 'Marca actualizada satisfactoriamente',
                    'data' => [
                        'marca_id' => $marcaActualizada['marca_id'],
                        'marca_descripcion' => $marcaActualizada['marca_descripcion'],
                        'status' => ['inProgress' => $marcaActualizada['marca_estado'] == 1 ? 'Activo' : 'Inactivo'],
                        'action' => [
                            'edit' => 'edit',
                            'delete' => 'delete'
                        ]
                    ]
                ]));

        } else {
            // Verificar si la marca ya existe antes de insertar
            $this->db->where('marca_descripcion', $nuevaMarca['nombre_marca']);
            $query = $this->db->get('marca');

            if ($query->num_rows() > 0) {
                $this->db->trans_rollback();
                throw new CustomException('La marca con este nombre ya existe.', 400);
            }

            // Insertar nueva marca
            $data = [
                'marca_descripcion' => $nuevaMarca['nombre_marca'],
                'marca_estado' => 1,
                'fecha_creacion' => date('Y-m-d H:i:s')
            ];

            $insertado = $this->Marca_m->insertar('marca', $data);

            if (!$insertado['estado']) {
                $this->db->trans_rollback();
                throw new CustomException('Error al crear la marca.', 500);
            }

            // Confirmar la transacción
            $this->db->trans_commit();

            // Responder con éxito
            $this->output
                ->set_status_header(201)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'status' => true,
                    'message' => 'Marca guardada satisfactoriamente',
                    'data' => [
                        'marca_id' => $insertado['marca_id'],
                        'marca_descripcion' => $nuevaMarca['nombre_marca'],
                        'status' => ['inProgress' => 'Activo'],
                        'action' => [
                            'edit' => 'edit',
                            'delete' => 'delete'
                        ]
                    ]
                ]));
        }

    } catch (CustomException $e) {
        log_message('error', 'Error en marca: ' . $e->getMessage());
        $this->output
            ->set_status_header($e->getHttpCode())
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'error' => $e->getMessage()
            ]));
    } catch (Exception $e) {
        log_message('error', 'Error en marca: ' . $e->getMessage());
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


  public function delete_marca($id) {
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
              throw new CustomException('ID de la marca es obligatorio.', 400);
          }
  
          // Cambiar el estado de la marca a 0 (eliminar lógicamente)
          $data = [
              'marca_estado' => 0  // Estado 0 para indicar "eliminado"
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('marca_id', $id);
          $update = $this->db->update('marca', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la marca.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Marca eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_marca: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_marca: ' . $e->getMessage());
          $this->output
              ->set_status_header(500)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Error interno del servidor.'
              ]));
      }
  }

  public function reactivar_marca($id) {
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
              throw new CustomException('ID de la marca es obligatorio.', 400);
          }
  
          // Cambiar el estado de la marca a 0 (eliminar lógicamente)
          $data = [
              'marca_estado' => 1  // Estado 0 para indicar "eliminado"
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('marca_id', $id);
          $update = $this->db->update('marca', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la marca.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Marca eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_marca: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_marca: ' . $e->getMessage());
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