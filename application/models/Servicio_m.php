<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Servicio_m extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    public function insertar($tabla, $datos = array()){
        $this->db->where('empleado_dni', $datos['empleado_dni']);
        $query = $this->db->get($tabla);
    
        if ($query->num_rows() > 0) {
            return [
                'estado' => false,
                'mensaje' => 'El empleado con este DNI ya existe.'
            ];
        }
    
        // Intentar insertar el nuevo registro
        if ($this->db->insert($tabla, $datos)) {
            return [
                'estado' => true,
                'mensaje' => 'Empleado registrado con éxito.'
            ];
        } else {
            return [
                'estado' => false,
                'mensaje' => 'Error al registrar el empleado.'
            ];
        }
    }

    public function validar_login($correo, $clave){
        $this->db->where('empleado_email', $correo);
        $query = $this->db->get('empleados');
        if ($query->num_rows() === 0) {
            return [
                'estado' => false,
                'mensaje' => 'Correo no registrado.'
            ];
        }
        $empleado = $query->row();
        if (!password_verify($clave, $empleado->password_hash)) {
            return [
                'estado' => false,
                'mensaje' => 'Clave incorrecta.'
            ];
        }
        return [
            'estado' => true,
            'mensaje' => 'Login exitoso.',
            'datos' => [
                'empleado_id' => $empleado->empleado_id,
                'nombre' => $empleado->empleado_nombres,
                'apellido' => $empleado->empleado_apellidos,
                'email' => $empleado->empleado_email,
                'perfil_id' => $empleado->perfil_id
            ]
        ];
    }

    public function obtener_empleado_por_email($email) {
        $this->db->select('
            empleados.empleado_id,
            empleados.empleado_nombres,
            empleados.empleado_apellidos,
            empleados.empleado_email,
            empleados.password_hash,
            empleados.empleado_foto_perfil,
            empleados.estado,
            perfiles.perfil_id,
            perfiles.perfil_descripcion
        ');
        $this->db->from('empleados');
        $this->db->join('perfiles', 'empleados.perfil_id = perfiles.perfil_id');
        $this->db->where('empleados.empleado_email', $email);
        $query = $this->db->get();
    
        return $query->row(); 
    }
    

    public function get_servicios($tipoproducto_id = null) {
        try {
            if (empty($tipoproducto_id)) {
                $this->db->select("
                    tipo_membresia_id as id,
                    tipo_membresia_descripcion AS nombre_servicio,
                    CONCAT('S/. ', FORMAT(tipo_membresia_precio_mes, 2)) AS precio_servicio,
                    CONCAT(
                        CASE 
                            WHEN tipo_membresia_tipoperiodo = '01' THEN 'Ilimitado'
                            WHEN tipo_membresia_tipoperiodo = '02' THEN 'Temporal'
                            ELSE 'Desconocido' -- Opcional
                        END,
                        ' (',
                        CASE 
                            WHEN tipo_membresia_tipoperiodo = '01' THEN 'Sin Fecha Fin'
                            ELSE CONCAT(tipo_membresia_fechainicio, ' / ', tipo_membresia_fechafin)
                        END,
                        ')'
                    ) AS tipo_periodo,
                    CASE 
                        WHEN tipo_membresia_categoriamembresia = '01' THEN 'Individual'
                        WHEN tipo_membresia_categoriamembresia = '02' THEN CONCAT('Grupal (', tipo_membresia_cantidadpersona, ')')
                        ELSE 'Desconocido' -- Opcional
                    END AS categoria_membresia,
                    CASE 
                        WHEN tipo_membresia_tipopago = '01' THEN 
                                CASE 
                                    WHEN tipo_membresia_duracion = 1 THEN '1 día'
                                    ELSE CONCAT(tipo_membresia_duracion, ' días')
                                END
                        WHEN tipo_membresia_tipopago = '02' THEN 
                                CASE 
                                    WHEN tipo_membresia_duracion = 1 THEN '1 Mes'
                                    ELSE CONCAT(tipo_membresia_duracion, ' Meses')
                                END
                        WHEN tipo_membresia_tipopago = '03' THEN 
                                CASE 
                                    WHEN tipo_membresia_duracion = 1 THEN '1 Año'
                                    ELSE CONCAT(tipo_membresia_duracion, ' Años')
                                END
                        ELSE 'Desconocido'
                    END AS tipo_pago,
                    CASE
                        WHEN tipo_membresia_estado = '0' THEN 'Inactivo'
                        WHEN tipo_membresia_estado = '1' THEN 'Activo'
                        ELSE 'Desconocido' -- Opcional
                    END AS estado
                ", false);
            }else{
                $this->db->select("*");
            }

            $this->db->from('tipo_membresia');
            //$this->db->where('tipo_membresia_estado',"1");
            if (!empty($tipoproducto_id)) {
                $this->db->where('tipo_membresia_id', $tipoproducto_id);
            }
            $query = $this->db->get();
            if (!$query) {
                throw new Exception('Error en la consulta de Paquetes.');
            }
            return $query->result();
        }catch (Exception $e) {
            log_message('error', 'Error en get_servicios: ' . $e->getMessage());
            return false;
        }
    }

    public function get_membresia_buscar($descripcion = null) {
        try {
            $this->db->select("
                tipo_membresia_id as id,
                tipo_membresia_descripcion AS nombre_servicio,
                FORMAT(tipo_membresia_precio_mes, 2) AS precio_servicio,
                CONCAT(
                    CASE 
                        WHEN tipo_membresia_tipoperiodo = '01' THEN 'Ilimitado'
                        WHEN tipo_membresia_tipoperiodo = '02' THEN 'Temporal'
                        ELSE 'Desconocido'
                    END,
                    ' (',
                    CASE 
                        WHEN tipo_membresia_tipoperiodo = '01' THEN 'Sin Fecha Fin'
                        ELSE CONCAT(tipo_membresia_fechainicio, ' / ', tipo_membresia_fechafin)
                    END,
                    ')'
                ) AS tipo_periodo,
                CASE 
                    WHEN tipo_membresia_categoriamembresia = '01' THEN 'Individual'
                    WHEN tipo_membresia_categoriamembresia = '02' THEN CONCAT('Grupal (', tipo_membresia_cantidadpersona, ')')
                    ELSE 'Desconocido'
                END AS categoria_membresia,
                CASE 
                    WHEN tipo_membresia_tipopago = '01' THEN 
                            CASE 
                                WHEN tipo_membresia_duracion = 1 THEN '1 día'
                                ELSE CONCAT(tipo_membresia_duracion, ' días')
                            END
                    WHEN tipo_membresia_tipopago = '02' THEN 
                            CASE 
                                WHEN tipo_membresia_duracion = 1 THEN '1 Mes'
                                ELSE CONCAT(tipo_membresia_duracion, ' Meses')
                            END
                    WHEN tipo_membresia_tipopago = '03' THEN 
                            CASE 
                                WHEN tipo_membresia_duracion = 1 THEN '1 Año'
                                ELSE CONCAT(tipo_membresia_duracion, ' Años')
                            END
                    ELSE 'Desconocido'
                END AS tipo_pago,
                CASE
                    WHEN tipo_membresia_estado = '0' THEN 'Inactivo'
                    WHEN tipo_membresia_estado = '1' THEN 'Activo'
                    ELSE 'Desconocido'
                END AS estado
            ", false);
            $this->db->from('tipo_membresia');
    
            // Aplica el filtro por descripción si está definido
            if (!empty($descripcion)) {
                $this->db->like('tipo_membresia_descripcion', $descripcion);
            }
    
            $query = $this->db->get();
    
            if (!$query) {
                throw new Exception('Error en la consulta de búsqueda de membresías.');
            }
    
            return $query->result();
        } catch (Exception $e) {
            log_message('error', 'Error en get_membresia_buscar: ' . $e->getMessage());
            return false;
        }
    }

    public function insertar_servicio($data) {
        // Prepara los datos para la inserción
        $servicio_data = [
            'tipo_membresia_descripcion' => $data['tipo_membresia_descripcion'], // Asegúrate de que estos nombres coincidan con los de tu base de datos
            'tipo_membresia_precio_mes' => $data['tipo_membresia_precio_mes'],
            'tipo_membresia_duracion' => $data['tipo_membresia_duracion'],
            'tipo_membresia_tipoperiodo' => $data['tipo_membresia_tipoperiodo'],
            'tipo_membresia_fechainicio' => $data['tipo_membresia_fechainicio'],
            'tipo_membresia_fechafin' => $data['tipo_membresia_fechafin'],
            'tipo_membresia_categoriamembresia' => $data['tipo_membresia_categoriamembresia'],
            'tipo_membresia_tipopago' => $data['tipo_membresia_tipopago'],
            'tipo_membresia_cantidadpersona' => $data['tipo_membresia_cantidadpersona']     
        ];

        // Intenta realizar la inserción en la tabla correspondiente
        try {
            if ($this->db->insert('tipo_membresia', $servicio_data)) {
                return true; // Retorna verdadero si la inserción fue exitosa
            } else {
                // Manejo de error si la inserción falla
                $error = $this->db->error(); // Obtiene el error de la base de datos
                log_message('error', 'Error al insertar tipo membresia: ' . $error['message']);
                return false; // Retorna falso si hubo un error
            }
        } catch (Exception $e) {
            // Captura excepciones y registra el error
            log_message('error', 'Excepción al insertar tipo membresia: ' . $e->getMessage());
            return false; // Retorna falso en caso de excepción
        }
    }

    public function editar_servicio($data) {
        $this->db->where('tipo_membresia_id', $data['tipo_membresia_id']);
        unset($data['tipo_membresia_id']); // Eliminar el ID del array para no actualizarlo

        // Intenta realizar la actualización
        try {
            if ($this->db->update('tipo_membresia', $data)) {
                return true; // Retorna verdadero si la actualización fue exitosa
            } else {
                // Manejo de error si la actualización falla
                $error = $this->db->error(); // Obtiene el error de la base de datos
                log_message('error', 'Error al actualizar producto: ' . $error['message']);
                return false; // Retorna falso si hubo un error
            }
        } catch (Exception $e) {
            // Captura excepciones y registra el error
            log_message('error', 'Excepción al actualizar producto: ' . $e->getMessage());
            return false; // Retorna falso en caso de excepción
        }
    }

    public function obtener_tipo_membresia_por_id($tipo_membresia_id) {
        try {
            $this->db->select('*');
            $this->db->from('tipo_membresia');
            $this->db->where('tipo_membresia_id', $tipo_membresia_id);
            $query = $this->db->get();
    
            if ($query === false) {
                // Manejo de errores en la consulta
                $error = $this->db->error();
                log_message('error', 'Error al obtener tipo de membresía: ' . $error['message']);
                return false;
            }
    
            if ($query->num_rows() > 0) {
                return $query->row(); // Retorna el registro como objeto
            } else {
                return false; // No se encontró el tipo de membresía
            }
        } catch (Exception $e) {
            // Captura de excepciones y registro del error
            log_message('error', 'Excepción al obtener tipo de membresía: ' . $e->getMessage());
            return false;
        }
    }

    public function obtener_cliente_por_id($id_cliente) {
        try {
            $this->db->select('*'); // Asegúrate de que 'numero_dni' está incluido
            $this->db->from('clientes'); // Reemplaza 'clientes' con el nombre real de tu tabla de clientes
            $this->db->where('cliente_id', $id_cliente);
            $query = $this->db->get();
    
            if ($query === false) {
                $error = $this->db->error();
                log_message('error', 'Error al obtener cliente: ' . $error['message']);
                return false;
            }
    
            if ($query->num_rows() > 0) {
                return $query->row();
            } else {
                // Manejar el caso donde no se encuentra el cliente
                return null;
            }
        } catch (Exception $e) {
            log_message('error', 'Excepción al obtener cliente: ' . $e->getMessage());
            return false;
        }
    }

    public function obtener_ultima_venta_membresia_por_dni($id_cliente) {
        try {
            // Verificar que el DNI no esté vacío
            if (empty($dni_cliente)) {
                throw new Exception('El DNI del cliente es requerido.');
            }
    
            $this->db->select('*');
            $this->db->from('membresia');
            $this->db->where('cliente_id', $id_cliente);
            $this->db->order_by('membresia_fecha_fin', 'DESC');
            $this->db->limit(1);
            $query = $this->db->get();
    
            if ($query === false) {
                // Manejo de errores en la consulta
                $error = $this->db->error();
                log_message('error', 'Error al obtener la última venta de membresía por DNI: ' . $error['message']);
                return false;
            }
    
            if ($query->num_rows() > 0) {
                return $query->row(); // Retorna el registro como objeto
            } else {
                // No se encontró ninguna venta de membresía para el DNI proporcionado
                return null;
            }
        } catch (Exception $e) {
            // Captura de excepciones y registro del error
            log_message('error', 'Excepción al obtener la última venta de membresía por DNI: ' . $e->getMessage());
            return false;
        }
    }

    public function insertar_venta_membresia($data) {
        try {
            if ($this->db->insert('venta_tipomembresia', $data)) {
                return true;
            } else {
                $error = $this->db->error();
                log_message('error', 'Error al insertar venta_tipomembresia: ' . $error['message']);
                return false;
            }
        } catch (Exception $e) {
            log_message('error', 'Excepción al insertar venta_tipomembresia: ' . $e->getMessage());
            return false;
        }
    }
    
    public function verificar_cliente_por_dni($dni)
    {
        try {
            $this->db->select('*');
            $this->db->from('clientes');
            $this->db->where('cliente_dni', $dni);
            $query = $this->db->get();

            if ($query->num_rows() > 0) {
                return $query->row(); // Retorna el cliente si existe
            } else {
                return null; // No existe el cliente
            }
        } catch (Exception $e) {
            log_message('error', 'Error en verificar_cliente_por_dni: ' . $e->getMessage());
            return false;
        }
    }
    // Buscar membresías válidas por cliente_id y fecha_vencimiento
    public function buscar_membresias_validas($cliente_id)
    {
        try {
            $this->db->select('*');
            $this->db->from('membresia');
            $this->db->where('cliente_id', $cliente_id);
            $this->db->where('membresia_fecha_fin >=', date('Y-m-d')); // Fecha superior a la actual
            $query = $this->db->get();

            if ($query->num_rows() > 0) {
                return $query->result(); // Retorna las membresías válidas
            } else {
                return null; // No hay membresías válidas
            }
        } catch (Exception $e) {
            log_message('error', 'Error en buscar_membresias_validas: ' . $e->getMessage());
            return false;
        }
    }
    public function registrar_cliente($data)
    {
        try {
            if ($this->db->insert('clientes', $data)) {
                return $this->db->insert_id(); // Retorna el ID del nuevo cliente
            } else {
                $error = $this->db->error();
                log_message('error', 'Error al registrar cliente: ' . $error['message']);
                return false;
            }
        } catch (Exception $e) {
            log_message('error', 'Excepción al registrar cliente: ' . $e->getMessage());
            return false;
        }
    }

    public function actualizar_membresia($membresia_id, $nueva_fecha_fin){
        try {
            $data = [];
            if (!is_null($nueva_fecha_fin)) {
                $data['membresia_fecha_fin'] = $nueva_fecha_fin;
            }
    
            if (!empty($data)) {
                $this->db->where('membresia_id', $membresia_id);
                if ($this->db->update('membresia', $data)) {
                    return true;
                } else {
                    $error = $this->db->error();
                    log_message('error', 'Error al actualizar membresía: ' . $error['message']);
                    return false;
                }
            }
            return true; // No hubo cambios porque `nueva_fecha_fin` es null
        } catch (Exception $e) {
            log_message('error', 'Excepción al actualizar membresía: ' . $e->getMessage());
            return false;
        }
    }

    public function actualizar_cliente_y_membresia($cliente_id, $actualizacion_cliente, $membresia_id = null, $nueva_fecha_fin = null){
        $this->db->trans_start(); // Inicia la transacción
    
        try {
            // Verificar cliente existente
            $cliente_existente = $this->db->get_where('clientes', ['cliente_id' => $cliente_id])->row();
            if (!$cliente_existente) {
                throw new Exception('El cliente con ID ' . $cliente_id . ' no existe.');
            }
    
            // Actualizar membresía si corresponde
            if (!is_null($membresia_id) && !is_null($nueva_fecha_fin)) {
                $nueva_fecha_fin = date('Y-m-d', strtotime($nueva_fecha_fin)); // Formatear fecha
                $this->db->where('membresia_id', $membresia_id);
                $this->db->update('membresia', ['membresia_fecha_fin' => $nueva_fecha_fin]);
                $error = $this->db->error();
                if ($error['code'] !== 0) { // Un código diferente de 0 indica un error
                    throw new Exception('Error al actualizar la membresía: ' . $error['message']);
                }
            }
    
            // Actualizar cliente
            $this->db->where('cliente_id', $cliente_id);
            $this->db->update('clientes', $actualizacion_cliente);
    
            $error = $this->db->error();
            if ($error['code'] !== 0) { // Un código diferente de 0 indica un error
                throw new Exception('Error al actualizar cliente: ' . $error['message']);
            }
    
            $this->db->trans_complete(); // Finaliza la transacción
    
            if ($this->db->trans_status() === false) {
                throw new Exception('Transacción fallida.');
            }
    
            return true;
        } catch (Exception $e) {
            $this->db->trans_rollback(); // Revertir transacción
            log_message('error', 'Error en actualizar_cliente_y_membresia: ' . $e->getMessage());
            return false;
        }
    }

    public function buscar_clientes( $search) {

        // Consulta base con límite de 10
        $sql = "SELECT 
                clientes.cliente_id, 
                clientes.cliente_nombres, 
                tipo_membresia.tipo_membresia_descripcion AS cliente_direccion,
                IF(clientes.cliente_dni IS NULL, 'No cuenta con D.N.I', clientes.cliente_dni) AS cliente_dni 
            FROM clientes
            LEFT JOIN tipo_membresia ON clientes.cliente_tipomembresia = tipo_membresia.tipo_membresia_id
            WHERE clientes.estado = 1 
              AND (clientes.cliente_nombres LIKE ? OR clientes.cliente_dni LIKE ? ) 
            LIMIT 10";

        // Parámetros de búsqueda
        $params = ["%$search%", "%$search%"];

        // Ejecutar la consulta
        try {
            $query = $this->db->query($sql, $params);
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en buscar_clientes: ' . $e->getMessage());
            throw $e; // Relanzar la excepción para manejo en el controlador
        }
    }

    public function traer_asistencias($cliente_id) {
        try {
            $this->db->select("
            DATE_FORMAT(asistencia.asistencia_fecha_hora, '%Y') AS year,
            DATE_FORMAT(asistencia.asistencia_fecha_hora, '%m') AS month,
            DATE_FORMAT(asistencia.asistencia_fecha_hora, '%Y-%m-%d') AS fechaIngreso,
            DATE_FORMAT(asistencia.asistencia_fecha_hora, '%h:%i %p') AS horaIngreso,
            tipo_membresia.tipo_membresia_descripcion AS tipoMembresia
        ", false);
    
            $this->db->from('asistencia');
            $this->db->join('clientes', 'asistencia.cliente_id = clientes.cliente_id', 'inner');
            $this->db->join('tipo_membresia', 'clientes.cliente_tipomembresia = tipo_membresia.tipo_membresia_id', 'inner');
            $this->db->where('asistencia.cliente_id', $cliente_id);
            $this->db->order_by('asistencia.asistencia_fecha', 'DESC');
    
            $query = $this->db->get();
    
            if ($query === false) {
                throw new Exception('Error al obtener asistencias del cliente.');
            }
    
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en traer_asistencias: ' . $e->getMessage());
            return false;
        }
    }

    public function consultarCredenciales($usuario, $clave) {
        try {
            // Seleccionamos los datos necesarios
            $this->db->select('empleado_id, empleado_nombres, empleado_usuario');
            $this->db->from('empleados');
            $this->db->where('empleado_usuario', $usuario);
            $this->db->where('empleado_clave', $clave);
    
            $query = $this->db->get();
    
            if ($query->num_rows() > 0) {
                return $query->row(); // Retorna los datos del empleado si coincide
            } else {
                return null; // Retorna null si no hay coincidencias
            }
        } catch (Exception $e) {
            // Registrar el error en los logs
            log_message('error', 'Error en consultarCredenciales: ' . $e->getMessage());
            return false; // Retornar false en caso de error
        }
    }

    public function log_cambio_cliente($transaccion_id,$cliente_id, $accion, $campo_cambiado, $valor_anterior, $valor_nuevo, $motivo, $empleado_id) {
        $data = [
            'transaccion_id' => $transaccion_id,
            'cliente_id' => $cliente_id,
            'accion' => $accion,
            'campo_cambiado' => $campo_cambiado,
            'valor_anterior' => $valor_anterior,
            'valor_nuevo' => $valor_nuevo,
            'motivo' => $motivo,
            'empleado_id' => $empleado_id,
            'fecha' => date('Y-m-d H:i:s')
        ];
    
        $this->db->insert('transacciones_cliente_log', $data);
    }

    public function obtener_asistencias_agrupadas() {
        try {
            $this->db->select("
                DATE_FORMAT(asistencia.asistencia_fecha_hora, '%Y-%m-%d %H:00:00') AS fecha_hora,
                CAST(COUNT(DISTINCT asistencia.cliente_id) AS DECIMAL(10,2)) AS total_clientes
            ", false);
            $this->db->from('asistencia');
            $this->db->group_by("DATE_FORMAT(asistencia.asistencia_fecha_hora, '%Y-%m-%d %H:00:00')");
            $this->db->order_by('total_clientes', 'ASC');
    
            $query = $this->db->get();
    
            if (!$query) {
                throw new Exception('Error al ejecutar la consulta.');
            }
    
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en obtener_asistencias_agrupadas: ' . $e->getMessage());
            return false;
        }
    }

    public function obtener_usuarios_activos_inactivos() {
        try {
            $this->db->select("
                SUM(
                    CASE 
                        WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 1 AND c.fechaFinMembresia > NOW() THEN 1
                        WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 0 AND EXISTS (
                            SELECT 1 
                            FROM membresia m 
                            WHERE m.cliente_id = c.cliente_id 
                            AND m.membresia_fecha_fin > NOW()
                        ) THEN 1
                        ELSE 0
                    END
                ) AS total_clientes_activos,
                SUM(
                    CASE 
                        WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 1 AND (c.fechaFinMembresia <= NOW() OR c.fechaFinMembresia IS NULL) THEN 1
                        WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 0 AND NOT EXISTS (
                            SELECT 1 
                            FROM membresia m 
                            WHERE m.cliente_id = c.cliente_id 
                            AND m.membresia_fecha_fin > NOW()
                        ) THEN 1
                        ELSE 0
                    END
                ) AS total_clientes_inactivos,
                SUM(
                        CASE
                            WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 1 AND DATE(c.fechaFinMembresia) = CURDATE() THEN 1
                            WHEN c.estado = 1 AND c.cliente_estado_fechavencimiento = 0 AND EXISTS (
                                SELECT 1 
                                FROM membresia m 
                                WHERE m.cliente_id = c.cliente_id 
                                AND DATE(m.membresia_fecha_fin) = CURDATE()
                            ) THEN 1
                            ELSE 0
                        END
                    ) AS total_clientes_vencen_hoy
            ", false);
            $this->db->from('clientes c');
    
            $query = $this->db->get();
    
            if (!$query) {
                throw new Exception('Error al ejecutar la consulta.');
            }
    
            $result = $query->row_array();
    
            // Calcula totales y porcentajes
            $activos = (int) $result['total_clientes_activos'];
            $inactivos = (int) $result['total_clientes_inactivos'];
            $vencenhoy = (int) $result['total_clientes_vencen_hoy'];
            $total = $activos + $inactivos;
    
            $porcentaje_activos = $total > 0 ? number_format(($activos / $total) * 100, 2) : 0.00;
            $porcentaje_inactivos = $total > 0 ? number_format(($inactivos / $total) * 100, 2) : 0.00;
    
            // Mensajes motivacionales
            $mensajes = $this->generarMensajes($porcentaje_activos, $porcentaje_inactivos, $vencenhoy);

            return [
                'activos' => $activos,
                'inactivos' => $inactivos,
                'vencenhoy' => $vencenhoy,
                'total' => $total,
                'porcentaje_activos' => $porcentaje_activos,
                'porcentaje_inactivos' => $porcentaje_inactivos,
                'mensaje_activos' => $mensajes['mensaje_activos'],
                'mensaje_inactivos' => $mensajes['mensaje_inactivos'],
                'mensaje_vencen_hoy' => $mensajes['mensaje_vencen_hoy']
            ];
        } catch (Exception $e) {
            log_message('error', 'Error en obtener_usuarios_activos_inactivos: ' . $e->getMessage());
            return false;
        }
    }

    function generarMensajes($porcentaje_activos, $porcentaje_inactivos, $vencidos_hoy) {
        // Mensajes para clientes activos
        $mensajes_activos = [
            "¡Increíble! El {$porcentaje_activos}% de tus clientes está comprometido con su salud.",
            "¡Buen trabajo! El {$porcentaje_activos}% de tus clientes está activo.",
            "Tus esfuerzos están dando frutos: {$porcentaje_activos}% de clientes activos.",
            "¡Felicitaciones! {$porcentaje_activos}% de tus clientes está en acción.",
            "El {$porcentaje_activos}% de tus clientes está disfrutando del gimnasio.",
            "¡Motivador! {$porcentaje_activos}% de tus clientes sigue entrenando.",
            "¡Bravo! Tienes un impresionante {$porcentaje_activos}% de clientes activos.",
            "{$porcentaje_activos}% de tus clientes eligen entrenar contigo.",
            "¡Gran desempeño! {$porcentaje_activos}% de tus clientes sigue en forma.",
            "¡Excelente! Tus clientes activos representan el {$porcentaje_activos}%.",
            "El compromiso de tus clientes es alto: {$porcentaje_activos}%.",
            "¡Tu gimnasio inspira! {$porcentaje_activos}% sigue activo.",
            "{$porcentaje_activos}% de tus clientes se mantienen constantes. ¡Sigue así!",
            "¡Enhorabuena! {$porcentaje_activos}% de tus clientes eligen salud.",
            "{$porcentaje_activos}% de tus clientes están en el camino correcto.",
            "¡Genial! {$porcentaje_activos}% aprovecha tus instalaciones.",
            "El esfuerzo vale la pena: {$porcentaje_activos}% sigue motivado.",
            "{$porcentaje_activos}% de tus clientes están logrando sus metas.",
            "¡Qué orgullo! {$porcentaje_activos}% de tus clientes confía en tu gimnasio.",
            "{$porcentaje_activos}% de tus clientes disfruta entrenar contigo.",
            "¡Sigue motivando! {$porcentaje_activos}% está comprometido.",
            "{$porcentaje_activos}% de tus clientes están mejorando cada día.",
            "{$porcentaje_activos}% de tus clientes están construyendo hábitos saludables.",
            "¡Qué motivador! {$porcentaje_activos}% sigue adelante.",
            "Tus clientes están comprometidos: {$porcentaje_activos}%.",
            "¡Gran esfuerzo! {$porcentaje_activos}% está cambiando su vida.",
            "{$porcentaje_activos}% de tus clientes siguen creciendo contigo.",
            "¡Tus clases inspiran! {$porcentaje_activos}% sigue adelante.",
            "{$porcentaje_activos}% de tus clientes están marcando la diferencia.",
            "El {$porcentaje_activos}% de tus clientes elige mejorar su salud contigo."
        ];
    
        $mensajes_inactivos = [
            "Aprovecha la oportunidad: {$porcentaje_inactivos}% de tus clientes necesita motivación.",
            "Haz una campaña especial: {$porcentaje_inactivos}% de clientes está inactivo.",
            "El {$porcentaje_inactivos}% de tus clientes podría regresar con una oferta.",
            "{$porcentaje_inactivos}% está esperando la motivación adecuada. ¡Actúa ya!",
            "Conecta con el {$porcentaje_inactivos}% de tus clientes inactivos.",
            "{$porcentaje_inactivos}% de tus clientes podría estar esperando una invitación.",
            "Es momento de reactivar al {$porcentaje_inactivos}% de tus clientes.",
            "Una campaña estratégica puede recuperar al {$porcentaje_inactivos}%.",
            "{$porcentaje_inactivos}% de tus clientes puede volver con un incentivo.",
            "Hazlos regresar: {$porcentaje_inactivos}% de tus clientes te necesita.",
            "Es hora de traer al {$porcentaje_inactivos}% de vuelta al gimnasio.",
            "¡Desafío aceptado! Reactiva al {$porcentaje_inactivos}% de tus clientes.",
            "{$porcentaje_inactivos}% puede regresar con promociones personalizadas.",
            "Invita al {$porcentaje_inactivos}% a reiniciar su camino de salud.",
            "Motiva al {$porcentaje_inactivos}% con nuevos retos y programas.",
            "Conquista al {$porcentaje_inactivos}% con actividades innovadoras.",
            "Una llamada puede marcar la diferencia para el {$porcentaje_inactivos}%.",
            "{$porcentaje_inactivos}% de tus clientes merece una segunda oportunidad.",
            "{$porcentaje_inactivos}% necesita un recordatorio de sus metas.",
            "¡Súper oportunidad! Reactiva al {$porcentaje_inactivos}% de clientes.",
            "Haz que el {$porcentaje_inactivos}% vuelva con nuevas experiencias.",
            "Diseña una campaña para reactivar al {$porcentaje_inactivos}%.",
            "El {$porcentaje_inactivos}% puede estar esperando algo nuevo.",
            "{$porcentaje_inactivos}% de tus clientes necesita motivación adicional.",
            "{$porcentaje_inactivos}% puede ser conquistado con una sesión gratuita.",
            "{$porcentaje_inactivos}% puede volver con desafíos semanales.",
            "Crea un programa especial para el {$porcentaje_inactivos}%.",
            "{$porcentaje_inactivos}% puede ser tu siguiente éxito en recuperación.",
            "Recuperar al {$porcentaje_inactivos}% es una meta alcanzable.",
            "Reactivar al {$porcentaje_inactivos}% puede ser tu próximo logro."
        ];

        $mensajes_vencen_hoy = [
            "¡No pierdas la oportunidad! {$vencidos_hoy} clientes tienen membresías que vencen hoy.",
            "Recuerda contactar a los {$vencidos_hoy} clientes que vencen hoy para renovar.",
            "¡Día de acción! Hay {$vencidos_hoy} clientes que necesitan renovar hoy.",
            "Tus clientes que vencen hoy son una oportunidad para fidelizarlos.",
            "Ofrece promociones especiales para los {$vencidos_hoy} clientes que vencen hoy.",
            "{$vencidos_hoy} clientes están a punto de vencer hoy. ¡Es tu oportunidad!",
            "El día de hoy tienes {$vencidos_hoy} clientes a los que puedes impactar.",
            "Contacta a los {$vencidos_hoy} clientes que vencen hoy para ofrecerles continuidad.",
            "{$vencidos_hoy} clientes tienen vencimientos hoy. ¡Haz que se queden contigo!",
            "Es un gran día para renovar: {$vencidos_hoy} clientes vencen hoy."
        ];
    
        // Mensaje especial si no hay clientes vencidos hoy
        if ($vencidos_hoy == 0) {
            $mensajes_vencen_hoy = [
                "¡Genial! Hoy no tienes vencimientos pendientes.",
                "Parece que todos tus clientes están al día. ¡Buen trabajo!",
                "Hoy es un día perfecto para planificar futuras renovaciones.",
                "Sin vencimientos pendientes hoy. ¡A seguir motivando a tus clientes!",
                "Tus clientes están comprometidos. ¡No hay vencimientos hoy!"
            ];
        }
    
        // Selecciona un mensaje aleatorio de cada categoría
        $mensaje_activo = $mensajes_activos[array_rand($mensajes_activos)];
        $mensaje_inactivo = $mensajes_inactivos[array_rand($mensajes_inactivos)];
        $mensaje_vencen_hoy = $mensajes_vencen_hoy[array_rand($mensajes_vencen_hoy)];

        return [
            'mensaje_activos' => $mensaje_activo,
            'mensaje_inactivos' => $mensaje_inactivo,
            'mensaje_vencen_hoy' => $mensaje_vencen_hoy
        ];
    }

    public function obtenerVencidosHoy() {
        try {
            $this->db->select("
                c.cliente_id,
                c.cliente_nombres,
                c.cliente_dni,
                c.fechaFinMembresia AS fecha_vencimiento,
                DATEDIFF(c.fechaFinMembresia, CURDATE()) AS dias_para_vencimiento
            ", false);
            $this->db->from('clientes c');
            $this->db->where('c.estado', 1);
            $this->db->group_start();
            $this->db->where('(c.cliente_estado_fechavencimiento = 1 AND DATE(c.fechaFinMembresia) = CURDATE())', null, false);
            $this->db->or_where("c.cliente_estado_fechavencimiento = 0 AND EXISTS (
                SELECT 1 
                FROM membresia m 
                WHERE m.cliente_id = c.cliente_id 
                AND DATE(m.membresia_fecha_fin) = CURDATE()
            )", null, false);
            $this->db->group_end();
            $this->db->order_by('c.fechaFinMembresia', 'ASC');
    
            $query = $this->db->get();
            if (!$query) {
                throw new Exception('Error al ejecutar la consulta.');
            }
    
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en obtenerVencidosHoy: ' . $e->getMessage());
            return false;
        }
    }

    public function obtener_vencimientos_proximos() {
        try {
            $sql = "SELECT 
            c.cliente_id AS 'id',
            c.cliente_nombres AS 'nombre',
            c.cliente_dni AS 'dni',
            tm.tipo_membresia_descripcion AS 'tipo_membresia_nombre',
            CASE 
                WHEN c.cliente_estado_fechavencimiento = 1 THEN c.fechaFinMembresia
                ELSE (
                    SELECT m.membresia_fecha_fin 
                    FROM membresia m
                    WHERE m.cliente_id = c.cliente_id
                    ORDER BY m.membresia_fecha_fin DESC 
                    LIMIT 1
                )
            END AS fecha_vencimiento,
            DATEDIFF(
                CASE 
                    WHEN c.cliente_estado_fechavencimiento = 1 THEN c.fechaFinMembresia
                    ELSE (
                        SELECT m.membresia_fecha_fin 
                        FROM membresia m
                        WHERE m.cliente_id = c.cliente_id
                        ORDER BY m.membresia_fecha_fin DESC 
                        LIMIT 1
                    )
                END, CURDATE()
            ) AS dias_para_vencimiento,
            CASE 
                WHEN c.cliente_estado_fechavencimiento = 1 THEN 'Opción Activada'
                ELSE 'Opción Desactivada'
            END AS estado_opcion
        FROM 
            clientes c
        LEFT JOIN 
            tipo_membresia tm ON c.cliente_tipomembresia = tm.tipo_membresia_id
        WHERE 
            c.estado = 1
            AND c.cliente_nombres IS NOT NULL
            AND (
                (c.cliente_estado_fechavencimiento = 1 AND c.fechaFinMembresia > CURDATE() AND c.fechaFinMembresia <= DATE_ADD(CURDATE(), INTERVAL 3 DAY)) 
                OR 
                (c.cliente_estado_fechavencimiento = 0 AND EXISTS (
                    SELECT 1
                    FROM membresia m
                    WHERE m.cliente_id = c.cliente_id
                    AND m.membresia_fecha_fin > CURDATE() 
                    AND m.membresia_fecha_fin <= DATE_ADD(CURDATE(), INTERVAL 3 DAY)
                ))
            )
        ORDER BY 
            fecha_vencimiento ASC ";
            $query = $this->db->query($sql);
    
            if (!$query) {
                throw new Exception('Error al ejecutar la consulta.');
            }
    
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en obtener_vencimientos_proximos: ' . $e->getMessage());
            return false;
        }
    }

    public function obtener_membresias_renovadas() {
        try {
            $sql = "
                SELECT 
                    c.cliente_id as id,
                    c.cliente_dni as dni,
                    tm.tipo_membresia_descripcion AS tipo_membresia_descripcion,
                    lg.fecha as fecha_modificacion, 
                    CASE 
                        WHEN c.cliente_estado_fechavencimiento = 1 THEN c.fechaFinMembresia
                        ELSE (
                            SELECT m.membresia_fecha_fin 
                            FROM membresia m
                            WHERE m.cliente_id = c.cliente_id
                            ORDER BY m.membresia_fecha_fin DESC 
                            LIMIT 1
                        )
                    END AS fecha_vencimiento,
                    lg.motivo AS motivo,
                    lg.valor_anterior AS valor_anterior,
                    lg.valor_nuevo AS valor_nuevo,
                    e.empleado_nombres AS empleado_nombres,
                    CONCAT(
                        'El colaborador <b>\"', 
                        e.empleado_nombres, 
                        '\"</b> actualizó la membresía \"', 
                        tm.tipo_membresia_descripcion, 
                        '\". La fecha de vencimiento anterior era <b>\"', 
                        lg.valor_anterior, 
                        '\"</b> y ahora es <b>\"', 
                        lg.valor_nuevo, 
                        '\"</b>. Motivo del cambio: ', 
                        lg.motivo, 
                        '.'
                    ) AS descripcion_cambio
                FROM 
                    clientes c
                LEFT JOIN 
                    tipo_membresia tm ON c.cliente_tipomembresia = tm.tipo_membresia_id
                LEFT JOIN 
                    transacciones_cliente_log lg ON c.cliente_id = lg.cliente_id
                LEFT JOIN 
                    empleados e ON lg.empleado_id = e.empleado_id
                WHERE 
                    lg.accion = 'UPDATE'
                    AND lg.campo_cambiado = 'fechaFinMembresia'
                    AND c.estado = 1
                ORDER BY 
                    lg.fecha DESC;
            ";
    
            $query = $this->db->query($sql);
    
            if (!$query) {
                throw new Exception('Error al ejecutar la consulta.');
            }
    
            return $query->result_array();
        } catch (Exception $e) {
            log_message('error', 'Error en obtener_membresias_renovadas: ' . $e->getMessage());
            return false;
        }
    }
}