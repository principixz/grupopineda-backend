<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");

class Empresa extends BaseController {

    public function __construct(){
        parent::__construct();
        $this->load->model('Empresa_m');  
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
     * GET /api/empresa/get_empresas
     * Obtiene todas las empresas.
     */
    public function get_empresas() {
        try {
            // Obtener encabezados y validar token
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output
                     ->set_status_header(201)
                     ->set_content_type('application/json')
                     ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            
            // Obtener empresas desde el modelo
            $data['empresa'] = $this->Empresa_m->obtener_todos('empresa');
            if ($data['empresa'] === false) {
                throw new CustomException('No se pudieron obtener las empresas.', 500);
            }
            
            // Transformar la data (agregando campos de estado y acciones)
            $transformed_data = array_map(function($empresa) {
                $action = ($empresa['empresa_estado'] == 1) 
                    ? ['edit' => 'edit','vehiculos' => 'agriculture', 'delete' => 'delete'] 
                    : ['edit' => 'edit','vehiculos' => 'agriculture', 'activate' => 'sync'];
                return [
                    'empresa_ruc'             => $empresa['empresa_ruc'],
                    'empresa_razon_social'    => $empresa['empresa_razon_social'],
                    'empresa_nombre_comercial'=> $empresa['empresa_nombre_comercial'],
                    'empresa_direccion'       => $empresa['empresa_direccion'],
                    'empresa_telefono'        => $empresa['empresa_telefono'],
                    'empresa_correo'          => $empresa['empresa_correo'],
                    'status'                => ['inProgress' => ($empresa['empresa_estado'] == 1 ? 'Activo' : 'Inactivo')],
                    'action'                => $action
                ];
            }, $data['empresa']);
            
            $this->output
                 ->set_status_header(200)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => true,
                     'data' => $transformed_data
                 ]));
                 
        } catch (CustomException $e) {
            log_message('error', 'Error en get_empresas: ' . $e->getMessage());
            $this->output
                 ->set_status_header($e->getHttpCode())
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => $e->getMessage()
                 ]));
        } catch (Exception $e) {
            log_message('error', 'Error en get_empresas: ' . $e->getMessage());
            $this->output
                 ->set_status_header(500)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => 'Ocurrió un problema interno del servidor.'
                 ]));
        }
    }

    /**
     * POST /api/empresa/post_empresa
     * Inserta o actualiza una empresa.
     *
     * Payload esperado:
     * {
     *   "empresaRuc": "10000000000",
     *   "empresaRazonSocial": "Grupo Pineda",
     *   "empresaNombreComercial": "Grupo Pineda SAC",
     *   "empresaDireccion": "----",
     *   "empresaTelefono": "951728332",
     *   "empresaCorreo": "josmar08.31059@gmail.com"
     * }
     */
    public function post_empresa() {
        try {
            // Validar token
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output
                     ->set_status_header(201)
                     ->set_content_type('application/json')
                     ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            
            // Recibir datos del request (JSON)
            $nuevaEmpresa = json_decode(file_get_contents('php://input'), true);
            if (empty($nuevaEmpresa['empresaRuc'])) {
                throw new CustomException('El RUC de la empresa es obligatorio.', 400);
            }
            if (empty($nuevaEmpresa['empresaRazonSocial'])) {
                throw new CustomException('La razón social es obligatoria.', 400);
            }
            
            $empresaRuc = trim($nuevaEmpresa['empresaRuc']);
            $this->db->trans_begin();
            
            // Verificar si ya existe la empresa (por RUC)
            $this->db->where('empresa_ruc', $empresaRuc);
            $query = $this->db->get('empresa');
            
            if ($query->num_rows() > 0) {
                // Actualizar la empresa
                $data = [
                    'empresa_razon_social'    => $nuevaEmpresa['empresaRazonSocial'],
                    'empresa_nombre_comercial'=> isset($nuevaEmpresa['empresaNombreComercial']) ? $nuevaEmpresa['empresaNombreComercial'] : null,
                    'empresa_direccion'       => isset($nuevaEmpresa['empresaDireccion']) ? $nuevaEmpresa['empresaDireccion'] : null,
                    'empresa_telefono'        => isset($nuevaEmpresa['empresaTelefono']) ? $nuevaEmpresa['empresaTelefono'] : null,
                    'empresa_correo'          => isset($nuevaEmpresa['empresaCorreo']) ? $nuevaEmpresa['empresaCorreo'] : null,
                    'fecha_actualizacion'     => date('Y-m-d H:i:s')
                ];
                $actualizado = $this->Empresa_m->actualizar('empresa', $empresaRuc, $data);
                if (!$actualizado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al actualizar la empresa.', 500);
                }
                $id = $empresaRuc;
            } else {
                // Insertar nueva empresa
                $data = [
                    'empresa_ruc'             => $empresaRuc,
                    'empresa_razon_social'    => $nuevaEmpresa['empresaRazonSocial'],
                    'empresa_nombre_comercial'=> isset($nuevaEmpresa['empresaNombreComercial']) ? $nuevaEmpresa['empresaNombreComercial'] : null,
                    'empresa_direccion'       => isset($nuevaEmpresa['empresaDireccion']) ? $nuevaEmpresa['empresaDireccion'] : null,
                    'empresa_telefono'        => isset($nuevaEmpresa['empresaTelefono']) ? $nuevaEmpresa['empresaTelefono'] : null,
                    'empresa_correo'          => isset($nuevaEmpresa['empresaCorreo']) ? $nuevaEmpresa['empresaCorreo'] : null,
                    'empresa_estado'          => 1,
                    'fecha_creacion'          => date('Y-m-d H:i:s')
                ];
                $insertado = $this->Empresa_m->insertar('empresa', $data);
                if (!$insertado['estado']) {
                    $this->db->trans_rollback();
                    throw new CustomException('Error al crear la empresa.', 500);
                }
                $id = $insertado['empresa_ruc'];
            }
            $this->db->trans_commit();
            
            // Obtener la empresa actualizada/inserta para la respuesta
            $empresaActualizada = $this->Empresa_m->obtener_por_ruc('empresa', $id);  
            $transformed_empresa = [
                'empresa_ruc'             => $empresaActualizada['empresa_ruc'],
                'empresa_razon_social'    => $empresaActualizada['empresa_razon_social'],
                'empresa_nombre_comercial'=> $empresaActualizada['empresa_nombre_comercial'],
                'empresa_direccion'       => $empresaActualizada['empresa_direccion'],
                'empresa_telefono'        => $empresaActualizada['empresa_telefono'],
                'empresa_correo'          => $empresaActualizada['empresa_correo'],
                'status'                => [
                     'inProgress' => ($empresaActualizada['empresa_estado'] == 1 ? 'Activo' : 'Inactivo')
                ],
                'action'                => ($empresaActualizada['empresa_estado'] == 1
                                             ? ['edit' => 'edit','vehiculos' => 'agriculture', 'delete' => 'delete']
                                             : ['edit' => 'edit','vehiculos' => 'agriculture','activate' => 'sync'])
            ];
            $this->output
                 ->set_status_header(200)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => true,
                     'message' => 'Empresa registrada/actualizada satisfactoriamente',
                     'data' => $transformed_empresa
                 ]));
            
        } catch (CustomException $e) {
            log_message('error', 'Error en post_empresa: ' . $e->getMessage());
            $this->output
                 ->set_status_header($e->getHttpCode())
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => $e->getMessage()
                 ]));
        } catch (Exception $e) {
            log_message('error', 'Error en post_empresa: ' . $e->getMessage());
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

    /**
     * DELETE /api/empresa/delete_empresa/{id}
     * Elimina lógicamente una empresa (cambia su estado a 0)
     */
    public function delete_empresa($id) {
        try {
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output
                     ->set_status_header(201)
                     ->set_content_type('application/json')
                     ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            if (empty($id)) {
                throw new CustomException('RUC de la empresa es obligatorio.', 400);
            }
            
            $data = [
                'empresa_estado' => 0
            ];
            $this->db->where('empresa_ruc', $id);
            $update = $this->db->update('empresa', $data);
            if (!$update) {
                throw new CustomException('Error al eliminar la empresa.', 500);
            }
            
            $this->output
                 ->set_status_header(200)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => true,
                     'message' => 'Empresa eliminada lógicamente con éxito.'
                 ]));
                 
        } catch (CustomException $e) {
            log_message('error', 'Error en delete_empresa: ' . $e->getMessage());
            $this->output
                 ->set_status_header($e->getHttpCode())
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => $e->getMessage()
                 ]));
        } catch (Exception $e) {
            log_message('error', 'Error en delete_empresa: ' . $e->getMessage());
            $this->output
                 ->set_status_header(500)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => 'Error interno del servidor.'
                 ]));
        }
    }

    /**
     * PUT /api/empresa/reactivar_empresa/{id}
     * Reactiva una empresa (cambia su estado a 1)
     */
    public function reactivar_empresa($id) {
        try {
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers), true);
            if (isset($data_token['status']) && $data_token['status'] === false) {
                $this->output
                     ->set_status_header(201)
                     ->set_content_type('application/json')
                     ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
                return;
            }
            if (!$data_token) {
                throw new CustomException('Token de autorización inválido.', 401);
            }
            if (empty($id)) {
                throw new CustomException('RUC de la empresa es obligatorio.', 400);
            }
            
            $data = [
                'empresa_estado' => 1
            ];
            $this->db->where('empresa_ruc', $id);
            $update = $this->db->update('empresa', $data);
            if (!$update) {
                throw new CustomException('Error al reactivar la empresa.', 500);
            }
            
            $this->output
                 ->set_status_header(200)
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => true,
                     'message' => 'Empresa reactivada con éxito.'
                 ]));
                 
        } catch (CustomException $e) {
            log_message('error', 'Error en reactivar_empresa: ' . $e->getMessage());
            $this->output
                 ->set_status_header($e->getHttpCode())
                 ->set_content_type('application/json')
                 ->set_output(json_encode([
                     'status' => false,
                     'error' => $e->getMessage()
                 ]));
        } catch (Exception $e) {
            log_message('error', 'Error en reactivar_empresa: ' . $e->getMessage());
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
