<?php

require APPPATH . 'libraries/ImplementJwt.php';
require APPPATH . 'libraries/CustomException.php';

require_once "BaseController.php";

header("Access-Control-Allow-Credentials: true");
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin, X-Requested-With, Content-Type, Accept, Authorization");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Content-Type: application/json; charset=UTF-8');

class Empleados extends BaseController {
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

    public function post_registrarEmpleado(){
        try {
            $this->db->trans_begin();
            // $data_token = json_decode($this->consultar_token(), true);
            // if (!$data_token) {
            //     throw new CustomException('Error al obtener el token.', 401); // 401 - No autorizado
            // }
            $postdata = file_get_contents("php://input");
            $request = json_decode($postdata, true);
            $field_mapping = [
                'nombres'   => 'empleado_nombres',
                'apellidos' => 'empleado_apellidos',
                'dni'       => 'empleado_dni',
                'direccion' => 'empleado_direccion',
                'email'     => 'empleado_email',
                'telefono'  => 'empleado_telefono',
                'clave'     => 'empleado_clave',
                'perfil' => 'perfil_id',
                'estado'    => 'estado',
                'empresa' => 'empresa_sede'
            ];
            $mapped_request = [];
            foreach ($field_mapping as $frontend_field => $backend_field) {
                if (isset($request[$frontend_field])) {
                    $mapped_request[$backend_field] = trim($request[$frontend_field]);
                }
            }
            $required_fields = array_values($field_mapping);
            foreach ($required_fields as $field) {
                if (!isset($mapped_request[$field]) || $mapped_request[$field] === null || $mapped_request[$field] === '') {
                    throw new CustomException("El campo {$field} es requerido.", 400);
                }
            }
            if (strlen($mapped_request['empleado_dni']) !== 8) {
                throw new CustomException("El DNI debe tener 8 dígitos.", 400);
            }
            if (!filter_var($mapped_request['empleado_email'], FILTER_VALIDATE_EMAIL)) {
                throw new CustomException("El correo no tiene un formato válido.", 400);
            }
            if (!ctype_digit($mapped_request['empleado_telefono'])) {
                throw new CustomException("El teléfono debe contener solo dígitos.", 400);
            }
            $clave_plana = $mapped_request['empleado_clave'];
            $mapped_request['password_hash'] = password_hash($clave_plana, PASSWORD_BCRYPT);
            unset($mapped_request['empleado_clave']);
            $result = $this->Servicio_m->insertar('empleados', $mapped_request); 
            if (!$result['estado']) {
                throw new CustomException($result['mensaje'], 400); // 400 - Solicitud incorrecta
            }
            if ($this->db->trans_status() === false) {
                $this->db->trans_rollback();
                throw new CustomException("Error en la transacción.", 500);
            } else {
                $this->db->trans_commit();
                $this->output
                    ->set_status_header(201)
                    ->set_content_type('application/json')
                    ->set_output(json_encode(['message' => 'Empleado registrado correctamente.']));
            }
        } catch (CustomException $e) {
            $this->db->trans_rollback();
            $this->output
                ->set_status_header($e->getHttpCode())
                ->set_content_type('application/json')
                ->set_output(json_encode(['error' => $e->getMessage()]));
        } catch (Exception $e) {
            $this->db->trans_rollback();
            $this->output
                ->set_status_header(500)
                ->set_content_type('application/json')
                ->set_output(json_encode(['error' => 'Ocurrió un problema interno del servidor.']));
        }
    }

    public function post_login(){
        try {
            $postdata = file_get_contents("php://input");
            $request = json_decode($postdata, true);
    
            $correo = isset($request['email']) ? $request['email'] : null;
            $clave = isset($request['password']) ? $request['password'] : null;
            if (empty($correo) || empty($clave)) {
                throw new CustomException('El correo y la clave son obligatorios.', 400);
            }
            $empleado = $this->Servicio_m->obtener_empleado_por_email($correo);
            if (!$empleado) {
                throw new CustomException('Correo no registrado.', 401);
            }

            if (!password_verify($clave, $empleado->password_hash)) {
                throw new CustomException('Clave incorrecta.', 401);
            }

            $token_data = [
                'id' => $empleado->empleado_id,
                'name' => "{$empleado->empleado_nombres} {$empleado->empleado_apellidos}",
                'email' => $empleado->empleado_email,
                'role' => [$empleado->perfil_id],
                'iat' => time(),
                'exp' => time() + 86400 // Token válido por 24 hora
            ];
            $token = $this->objOfJwt->GenerarToken($token_data);

            $this->output
                ->set_status_header(200)
                ->set_content_type('application/json')
                ->set_output(json_encode([
                    'token' => $token,
                    'user' => [
                        'id' => $empleado->empleado_id,
                        'name' => "{$empleado->empleado_nombres} {$empleado->empleado_apellidos}",
                        'email' => $empleado->empleado_email,
                        'role' => [$empleado->perfil_descripcion],
                        'avatar' => $empleado->empleado_foto_perfil,
                        'hasToChangePassword' => false
                    ]
                ]));
        } catch (CustomException $e) {
            $this->output
                ->set_status_header($e->getHttpCode())
                ->set_content_type('application/json')
                ->set_output(json_encode(['error' => $e->getMessage()]));
        } catch (Exception $e) {
            $this->output
                ->set_status_header(500)
                ->set_content_type('application/json')
                ->set_output(json_encode(['error' => 'Ocurrió un problema interno del servidor.']));
        }
    }
    
}