
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/CustomException.php';
require APPPATH . 'libraries/ImplementJwt.php'; 
require_once "BaseController.php";
require_once("src/autoload.php");
class Producto extends BaseController {

	private $upload_path = './uploads/productos/';
    public function __construct(){
        parent::__construct();
        $this->load->model('Modelo_m');  
        $this->load->model('Marca_m');  
        $this->load->model('Producto_m');  
        $this->objOfJwt = new ImplementJwt();
        $this->handleCors();
        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            header("HTTP/1.1 200 OK");
            exit();
        }
    }
    private function handleCors(){
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

    public function get_componentProductos() {
	    try {
	        // Obtener los headers de la petición
	        $headers = $this->input->request_headers();
	        
	        // Validar el token de autorización
	        $data_token = json_decode($this->consultar_token($headers), true); 
	        if (isset($data_token['status']) && $data_token['status'] === false) {
	            $this->output
	                ->set_status_header(201) // Código 401 - Unauthorized
	                ->set_content_type('application/json')
	                ->set_output(json_encode([
	                    'error' => $data_token['message'],
	                    'status' => false
	                ]));
	            return;
	        }
	        if (!$data_token) {
	            throw new CustomException('Token de autorización inválido.', 401);
	        }
	        
	        $productId = $this->input->get('productId');
	        $producto = array();
	        if (!empty($productId)) {
	            // Buscar el producto por ID en la tabla "producto"
	            $this->db->where('producto_id', $productId);
	            $query = $this->db->get('producto');
	            if ($query->num_rows() == 0) {
	                throw new CustomException('Producto no encontrado.', 404);
	            }
	            $producto = $query->row_array();
	        }
	        // Obtener todos los registros de tipo_producto
	        $tipo_producto = $this->Producto_m->obtener_todos('tipo_producto'); 
	        if ($tipo_producto === false) {
	            throw new CustomException('No se pudieron obtener los tipos de producto.', 500);
	        }
	        
	        // Obtener todas las categorías de producto
	        $categoria_producto = $this->Producto_m->obtener_todos('categoria_producto');
	        if ($categoria_producto === false) {
	            throw new CustomException('No se pudieron obtener las categorías de producto.', 500);
	        }
	        
	        // Obtener las marcas activas
	        $marcas = $this->Marca_m->obtener_activos('marca');
	        if ($marcas === false) {
	            throw new CustomException('No se pudieron obtener las marcas.', 500);
	        }
	        
	        // Respuesta exitosa con los datos obtenidos
	        $this->output
	            ->set_status_header(200)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => true,
	                'tipo_producto' => $tipo_producto,
	                'categoria_producto' => $categoria_producto,
	                'marcas' => $marcas,
	                'producto' => $producto
	            ]));
	            
	    } catch (CustomException $e) {
	        // Manejo de excepciones personalizadas
	        log_message('error', 'Error en get_componentProductos: ' . $e->getMessage());
	        $this->output
	            ->set_status_header($e->getHttpCode())
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => $e->getMessage()
	            ]));
	    } catch (Exception $e) {
	        // Manejo general de excepciones
	        log_message('error', 'Error en get_componentProductos: ' . $e->getMessage());
	        $this->output
	            ->set_status_header(500)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => 'Ocurrió un problema interno del servidor.'
	            ]));
	    }
	}

	public function post_producto() {
	    try {
	        // Validar token de autorización
	        $headers = $this->input->request_headers();
	        $data_token = json_decode($this->consultar_token($headers), true);
	        if (isset($data_token['status']) && $data_token['status'] === false) {
	            $this->output
	                ->set_status_header(201)
	                ->set_content_type('application/json')
	                ->set_output(json_encode(['error' => $data_token['message'], 'status' => false]));
	            return;
	        }
	        if (!$data_token) {
	            throw new CustomException('Token de autorización inválido.', 401);
	        }

	        // Recoger los datos enviados (form-data)
	        $idProducto           = $this->input->post('idProducto'); // Para actualización
	        $nombreProducto       = $this->input->post('nombreProducto');
	        $tipoProductoSelected = $this->input->post('tipoProductoSelected'); // corresponde a producto_id_tipoproducto
	        $categoriaProducto    = $this->input->post('categoriaProducto'); // corresponde a categoria_producto_id
	        $marcaSelected        = $this->input->post('marcaSelected'); // corresponde a marca_id
	        $stock                = $this->input->post('stock');
	        $precioRegular        = $this->input->post('precioRegular');
	        $porcentajeGanancia   = $this->input->post('porcentajeGanancia');
	        $precioVenta          = $this->input->post('precioVenta');
			$codigoProducto   	  = $this->input->post('codigoProducto');
	        $descripcionProducto  = $this->input->post('descripcionProducto');
	        // Validar que los campos requeridos no estén vacíos
	        if (empty($nombreProducto) || empty($tipoProductoSelected) || empty($categoriaProducto) ||
	            empty($marcaSelected) || empty($stock) || empty($precioRegular) ||
	            empty($porcentajeGanancia) || empty($precioVenta) || empty($codigoProducto) || empty($descripcionProducto) ) {
	            throw new CustomException('Todos los campos son obligatorios.', 400);
	        } 

	        $upload_path = FCPATH . 'uploads/productos/';
	        if (!file_exists($upload_path)) {
	            mkdir($upload_path, 0755, true);
	        }
	        $config['upload_path']   = $upload_path;
	        $config['allowed_types'] = 'gif|jpg|jpeg|png';
	        $config['max_size']      = 2048; // 2 MB máximo
	        $this->load->library('upload', $config);
	        $foto_path = null;

	        if (empty($idProducto)) {
	            // Modo insertar: la imagen es obligatoria
	            if (!isset($_FILES['foto']) || $_FILES['foto']['error'] != 0) {
	                throw new CustomException('Debe seleccionar una imagen.', 400);
	            }
	            if (!$this->upload->do_upload('foto')) {
	                throw new CustomException($this->upload->display_errors(), 400);
	            }
	            $upload_data = $this->upload->data();
	            $foto_path   = $upload_data['file_name'];

	            // Redimensionar la imagen a 70x70
	            $config_resize = array(
	                'image_library'  => 'gd2',
	                'source_image'   => $upload_path . $foto_path,
	                'maintain_ratio' => false, // Forzar dimensiones exactas
	                'width'          => 70,
	                'height'         => 70,
	                'new_image'      => $upload_path . $foto_path // Sobrescribe el archivo subido
	            );
	            $this->load->library('image_lib', $config_resize);
	            if (!$this->image_lib->resize()) {
	                throw new CustomException($this->image_lib->display_errors(), 400);
	            }
	        } else {
	            // Modo actualizar: la imagen es opcional
	            if (isset($_FILES['foto']) && $_FILES['foto']['error'] == 0) {
	                if (!$this->upload->do_upload('foto')) {
	                    throw new CustomException($this->upload->display_errors(), 400);
	                }
	                $upload_data = $this->upload->data();
	                $foto_path   = $upload_data['file_name'];
	                $config_resize = array(
	                    'image_library'  => 'gd2',
	                    'source_image'   => $upload_path . $foto_path,
	                    'maintain_ratio' => false,
	                    'width'          => 70,
	                    'height'         => 70,
	                    'new_image'      => $upload_path . $foto_path
	                );
	                $this->load->library('image_lib', $config_resize);
	                if (!$this->image_lib->resize()) {
	                    throw new CustomException($this->image_lib->display_errors(), 400);
	                }
	            }
	        }
	        // Preparar los datos a insertar en la tabla "producto"
	        $data = array(
	            'producto_descripcion'      => $nombreProducto,
	            'producto_precio'           => $precioVenta, // se espera que ya venga calculado desde el front
	            'producto_stock'            => $stock,
	            'producto_minimo'           => 0,  // Valor por defecto
	            'producto_fecha_vencimiento'=> NULL,
	            'producto_observacion'      => '',
	            'id_sede'                   => isset($data_token['sede']) ? $data_token['sede'] : NULL,
	            'producto_estado'           => 1, 
	            // Relacionando con otras tablas
	            'categoria_producto_id'     => $categoriaProducto,
	            'producto_id_tipoproducto'  => $tipoProductoSelected,
	            'marca_id'                  => $marcaSelected,
	            'producto_observacion' 		=> $descripcionProducto,
	            'producto_codigobarra' 		=> $codigoProducto,
	            'producto_porcentaje'		=> $porcentajeGanancia,
	            'producto_precioregular'	=> $precioRegular
	        );
	        // Si se subió una imagen (en insert o update) la incluimos
	        if (!empty($foto_path)) {
	            $data['producto_imagen'] = $foto_path;
	        }
	        // Iniciar transacción
	        $this->db->trans_begin();

	        // Insertar el producto en la tabla
	        if (empty($idProducto)) {
	            // Insertar nuevo producto
	            $insertado = $this->Producto_m->insertar('producto', $data);
	            if (!$insertado['estado']) {
	                $this->db->trans_rollback();
	               	if (file_exists($upload_path . $foto_path)) {
	                	unlink($upload_path . $foto_path);
	            	}
	                throw new CustomException('Error al crear el producto.', 500);
	            }
	            $producto_id = $insertado['producto_id'];
	        } else {
	            // Actualizar producto existente
	            // Se asume que en el modelo tienes un método actualizar que reciba (tabla, id, datos)
	            $actualizado = $this->Producto_m->actualizar('producto', $idProducto, $data);
	            if (!$actualizado['estado']) {
	                $this->db->trans_rollback();
	               	if (file_exists($upload_path . $foto_path)) {
	                	unlink($upload_path . $foto_path);
	            	}
	                throw new CustomException('Error al actualizar el producto.', 500);
	            }
	            $producto_id = $idProducto;
	        }

	        // Confirmar transacción
	        $this->db->trans_commit();

	        // Responder con éxito
	        $this->output
	            ->set_status_header(201)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => true,
	                'message' => empty($idProducto) ? 'Producto creado satisfactoriamente' : 'Producto actualizado satisfactoriamente',
	                'data' => [
	                    'producto_id'          => $producto_id,
	                    'producto_descripcion' => $nombreProducto
	                ]
	            ]));

	    } catch (CustomException $e) {
	        log_message('error', 'Error en post_producto: ' . $e->getMessage());
	        // Si se inició una transacción y ocurre error, hacer rollback
	        if ($this->db->trans_status() === FALSE) {
	            $this->db->trans_rollback();
	        }
	        $this->output
	            ->set_status_header($e->getHttpCode())
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => $e->getMessage()
	            ]));
	    } catch (Exception $e) {
	        log_message('error', 'Error en post_producto: ' . $e->getMessage());
	        $this->db->trans_rollback();
	        $this->output
	            ->set_status_header(500)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => 'Error interno del servidor.'
	            ]));
	    }
	}

	public function get_listProductos() {
	    try {
	        // Validar token de autorización
	        $headers = $this->input->request_headers();
	        $data_token = json_decode($this->consultar_token($headers), true);
	        if (isset($data_token['status']) && $data_token['status'] === false) {
	            $this->output
	                ->set_status_header(201)
	                ->set_content_type('application/json')
	                ->set_output(json_encode([
	                    'status' => false,
	                    'error' => $data_token['message']
	                ]));
	            return;
	        }
	        if (!$data_token) {
	            throw new CustomException('Token de autorización inválido.', 401);
	        }

	        // Seleccionar los campos requeridos desde la tabla producto
	        $this->db->select('*');
	        $query = $this->db->get('producto');
	        $productos = $query->result_array();

	        // Formatear el resultado para el frontend
	        $result = array();
	        foreach ($productos as $prod) { 
	            $formatted = array();
	            $formatted['productId'] = $prod['producto_id'];
	            $formatted['product'] = array(
	                'img'  => base_url('uploads/productos/' . $prod['producto_imagen']),
	                'name' => $prod['producto_descripcion']
	            );
	            $formatted['category'] = (string)$prod['producto_codigobarra'];
	            $formatted['price'] = '$' . number_format($prod['producto_precio'], 2);
	            $formatted['stockQuantity'] = (int)$prod['producto_stock'];
	            $formatted['priceregular'] = number_format($prod['producto_precioregular'], 2);
	            $formatted['percentage'] = number_format($prod['producto_porcentaje'], 2);

	            // "sales": si no se tiene dato, se asigna 0 (puedes ajustar si cuentas con otro campo)
	            $formatted['sales'] = 0;

	            // "action": un objeto con las acciones disponibles, fijo según tu interfaz
	            $formatted['action'] = array(
	                'view'   => 'visibility',
	                'edit'   => 'edit',
	                'delete' => 'delete'
	            );

	            $result[] = $formatted;
	        }

	        // Devolver el resultado en formato JSON
	        $this->output
	            ->set_status_header(200)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => true,
	                'data' => $result
	            ]));

	    } catch (CustomException $e) {
	        log_message('error', 'Error en get_listProductos: ' . $e->getMessage());
	        $this->output
	            ->set_status_header($e->getHttpCode())
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => $e->getMessage()
	            ]));
	    } catch (Exception $e) {
	        log_message('error', 'Error en get_listProductos: ' . $e->getMessage());
	        $this->output
	            ->set_status_header(500)
	            ->set_content_type('application/json')
	            ->set_output(json_encode([
	                'status' => false,
	                'error' => 'Error interno del servidor.'
	            ]));
	    }
	}


  	public function delete_producto($id) {
	      try {
	          // Obtener el token de la solicitud
	          $headers = $this->input->request_headers();
	          $data_token = json_decode($this->consultar_token($headers), true);
	            if (isset($data_token['status']) && $data_token['status'] === false) {
	                // Si el token es inválido o ha expirado, lanzar una excepción o devolver una respuesta de error
	                $this->output
	                    ->set_status_header(201) // Código 401 - Unauthorized
	                    ->set_content_type('application/json')
	                    ->set_output(json_encode(['error' => $data_token['message'] , 'status' => false]));
	                return; // Detener la ejecución
	            }
	          
	          if (!$data_token) {
	              throw new CustomException('Token de autorización inválido.', 401);
	          }
	  
	          // Verificar si el ID es válido
	          if (empty($id)) {
	              throw new CustomException('ID de la producto es obligatorio.', 400);
	          }
	  
	          // Cambiar el estado de la producto a 0 (eliminar lógicamente)
	          $data = [
	              'producto_estado' => 0  // Estado 0 para indicar "eliminado"
	          ];
	  
	          // Realizar la actualización en la base de datos
	          $this->db->where('producto_id', $id);
	          $update = $this->db->update('producto', $data);
	  
	          // Verificar si la actualización fue exitosa
	          if (!$update) {
	              throw new CustomException('Error al cambiar el estado de la producto.', 500);
	          }
	  
	          // Responder con éxito
	          $this->output
	              ->set_status_header(200)  // Código 200 - OK
	              ->set_content_type('application/json')
	              ->set_output(json_encode([
	                  'status' => true,
	                  'message' => 'Marca eliminada lógicamente con éxito.'  // Mensaje de éxito
	              ]));
	  
	      } catch (CustomException $e) {
	          // Manejo de errores personalizados
	          log_message('error', 'Error en delete_producto: ' . $e->getMessage());
	          $this->output
	              ->set_status_header($e->getHttpCode())
	              ->set_content_type('application/json')
	              ->set_output(json_encode([
	                  'status' => false,
	                  'error' => $e->getMessage()
	              ]));
	      } catch (Exception $e) {
	          // Manejo general de errores
	          log_message('error', 'Error en delete_producto: ' . $e->getMessage());
	          $this->output
	              ->set_status_header(500)
	              ->set_content_type('application/json')
	              ->set_output(json_encode([
	                  'status' => false,
	                  'error' => 'Error interno del servidor.'
	              ]));
	      }
  	}
}