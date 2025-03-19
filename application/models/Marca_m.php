<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Marca_m extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function insertar($tabla, $datos = array()) {
        // Asegúrate de que los campos del formulario o los datos coincidan con los de la tabla
        // Ejemplo: validar si el nombre de la marca ya existe
        $this->db->where('marca_descripcion', $datos['marca_descripcion']);
        $query = $this->db->get($tabla);
    
        // Verifica si ya existe la marca con el nombre proporcionado
        if ($query->num_rows() > 0) {
            return [
                'estado' => false,
                'mensaje' => 'La marca con este nombre ya existe.'
            ];
        }
    
        // Intentar insertar el nuevo registro
        if ($this->db->insert($tabla, $datos)) {
            // Devolver el estado de la inserción junto con el ID de la nueva marca
            return [
                'estado' => true,
                'marca_id' => $this->db->insert_id(),  // Obtener el último ID insertado
                'mensaje' => 'Marca registrada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar la marca.'
            ];
        }
    }

    public function actualizar($tabla, $marca_id, $datos = array()) {
        $this->db->where('marca_id', $marca_id);
        if ($this->db->update($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Marca actualizada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar la marca.'
            ];
        }
    }
    public function obtener_todos($tabla){
        $query = $this->db->get($tabla); // Obtener todos los registros de la tabla
        return $query->result_array(); // Retorna los resultados como un array
    }

    public function obtener_activos($tabla){
        $this->db->where('marca_estado', 1); 
        $query = $this->db->get($tabla); // Obtener todos los registros de la tabla
        return $query->result_array(); // Retorna los resultados como un array
    }

    public function obtener_por_id($tabla, $id){
        $this->db->where('id_marca', $id); 
        $query = $this->db->get($tabla);
        return $query->row_array(); 
    }

    public function obtener_campos_especificos($tabla, $campos = array()){
        if (count($campos) > 0) {
            $this->db->select($campos);  // Especifica los campos que deseas obtener
        } else {
            $this->db->select('*');  // Si no se pasan campos, se seleccionan todos
        }

        $query = $this->db->get($tabla);  // Ejecuta la consulta
        return $query->result_array();  // Devuelve los resultados como un array
    }
}