<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Producto_m extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function obtener_todos($tabla){
        $query = $this->db->get($tabla); // Obtener todos los registros de la tabla
        return $query->result_array(); // Retorna los resultados como un array
    }

    public function insertar($tabla, $datos = array()) {
        if ($this->db->insert($tabla, $datos)) {
            return [
                'estado' => true,
                'producto_id' => $this->db->insert_id(),
                'mensaje' => 'Producto registrado con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar el producto.'
            ];
        }
    }

    public function actualizar($tabla, $id, $datos = array()) {
        $this->db->where('producto_id', $id);
        if ($this->db->update($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Producto actualizado con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar el producto.'
            ];
        }
    }
}