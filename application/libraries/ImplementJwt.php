<?php 
require APPPATH . 'libraries/JWT.php';

class ImplementJwt { 

    // Definir la clave para el token
    private $key = "GRUPOPINEDA";

    // Método para generar el token
    public function GenerarToken($data) {
        // Codifica el token con la clave y los datos
        $data['exp'] = time() + 3600;
        $jwt = JWT::encode($data, $this->key);
        return $jwt;
    }
 
    public function DecodeToken($token) {
        try {
            $decoded = JWT::decode($token, $this->key, array('HS256'));
            $decodeData = (array) $decoded;
            if (isset($decodeData['exp']) && $decodeData['exp'] < time()) {
                throw new Exception("Token expirado.");
            }
            return $decodeData;
        } catch (Exception $e) {
            // Si ocurre una excepción (token inválido o expirado)
            throw new Exception("Token inválido o expirado: " . $e->getMessage());
        }
    }
}
?>
