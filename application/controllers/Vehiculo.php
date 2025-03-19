
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");
class Vehiculo extends BaseController {

      public function __construct(){
            parent::__construct();
            $this->load->model('Vehiculo_m');  
            $this->load->model('Marca_m');
            $this->load->model('Modelo_m');  
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
     * Obtener todas las vehiculos
     * Endpoint: /api/vehiculos
     * Método: GET
     */
    public function get_vehiculos() {
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

          // Obtener las vehiculos de la base de datos
          $data['vehiculo'] = $this->Vehiculo_m->obtener_todos('vehiculo');
          if ($data['vehiculo'] === false) {
              throw new CustomException('No se pudieron obtener las vehiculos.', 500); // 500 - Error interno
          }

          $transformed_data = array_map(function($vehiculo) {
            // Condición para asignar acciones según el estado de la vehiculo
            $action = ($vehiculo['vehiculo_estado'] == 1) 
                ? ['edit' => 'edit', 'delete' => 'delete'] 
                : ['edit' => 'edit', 'activate' => 'sync'];

            return [
                'id' => $vehiculo['id'],  // Formatear el ID de la vehiculo
                'vehiculo_descripcion' => $vehiculo['vehiculo_descripcion'],
                'modelo_id' => $vehiculo['modelo_id'],
                'marca_descripcion' => $vehiculo['marca_descripcion'],
                'status' => [
                    'inProgress' => $vehiculo['vehiculo_estado'] == 1 ? 'Activo' : 'Inactivo'  // Ajustar el estado según el valor de 'vehiculo_estado'
                ],
                'action' => $action  // Asignar las acciones correspondientes
            ];
        }, $data['vehiculo']);
          
        
           $modelos = $this->Modelo_m->obtener_activos('marca');
          // Respuesta exitosa
          $this->output
              ->set_status_header(200)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'marcas' => $modelos,
                  'data' => $transformed_data
              ]));

      } catch (CustomException $e) {
          // Manejo de excepciones personalizadas (por ejemplo, problemas con el token)
          log_message('error', 'Error en get_vehiculos: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));

      } catch (Exception $e) {
          // Manejo general de excepciones
          log_message('error', 'Error en get_vehiculos: ' . $e->getMessage());
          $this->output
              ->set_status_header(500) // Código 500 - Error interno del servidor
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Ocurrió un problema interno del servidor.'
              ]));
      }
  }

    public function post_vehiculo() {
        try {
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
            $nuevaVehiculo = json_decode(file_get_contents('php://input'), true);
            if (empty($nuevaVehiculo['nombre_vehiculo'])) {
                throw new CustomException('El nombre de la vehiculo es obligatorio.', 400);
            }
            if (empty($nuevaVehiculo['modeloid'])) {
                throw new CustomException('La marca es obligatorio.', 400);
            }

            $vehiculoId = isset($nuevaVehiculo['vehiculoid']) ? trim($nuevaVehiculo['vehiculoid']) : null;
            $this->db->trans_begin();
            if (!empty($vehiculoId)) {
                $this->db->where('id', $vehiculoId);
                $query = $this->db->get('vehiculo');
                if ($query->num_rows() == 0) {
                    $this->db->trans_rollback();
                    throw new CustomException('El vehiculo con este ID no existe.', 404);
                }
                $data = [
                    'vehiculo_descripcion' => $nuevaVehiculo['nombre_vehiculo'],
                    'modelo_id' => $nuevaVehiculo['modeloid'],
                    'fecha_actualizacion' => date('Y-m-d H:i:s')
                ];
                $actualizado = $this->Vehiculo_m->actualizar('vehiculo', $vehiculoId, $data);
                if (!$actualizado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al actualizar la vehiculo.', 500);
                }
                // $this->db->where('id', $vehiculoId);
                $id = $vehiculoId;
            } else {
                $this->db->where('vehiculo_descripcion', $nuevaVehiculo['nombre_vehiculo']);
                $query = $this->db->get('vehiculo');

                if ($query->num_rows() > 0) {
                    $this->db->trans_rollback();
                    throw new CustomException('El vehiculo con este nombre ya existe.', 400);
                }
                $data = [
                    'vehiculo_descripcion' => $nuevaVehiculo['nombre_vehiculo'],
                    'vehiculo_estado' => 1,
                    'modelo_id' => $nuevaVehiculo['modeloid'],
                    'fecha_creacion' => date('Y-m-d H:i:s')
                ];
                $insertado = $this->Vehiculo_m->insertar('vehiculo', $data);
                if (!$insertado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al crear la vehiculo.', 500);
                }
                $id = $insertado['id'];
                $this->db->trans_commit();
            }
            $vehiculoActualizada = $this->Vehiculo_m->obtener_por_id('vehiculo',$id );
            $this->db->trans_commit();
            $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'status' => true,
                    'message' => 'Vehiculo actualizada satisfactoriamente',
                    'data' => [
                        'id' => $vehiculoActualizada['id'],  // Formatear el ID de la vehiculo
                        'vehiculo_descripcion' => $vehiculoActualizada['vehiculo_descripcion'],
                        'marca_id' => $vehiculoActualizada['marca_id'],
                        'marca_descripcion' => $vehiculoActualizada['marca_descripcion'],
                        'status' => ['inProgress' => $vehiculoActualizada['vehiculo_estado'] == 1 ? 'Activo' : 'Inactivo'],
                        'action' => [
                            'edit' => 'edit',
                            'delete' => 'delete'
                        ]
                    ]
            ]));
    } catch (CustomException $e) {
        log_message('error', 'Error en vehiculo: ' . $e->getMessage());
        $this->output
            ->set_status_header($e->getHttpCode())
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'error' => $e->getMessage()
            ]));
    } catch (Exception $e) {
        log_message('error', 'Error en vehiculo: ' . $e->getMessage());
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


  public function delete_vehiculo($id) {
      try {
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
          if (empty($id)) {
              throw new CustomException('ID de la vehiculo es obligatorio.', 400);
          }
          $data = [
              'vehiculo_estado' => 0
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('id', $id);
          $update = $this->db->update('vehiculo', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la vehiculo.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Vehiculo eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_vehiculo: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_vehiculo: ' . $e->getMessage());
          $this->output
              ->set_status_header(500)
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => 'Error interno del servidor.'
              ]));
      }
  }

  public function reactivar_vehiculo($id) {
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
              throw new CustomException('ID de la vehiculo es obligatorio.', 400);
          }
  
          // Cambiar el estado de la vehiculo a 0 (eliminar lógicamente)
          $data = [
              'vehiculo_estado' => 1  // Estado 0 para indicar "eliminado"
          ];
  
          // Realizar la actualización en la base de datos
          $this->db->where('id', $id);
          $update = $this->db->update('vehiculo', $data);
  
          // Verificar si la actualización fue exitosa
          if (!$update) {
              throw new CustomException('Error al cambiar el estado de la vehiculo.', 500);
          }
  
          // Responder con éxito
          $this->output
              ->set_status_header(200)  // Código 200 - OK
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => true,
                  'message' => 'Vehiculo eliminada lógicamente con éxito.'  // Mensaje de éxito
              ]));
  
      } catch (CustomException $e) {
          // Manejo de errores personalizados
          log_message('error', 'Error en delete_vehiculo: ' . $e->getMessage());
          $this->output
              ->set_status_header($e->getHttpCode())
              ->set_content_type('application/json')
              ->set_output(json_encode([
                  'status' => false,
                  'error' => $e->getMessage()
              ]));
      } catch (Exception $e) {
          // Manejo general de errores
          log_message('error', 'Error en delete_vehiculo: ' . $e->getMessage());
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