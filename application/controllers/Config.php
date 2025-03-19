<?php

require APPPATH . 'libraries/ImplementJwt.php'; 
require APPPATH . 'libraries/CustomException.php';
require_once "BaseController.php";

header("Access-Control-Allow-Credentials: true");
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin, X-Requested-With, Content-Type, Accept, Authorization");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Content-Type: application/json; charset=UTF-8');

class Config extends BaseController {
    public function __construct(){
        parent::__construct();
        $this->load->model('Servicio_m');
        $this->objOfJwt = new ImplementJwt();
        $this->handleCors();
    }

    private function handleCors()
    {
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

     public function custom_definition() {
        try {
            $headers = $this->input->request_headers();
            $data_token = json_decode($this->consultar_token($headers),true); 
            if (isset($data_token['status']) && $data_token['status'] === false) {
                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
                $this->output
                    ->set_status_header(201) // Código 401 - Unauthorized
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
                return; // Detener la ejecución
            }
            
            // Si el token es válido, continuar con el flujo normal
            if (!$data_token) {
                throw new CustomException('Error al obtener el token.', 401); // 401 - No autorizado
            }
            $modulosPrincipales = $this->db->select('m.modulo_id, m.modulo_nombre, m.modulo_icono, m.modulo_url')
                ->from('modulos m')
                ->where('m.modulo_padre IS NULL')
                ->where('m.estado', 1)
                ->order_by('m.modulo_orden', 'ASC')
                ->get()
                ->result_array(); 
            $menu = [];
    
            foreach ($modulosPrincipales as $modulo) {
                // Obtener los submódulos para cada módulo principal, ordenados por modulo_orden
                $subModulos = $this->db->select('m.modulo_id, m.modulo_nombre, m.modulo_icono, m.modulo_url')
                    ->from('modulos m')
                    ->where('m.modulo_padre', $modulo['modulo_id'])
                    ->where('m.estado', 1)
                    ->order_by('m.modulo_orden', 'ASC')
                    ->get()
                    ->result_array();
    
                // Obtener roles asociados al módulo principal
                $rolesPadre = $this->db->select('p.perfil_descripcion')
                    ->from('permisos pr')
                    ->join('perfiles p', 'pr.perfil_id = p.perfil_id')
                    ->where('pr.modulo_id', $modulo['modulo_id'])
                    ->get()
                    ->result_array();
                
                // Convertir roles en un array simple
                $rolesPadre = array_column($rolesPadre, 'perfil_descripcion');
    
                // Construir la estructura del submenú
                $subMenu = [];
                foreach ($subModulos as $subModulo) {
                    // Obtener roles asociados al submódulo
                    $rolesSub = $this->db->select('p.perfil_descripcion')
                        ->from('permisos pr')
                        ->join('perfiles p', 'pr.perfil_id = p.perfil_id')
                        ->where('pr.modulo_id', $subModulo['modulo_id'])
                        ->get()
                        ->result_array();
    
                    // Convertir roles en un array simple
                    $rolesSub = array_column($rolesSub, 'perfil_descripcion');
    
                    $subMenu[] = [
                        'icon' => $subModulo['modulo_icono'],
                        'name' => $subModulo['modulo_nombre'],
                        'state' => $subModulo['modulo_url'] ?? '/default/url',
                        'type' => 'link',
                        'roles' => $rolesSub, // Roles dinámicos para submódulos
                    ];
                }
    
                // Agregar el módulo principal con o sin submenú
                $menu[] = [
                    'name' => $modulo['modulo_nombre'],
                    'description' => 'Vea los principales indicadores de desempeño.',
                    'type' => empty($subMenu) ? 'link' : 'dropDown',
                    'state' => $modulo['modulo_url'] ?? null,
                    'icon' => $modulo['modulo_icono'],
                    'sub' => !empty($subMenu) ? $subMenu : null,
                    'roles' => $rolesPadre, // Roles dinámicos para el módulo principal
                ];
            }
    
            $response = [
                'properties' => [
                    'customMenu' => $menu
                ]
            ];
            // Enviar el menú como JSON
            $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode($response, JSON_PRETTY_PRINT));
        } catch (Exception $e) {
            $this->output
                ->set_status_header(500)
                ->set_content_type('application/json')
                ->set_output(json_encode(['error' => 'Ocurrió un problema al generar el menú.']));
        }
    }
    
    
}