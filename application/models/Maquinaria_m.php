<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Maquinaria_m extends CI_Model {

    public function __construct(){
        parent::__construct();
    }

    /**
     * Inserta una nueva maquinaria en la tabla.
     */
    public function insertar($tabla, $datos = array()){
        if($this->db->insert($tabla, $datos)){
            return [
                'estado' => true,
                'id' => $this->db->insert_id(),
                'mensaje' => 'Maquinaria registrada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar la maquinaria.'
            ];
        }
    }

    /**
     * Actualiza una maquinaria existente.
     */
    public function actualizar($tabla, $id, $datos = array()){
        $this->db->where('id', $id);
        if($this->db->update($tabla, $datos)){
            return [
                'estado' => true,
                'mensaje' => 'Maquinaria actualizada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar la maquinaria.'
            ];
        }
    }

    /**
     * Obtiene todas las maquinarias.
     */
    public function obtener_todos($tabla){
        $this->db->select('*');
        $query = $this->db->get($tabla);
        return $query->result_array();
    }

    /**
     * Obtiene una maquinaria por su ID.
     */
    public function obtener_por_id($tabla, $id){
        $this->db->select('*');
        $this->db->where('id', $id);
        $query = $this->db->get($tabla);
        return $query->row_array();
    }
}
