<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");

class Maquinaria extends BaseController {

    public function __construct(){
        parent::__construct();
        $this->load->model('Maquinaria_m');  
        $this->objOfJwt = new ImplementJwt();
        $this->handleCors();

        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            header("HTTP/1.1 200 OK");
            exit();
        }
    }

    /**
     * Configuración de CORS
     */
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
     * GET /api/maquinaria/get_maquinaria
     * Obtiene todas las maquinarias.
     */
    public function get_maquinaria(){
        try {

            // Validar token
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true); 
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output->set_status_header(201)
                             ->set_content_type('application/json')
                             ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            } 
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            } 
            $empresa_ruc = $this->input->get('empresa_ruc');
            // Obtener datos de la tabla maquinaria
            $data['maquinaria'] = $this->Maquinaria_m->obtener_por_ruc('maquinaria',$empresa_ruc); 
            if ($data['maquinaria'] === false) {
                throw new CustomException('No se pudieron obtener las maquinarias.', 500);
            }
            
            // Transformar cada registro para la respuesta
            $transformed_data = array_map(function($m) {
                $action = ($m['estado'] == 1)
                          ? [
                                'edit' => 'edit', 
                                'delete' => 'delete' , 
                                'mantenimiento' => 'construction',
                                'historial' => 'tools_power_drill'
                            ]
                          : [
                              'edit' => 'edit', 
                              'activate' => 'sync', 
                              'mantenimiento' => 'construction',
                              'historial' => 'tools_power_drill'];
                return [
                    'id' => $m['id'],
                    'tipo_maquinaria_id' => $m['tipo_maquinaria_id'],
                    'empresa_id' => $m['empresa_id'],
                    'placa' => $m['placa'],
                    'serie' => $m['serie'],
                    'motor' => $m['motor'],
                    'anio' => $m['anio'],
                    'fecha_creacion' => $m['fecha_creacion'],
                    'fecha_modificacion' => isset($m['fecha_modificacion']) ? $m['fecha_modificacion'] : null,
                    'horometro' => isset($m['horometro']) ? $m['horometro'] : null,
                    'fecha_ultimo_mantenimiento' => isset($m['fecha_ultimo_mantenimiento']) ? $m['fecha_ultimo_mantenimiento'] : null,
                    'status' => ['inProgress' => ($m['estado'] == 1 ? 'Activo' : 'Inactivo')],
                    'action' => $action
                ];
            }, $data['maquinaria']);
            
            $this->output->set_status_header(200)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => true,
                             'data' => $transformed_data
                         ]));
            
        } catch (CustomException $e) {
            log_message('error', 'Error en get_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header($e->getHttpCode())
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => $e->getMessage()
                         ]));
        } catch (Exception $e) {
            log_message('error', 'Error en get_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header(500)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => 'Ocurrió un problema interno del servidor.'
                         ]));
        }
    }

    /**
     * POST /api/maquinaria/post_maquinaria
     * Inserta o actualiza una maquinaria.
     *
     * Payload esperado (ejemplo):
     * {
     *   "tipo_maquinaria_id": 1,
     *   "empresa_id": "10000000000",
     *   "placa": "ABC123",
     *   "serie": "SERIE001",
     *   "motor": "MOTOR001",
     *   "anio": 2020,
     *   "vehiculo_id": 5,
     *   "fecha_modificacion": "2025-02-03 12:00:00",
     *   "horometro": "1500.50",
     *   "fecha_ultimo_mantenimiento": "2025-01-15"
     * }
     */
    public function post_maquinaria(){
        try {
            // Validar token
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output->set_status_header(201)
                             ->set_content_type('application/json')
                             ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            // Recibir datos
            $payload = json_decode(file_get_contents('php://input'), true);
            if (empty($payload['empresa_id'])) {
                throw new CustomException('El campo empresa_id es obligatorio.', 400);
            }
            if (empty($payload['placa'])) {
                throw new CustomException('El campo placa es obligatorio.', 400);
            }
            
            // Determinar si se trata de una actualización o inserción
            $id = isset($payload['id']) ? trim($payload['id']) : null;
            $this->db->trans_begin();
            if (!empty($id)) {
                // Actualización
                $this->db->where('id', $id);
                $query = $this->db->get('maquinaria');
                if ($query->num_rows() == 0) {
                    $this->db->trans_rollback();
                    throw new CustomException('La maquinaria con este ID no existe.', 404);
                }
                $data = [
                    'tipo_maquinaria_id' => isset($payload['tipo_maquinaria_id']) ? $payload['tipo_maquinaria_id'] : null,
                    'empresa_id' => $payload['empresa_id'],
                    'placa' => $payload['placa'],
                    'serie' => isset($payload['serie']) ? $payload['serie'] : null,
                    'motor' => isset($payload['motor']) ? $payload['motor'] : null,
                    'anio' => isset($payload['anio']) ? $payload['anio'] : null,
                    'vehiculo_id' => isset($payload['vehiculo_id']) ? $payload['vehiculo_id'] : null,
                    'fecha_modificacion' => isset($payload['fecha_modificacion']) ? $payload['fecha_modificacion'] : date('Y-m-d H:i:s'),
                    'horometro' => isset($payload['horometro']) ? $payload['horometro'] : null,
                    'fecha_ultimo_mantenimiento' => isset($payload['fecha_ultimo_mantenimiento']) ? $payload['fecha_ultimo_mantenimiento'] : null
                ];
                $actualizado = $this->Maquinaria_m->actualizar('maquinaria', $id, $data);
                if (!$actualizado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al actualizar la maquinaria.', 500);
                }
                $maquinaria_id = $id;
            } else {
                // Inserción
                $data = [
                    'tipo_maquinaria_id' => isset($payload['tipo_maquinaria_id']) ? $payload['tipo_maquinaria_id'] : null,
                    'empresa_id' => $payload['empresa_id'],
                    'placa' => $payload['placa'],
                    'serie' => isset($payload['serie']) ? $payload['serie'] : null,
                    'motor' => isset($payload['motor']) ? $payload['motor'] : null,
                    'anio' => isset($payload['anio']) ? $payload['anio'] : null,
                    'vehiculo_id' => isset($payload['vehiculo_id']) ? $payload['vehiculo_id'] : null,
                    'fecha_modificacion' => isset($payload['fecha_modificacion']) ? $payload['fecha_modificacion'] : date('Y-m-d H:i:s'),
                    'horometro' => isset($payload['horometro']) ? $payload['horometro'] : null,
                    'fecha_ultimo_mantenimiento' => isset($payload['fecha_ultimo_mantenimiento']) ? $payload['fecha_ultimo_mantenimiento'] : null,
                    'estado' => 1,
                    'fecha_creacion' => date('Y-m-d H:i:s')
                ];
                $insertado = $this->Maquinaria_m->insertar('maquinaria', $data);
                if (!$insertado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al crear la maquinaria.', 500);
                }
                $maquinaria_id = $insertado['id'];
            }
            $this->db->trans_commit();
            
            // Obtener el registro actualizado/insertado y transformarlo para la respuesta
            $maquinariaActualizada = $this->Maquinaria_m->obtener_por_id('maquinaria', $maquinaria_id);
            $transformed_maquinaria = [
                'id' => $maquinariaActualizada['id'],
                'tipo_maquinaria_id' => $maquinariaActualizada['tipo_maquinaria_id'],
                'empresa_id' => $maquinariaActualizada['empresa_id'],
                'placa' => $maquinariaActualizada['placa'],
                'serie' => $maquinariaActualizada['serie'],
                'motor' => $maquinariaActualizada['motor'],
                'anio' => $maquinariaActualizada['anio'],
                'fecha_creacion' => $maquinariaActualizada['fecha_creacion'],
                'fecha_modificacion' => $maquinariaActualizada['fecha_modificacion'],
                'horometro' => $maquinariaActualizada['horometro'],
                'fecha_ultimo_mantenimiento' => $maquinariaActualizada['fecha_ultimo_mantenimiento'],
                'status' => ['inProgress' => ($maquinariaActualizada['estado'] == 1 ? 'Activo' : 'Inactivo')],
                'action' => ($maquinariaActualizada['estado'] == 1
                             ? ['edit' => 'edit', 'delete' => 'delete']
                             : ['edit' => 'edit', 'activate' => 'sync'])
            ];
            $this->output->set_status_header(200)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => true,
                             'message' => 'Maquinaria registrada/actualizada satisfactoriamente',
                             'data' => $transformed_maquinaria
                         ]));
            
        } catch (CustomException $e) {
            log_message('error', 'Error en post_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header($e->getHttpCode())
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => $e->getMessage()
                         ]));
        } catch (Exception $e) {
            log_message('error', 'Error en post_maquinaria: ' . $e->getMessage());
            $this->db->trans_rollback();
            $this->output->set_status_header(500)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => 'Error interno del servidor.'
                         ]));
        }
    }

    /**
     * DELETE /api/maquinaria/delete_maquinaria/{id}
     * Elimina lógicamente una maquinaria (cambia su estado a 0)
     */
    public function delete_maquinaria($id) {
        try {
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output->set_status_header(201)
                             ->set_content_type('application/json')
                             ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            if (empty($id)) {
                throw new CustomException('ID de la maquinaria es obligatorio.', 400);
            }
            $data = ['estado' => 0];
            $this->db->where('id', $id);
            $update = $this->db->update('maquinaria', $data);
            if (!$update) {
                throw new CustomException('Error al eliminar la maquinaria.', 500);
            }
            $this->output->set_status_header(200)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => true,
                             'message' => 'Maquinaria eliminada lógicamente con éxito.'
                         ]));
        } catch (CustomException $e) {
            log_message('error', 'Error en delete_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header($e->getHttpCode())
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => $e->getMessage()
                         ]));
        } catch (Exception $e) {
            log_message('error', 'Error en delete_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header(500)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => 'Error interno del servidor.'
                         ]));
        }
    }

    /**
     * PUT /api/maquinaria/reactivar_maquinaria/{id}
     * Reactiva una maquinaria (cambia su estado a 1)
     */
    public function reactivar_maquinaria($id) {
        try {
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output->set_status_header(201)
                             ->set_content_type('application/json')
                             ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            if (empty($id)) {
                throw new CustomException('ID de la maquinaria es obligatorio.', 400);
            }
            $data = ['estado' => 1];
            $this->db->where('id', $id);
            $update = $this->db->update('maquinaria', $data);
            if (!$update) {
                throw new CustomException('Error al reactivar la maquinaria.', 500);
            }
            $this->output->set_status_header(200)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => true,
                             'message' => 'Maquinaria reactivada con éxito.'
                         ]));
        } catch (CustomException $e) {
            log_message('error', 'Error en reactivar_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header($e->getHttpCode())
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => $e->getMessage()
                         ]));
        } catch (Exception $e) {
            log_message('error', 'Error en reactivar_maquinaria: ' . $e->getMessage());
            $this->output->set_status_header(500)
                         ->set_content_type('application/json')
                         ->set_output(json_encode([
                             'status' => false,
                             'error' => 'Error interno del servidor.'
                         ]));
        }
    }
}
