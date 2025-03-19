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

    public function obtener_por_ruc($tabla, $id) {
        // Seleccionamos todos los campos de maquinaria y los campos descriptivos de las tablas relacionadas.
        $this->db->select("maquinaria.*, vehiculo.vehiculo_descripcion, modelo.modelo_descripcion, marca.marca_descripcion");
        $this->db->from($tabla);
        // Inner join con la tabla vehiculo usando la relación maquinaria.vehiculo_id = vehiculo.id
        $this->db->join('vehiculo', "maquinaria.vehiculo_id = vehiculo.id", 'inner');
        // Inner join con la tabla modelo usando vehiculo.modelo_id = modelo.id
        $this->db->join('modelo', "vehiculo.modelo_id = modelo.id", 'inner');
        // Inner join con la tabla marca usando modelo.marca_id = marca.marca_id
        $this->db->join('marca', "modelo.marca_id = marca.marca_id", 'inner');
        // Filtramos por empresa_id (se asume que en la tabla maquinaria el campo es empresa_id)
        $this->db->where("maquinaria.empresa_id", $id);
        $query = $this->db->get();
        return $query->result_array();
    }

    /**
     * Obtiene una maquinaria por su ID.
     */
    public function obtener_por_id($tabla, $id){
        $this->db->select('*');
        $this->db->where('empresa_id', $id);
        $query = $this->db->get($tabla);
        return $query->row_array();
    }
}
