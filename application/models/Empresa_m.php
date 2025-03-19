<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Empresa_m extends CI_Model {

    public function __construct(){
        parent::__construct();
    }

    /**
     * Inserta una nueva empresa en la tabla.
     */
    public function insertar($tabla, $datos = array()) {
        // Verificar si ya existe una empresa con el mismo RUC
        $this->db->where('empresa_ruc', $datos['empresa_ruc']);
        $query = $this->db->get($tabla);
        if ($query->num_rows() > 0) {
            return [
                'estado' => false,
                'mensaje' => 'La empresa con este RUC ya existe.'
            ];
        }
        if ($this->db->insert($tabla, $datos)) {
            return [
                'estado' => true,
                'empresa_ruc' => $datos['empresa_ruc'],
                'mensaje' => 'Empresa registrada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar la empresa.'
            ];
        }
    }

    /**
     * Actualiza una empresa existente.
     */
    public function actualizar($tabla, $empresa_ruc, $datos = array()) {
        $this->db->where('empresa_ruc', $empresa_ruc);
        if ($this->db->update($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Empresa actualizada con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al actualizar la empresa.'
            ];
        }
    }

    /**
     * Obtiene todas las empresas.
     */
    public function obtener_todos($tabla){
        $this->db->select('*');
        $query = $this->db->get($tabla);
        return $query->result_array();
    }

    /**
     * Obtiene una empresa por su RUC.
     */
    public function obtener_por_ruc($tabla, $empresa_ruc){
        $this->db->select('*');
        $this->db->where('empresa_ruc', $empresa_ruc);
        $query = $this->db->get($tabla);
        return $query->row_array();
    }
 
}
?>
