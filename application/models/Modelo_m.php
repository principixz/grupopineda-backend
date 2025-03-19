<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Modelo_m extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function insertar($tabla, $datos = array()) {
        // Asegúrate de que los campos del formulario o los datos coincidan con los de la tabla
        // Ejemplo: validar si el nombre de la modelo ya existe
        $this->db->where('modelo_descripcion', $datos['modelo_descripcion']);
        $query = $this->db->get($tabla);
    
        // Verifica si ya existe la modelo con el nombre proporcionado
        if ($query->num_rows() > 0) {
            return [
                'estado' => false,
                'mensaje' => 'La modelo con este nombre ya existe.'
            ];
        }
    
        // Intentar insertar el nuevo registro
        if ($this->db->insert($tabla, $datos)) {
            // Devolver el estado de la inserción junto con el ID de la nueva modelo
            return [
                'estado' => true,
                'id' => $this->db->insert_id(),  // Obtener el último ID insertado
                'mensaje' => 'Modelo registrada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar la modelo.'
            ];
        }
    }

    public function actualizar($tabla, $id, $datos = array()) {
        $this->db->where('id', $id);
        if ($this->db->update($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Modelo actualizada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar la modelo.'
            ];
        }
    }
    public function obtener_todos($tabla){
        $this->db->select('mo.id,
        mo.marca_id, 
        mo.modelo_descripcion, 
        mo.modelo_estado, 
        mo.fecha_creacion, 
        mo.fecha_actualizacion,
        m.marca_descripcion');
        $this->db->from('modelo mo');
        $this->db->join('marca m', 'mo.marca_id = m.marca_id', 'inner'); 
        $query = $this->db->get();
        return $query->result_array(); // Retorna los resultados como un array
    }

    public function obtener_activos($tabla){
        $this->db->select("
        mo.id,
        CONCAT(m.marca_descripcion, '-', mo.modelo_descripcion) AS modelo_descripcion,
        mo.modelo_estado,
        mo.fecha_creacion,
        mo.fecha_actualizacion,
        CONCAT(m.marca_descripcion, '-', mo.modelo_descripcion) AS marca_descripcion ,
        ");
        $this->db->from("modelo mo");
        $this->db->join("marca m", "mo.marca_id = m.marca_id", "inner");
        $this->db->where("mo.modelo_estado", 1);
        $query = $this->db->get();
        return $query->result_array(); // Retorna los resultados como un array
    }

    // Método para obtener una modelo por su ID
    public function obtener_por_id($tabla, $id){
        $this->db->select('mo.id,
        mo.marca_id, 
        mo.modelo_descripcion, 
        mo.modelo_estado, 
        mo.fecha_creacion, 
        mo.fecha_actualizacion, 
        m.marca_id, 
        m.marca_descripcion');
        $this->db->from('modelo mo');
        $this->db->join('marca m', 'mo.marca_id = m.marca_id', 'inner'); 
        $this->db->where('mo.id', $id);
        $query = $this->db->get();
        return $query->row_array(); // Retorna el primer registro como un array
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