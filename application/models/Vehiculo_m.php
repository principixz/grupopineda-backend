<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Vehiculo_m extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function insertar($tabla, $datos = array()) {
        // Asegúrate de que los campos del formulario o los datos coincidan con los de la tabla
        // Ejemplo: validar si el nombre de la vehiculo ya existe
        $this->db->where('vehiculo_descripcion', $datos['vehiculo_descripcion']);
        $query = $this->db->get($tabla);
    
        // Verifica si ya existe la vehiculo con el nombre proporcionado
        if ($query->num_rows() > 0) {
            return [
                'estado' => false,
                'mensaje' => 'La vehiculo con este nombre ya existe.'
            ];
        }
    
        // Intentar insertar el nuevo registro
        if ($this->db->insert($tabla, $datos)) {
            // Devolver el estado de la inserción junto con el ID de la nueva vehiculo
            return [
                'estado' => true,
                'id' => $this->db->insert_id(),  // Obtener el último ID insertado
                'mensaje' => 'Vehiculo registrada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar la vehiculo.'
            ];
        }
    }

    public function actualizar($tabla, $id, $datos = array()) {
        $this->db->where('id', $id);
        if ($this->db->update($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Vehiculo actualizada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar la vehiculo.'
            ];
        }
    }
    public function obtener_todos($tabla){
        $this->db->select('ve.id,
        ve.modelo_id,
        ve.vehiculo_descripcion,
        ve.vehiculo_estado,
        ve.fecha_creacion, 
        mo.marca_id, 
        mo.modelo_descripcion,  
        m.marca_descripcion');
        $this->db->from('vehiculo ve');
        $this->db->join('modelo mo', 'mo.id = ve.modelo_id', 'inner');
        $this->db->join('marca m', 'm.marca_id = mo.marca_id', 'inner'); 
        $query = $this->db->get();
        return $query->result_array(); // Retorna los resultados como un array
    }

    // Método para obtener una vehiculo por su ID
    public function obtener_por_id($tabla, $id){
        $this->db->select('ve.id,
        ve.modelo_id,
        ve.vehiculo_descripcion,
        ve.vehiculo_estado,
        ve.fecha_creacion, 
        mo.marca_id, 
        mo.modelo_descripcion,  
        m.marca_descripcion');
        $this->db->from('vehiculo ve');
        $this->db->join('modelo mo', 'mo.id = ve.modelo_id', 'inner');
        $this->db->join('marca m', 'm.marca_id = mo.marca_id', 'inner');  
        $this->db->where('ve.id', $id);
        $query = $this->db->get();
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