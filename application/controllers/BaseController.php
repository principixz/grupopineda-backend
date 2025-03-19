<?php

defined('BASEPATH') OR exit('No direct script access allowed'); 
require_once("convertirAletra.php");
class BaseController extends CI_Controller {



public function __construct() {
  parent::__construct();
  date_default_timezone_set("America/Lima");
  $this->load->model("Mantenimiento_m");
  $this->load->library('ImplementJwt');
}

public function consultar_token($headers){  
  $token = "";

  if (isset($headers['Authorization'])) {
      $token = $headers['Authorization'];
  } else {
      $token = $headers['authorization'] ?? ''; 
  }

  if (empty($token)) { 
      $response = [
          'properties' => [
              'customMenu' => []
          ]
      ];
      http_response_code(200); 
      echo json_encode(array("status" => false, "message" => "Token de autorización no proporcionado.", $response));
      exit();
  }

  // Eliminar el prefijo "Bearer " si está presente
  $token = str_replace("Bearer ", "", $token);
  try { 
      $jwtData = $this->objOfJwt->DecodeToken($token); 
      return json_encode($jwtData);
  } catch (Exception $e) {
      // Si ocurre una excepción (token inválido o expirado)
      http_response_code(401); // Código 401 - Unauthorized si el token es inválido
      return json_encode(array("status" => false, "message" => $e->getMessage()));
      exit();
  }
}

public function facturacion_electronica($id)
{
 //  $data_token = json_decode($this->consultar_token(),true);

 // $response=array();
  $empresa=$this->db->query("select * from empresa")->row_array();
  $postdata = file_get_contents("php://input");

  $request = json_decode($postdata,true); 

  $response=array();



$ruta = $empresa["empresa_link_facturacion"].'api/documents';
//produccion
$token = $empresa["empresa_token_facturacion"];
//prueba
//$token='8lqV6Y8G0eSwG5G0hgthgB8CD1g4N2W5xdVYUoWodrqreh82z9';


   $sql="SELECT
venta.venta_idventas as 'id',
venta.venta_num_serie  as 'serie',
venta.venta_num_documento as 'documento',
DATE_FORMAT(venta.venta_fecha_pago,'%Y-%m-%d') as 'fecha',
TIME(venta.venta_fecha_pago) as 'hora',
if(ventas_idtipodocumento=1,'01','03') as 'codigo_documento',
venta.venta_documento_descripcion as 'documento_dni',
if(LENGTH(venta.venta_documento_descripcion)=8,'1','6') as 'tam_dni',
venta.venta_direccion_descripcion as 'direccion',
clientes.cliente_telefono as 'telefono',
venta.venta_nombre_descripcion as 'cliente',
clientes.cliente_email as 'correo',
if(venta.venta_cdr_facturacion IS NULL ,'',venta.venta_cdr_facturacion) as 'cdr',
if(venta.venta_xml_facturacion IS NULL ,'',venta.venta_xml_facturacion) as  'xml',
if(venta.venta_pdf_facturacion IS NULL ,'',venta.venta_pdf_facturacion) as 'pdf',
venta.*,
empleados.*
FROM
venta
LEFT JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
INNER JOIN empleados ON empleados.empleado_id=venta.venta_id_cajero
where venta.venta_idventas=".$id;



        $venta=$this->db->query($sql)->row_array();

















        $detalle=array();

        $sql="select 
producto.producto_descripcion as 'descrip',
detalle_venta.*


from detalle_venta 
INNER JOIN producto ON detalle_venta.cod_producto_venta=producto.producto_id
where detalle_venta.estado_pedido=1 and id_venta=".$id;

        $rec=$this->db->query($sql)->result_array();

        foreach ($rec as $key => $value) {

           $detalle[$key]=array(

              "codigo_interno"=>  "P".$value["id_detalle_venta"],

              "descripcion"=> $value["descrip"],

              "codigo_producto_sunat"=>  "51121703",

              "unidad_de_medida"=>  "NIU",

              "cantidad"=>  $value["cantidad"],

              "valor_unitario"=>  $value["precio"],

              "codigo_tipo_precio"=>  "01",

              "precio_unitario"=>  $value["precio"],

              "codigo_tipo_afectacion_igv"=> "20",

              "total_base_igv"=>  (double)$value["cantidad"]*(double)$value["precio"],

              "porcentaje_igv"=>  18,

              "total_igv"=>  0,

              "total_impuestos"=>  0,

              "total_valor_item"=>  $value["cantidad"]*$value["precio"],

              "total_item"=>  $value["cantidad"]*$value["precio"],

           );

        }



    

$data = array(

   "serie_documento"=> $venta["serie"],

  "numero_documento"=>$venta["documento"],

  "fecha_de_emision"=>  $venta["fecha"],

  "hora_de_emision"=>  $venta["hora"],

  "codigo_tipo_operacion"=>  "0101",

  "codigo_tipo_documento"=>$venta["codigo_documento"],

  "codigo_tipo_moneda"=>  "PEN",

  "fecha_de_vencimiento"=>  $venta["fecha"],

  "numero_orden_de_compra"=>  $venta["id"],

  "datos_del_emisor"=>  array(

    "codigo_pais"=>  "PE",

    "ubigeo"=>  "220901",

    "direccion"=>  $empresa["empresa_direccion"],

    "correo_electronico"=>  $empresa["empresa_correo"],

    "telefono"=> $empresa["empresa_telefono"],

    "codigo_del_domicilio_fiscal"=>  "0000"

  ),  

  "datos_del_cliente_o_receptor"=>array(

    "codigo_tipo_documento_identidad"=> $venta["tam_dni"],

    "numero_documento"=> $venta["documento_dni"],

    "apellidos_y_nombres_o_razon_social"=>$venta["cliente"],

    "codigo_pais"=> "PE",

    "ubigeo"=>"220901",

    "direccion"=> $venta["direccion"],

    "correo_electronico"=>$venta["correo"],

    "telefono"=>"933122626"

  ), "totales"=>array(

    "total_exportacion"=> 0.00,

    "total_operaciones_gravadas"=> 0.00,

    "total_operaciones_inafectas"=> 0.00,

    "total_operaciones_exoneradas"=>$venta["venta_monto"],

    "total_operaciones_gratuitas"=> 0.00,

    "total_igv"=>0.00,

    "total_impuestos"=> 0.00,

    "total_valor"=> $venta["venta_monto"],

    "total_venta"=> $venta["venta_monto"]

  )

,



   "items"=>$detalle,

   "informacion_adicional"=> "OBSERVACIÓN: ".$venta["venta_observaciones"]."|EMITIDO POR:|".$venta["empleado_nombres"]."|".$venta["empleado_usuario"]

);





//print_r($data);exit();

$data_json = json_encode($data);



//echo $data_json;exit();

$curl = curl_init();



curl_setopt_array($curl, array(

  CURLOPT_URL => $ruta ,

  CURLOPT_RETURNTRANSFER => true,

  CURLOPT_ENCODING => "",

  CURLOPT_MAXREDIRS => 10,

  CURLOPT_TIMEOUT => 30,

  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,

  CURLOPT_CUSTOMREQUEST => "POST",

  CURLOPT_POSTFIELDS => $data_json,

  CURLOPT_HTTPHEADER => array(

    "authorization: Bearer ".$token,

    "cache-control: no-cache",

    "content-type: application/json",

   

  ),

));



$response = curl_exec($curl);

$err = curl_error($curl);



curl_close($curl);



if ($err) {

  echo "cURL Error #:" . $err;

} else {

   $json=json_decode($response,true);

  //print_r($json);exit();





     $filename = $json["links"]["pdf"]; 

   // $origen   = fopen($filename, 'r');

    //$nombre_pdf=$this->generar_token_seguro(30);

   // $destino1 = fopen('public/factura/'.$nombre_pdf.'.pdf', 'w');



     //stream_copy_to_stream($origen, $destino1); 





   $data=array(

       "venta_pdf_facturacion"=>$json["links"]["pdf"],

       "venta_xml_facturacion"=>$json["links"]["xml"],

       "venta_cdr_facturacion"=>$json["links"]["cdr"],

      // "venta_ticket_facturacion"=>$nombre_pdf,

       "venta_ticket_external_id"=>$json["data"]["external_id"],
       "venta_qr"=>$json["data"]["qr"],

       "venta_hash"=>$json["data"]["hash"],
       "venta_number_to_letter"=>$json["data"]["number_to_letter"]


   );



     $this->db->where("venta_idventas",$id);

     $r = $this->db->update("venta",$data);
//print_r($json);exit();



     return $json["links"]["pdf"];


  // echo json_encode($json);exit();

}




}
public function vista($cuerpo,$data=array()){
  if(!isset($_COOKIE["config_usuario"])|| $_COOKIE["config_usuario"]==""){
    header('Location: '.base_url());
    exit();
  }
  $url= $_SERVER["REQUEST_URI"];
  $sql = "permisos_sede.persed_id_sede";
  $ids = $_COOKIE["id_sede"];
  
  $data["datos_usuario"]=$this->Mantenimiento_m->consulta3("SELECT * FROM empleados INNER JOIN perfiles ON empleados.perfil_id = perfiles.perfil_id AND empleados.empleado_id=".$_COOKIE["usuario_id"]); 
  $url_array=explode("/",$url);

 $modulos = $this->Mantenimiento_m->consulta3("SELECT modulos.modulo_nombre ,modulos.modulo_id,modulos.modulo_orden,modulos.modulo_icono,modulos.modulo_url,
    modulos.modulo_padre,modulos.estado
    FROM modulos
    INNER JOIN modulos AS MODULOHIJO ON (modulos.modulo_id = MODULOHIJO.modulo_padre)
    INNER JOIN permisos_sede ON permisos_sede.persed_id_modulo = MODULOHIJO.modulo_id
    WHERE
    modulos.modulo_padre=1   and modulos.modulo_id!=1 and modulos.estado=1 and
    permisos_sede.persed_id_perfil=".$_COOKIE["usuario_perfil"]." and ".$sql."=".$ids."
    GROUP BY
    MODULOHIJO.modulo_padre
    order by modulo_orden asc"); 


 
  foreach ($modulos as $key => $value){
    $mod = $this->Mantenimiento_m->consulta3("select modulos.* from modulos inner join permisos_sede on(modulos.modulo_id=permisos_sede.persed_id_modulo) inner join perfiles on(perfiles.perfil_id=permisos_sede.persed_id_perfil) where permisos_sede.persed_id_perfil=".$_COOKIE["usuario_perfil"]." and  ".$sql."=".$ids."  and modulos.modulo_padre=".$value["modulo_id"]." and modulos.estado=1 GROUP BY modulos.modulo_id");
    $modulos[$key]["lista"] = $mod;
  }
  if($_COOKIE["config_usuario"]){ 
    if($_COOKIE["id_sede"]!=0){
      $sede=$this->Mantenimiento_m->consulta3("select * from sede where id_sede=".$_COOKIE["id_sede"]);
      $nombre_sede=$sede[0]["sede_descripcion"];
    }else{
      $nombre_sede="TIENDAS";
    }
    if(isset($_COOKIE["id_sede"])  ){
      if($_COOKIE["id_sede"]!=0){

      }
      else{
           ///$datos_ara=$this->Mantenimiento_m->consulta3("select * from  color_sede where id_sede=".$_COOKIE["id_sede"]);
        $data["id_color"]="1";
      }
    }else{
           ///$datos_ara=$this->Mantenimiento_m->consulta3("select * from  color_sede where id_sede=".$_COOKIE["id_sede"]);
      $data["id_color"]="1";
    } 
    $data["titulo"]=$nombre_sede;
    $data["logo_empresa"]='';
    $data["titulo_corto"]= $nombre_sede;   
    $empresa=$this->db->query("select * from empresa ")->row_array();
    $this->load->view('Layout',compact("data","modulos","empresa"));
    $this->load->view($cuerpo,compact("data","empresa"));
    $this->load->view('Footer',compact("data","empresa"));
  }else{
    header('Location: '.base_url());
  }
}

function redim($ruta1,$ruta2,$ancho,$alto){
  $datos=getimagesize ($ruta1);
  $ancho_orig = $datos[0]; # Anchura de la imagen original
  $alto_orig = $datos[1];    # Altura de la imagen original
  $tipo = $datos[2];

    if ($tipo==1){ # GIF
      if (function_exists("imagecreatefromgif"))
        $img = imagecreatefromgif($ruta1);
      else
        return false;
    }
    else if ($tipo==2){ # JPG
      if (function_exists("imagecreatefromjpeg"))
        $img = imagecreatefromjpeg($ruta1);
      else
        return false;
    }
    else if ($tipo==3){ # PNG
      if (function_exists("imagecreatefrompng"))
        $img = imagecreatefrompng($ruta1);
      else
        return false;
    }
    # Se calculan las nuevas dimensiones de la imagen
    if ($ancho_orig>$alto_orig){
      $ancho_dest=$ancho;
      $alto_dest=($ancho_dest/$ancho_orig)*$alto_orig;
    }else{
      $alto_dest=$alto;
      $ancho_dest=($alto_dest/$alto_orig)*$ancho_orig;
    }
    $img2=@imagecreatetruecolor($ancho_dest,$alto_dest) or $img2=imagecreate($ancho_dest,$alto_dest);
    @imagecopyresampled($img2,$img,0,0,0,0,$ancho_dest,$alto_dest,$ancho_orig,$alto_orig) or imagecopyresized($img2,$img,0,0,0,0,$ancho_dest,$alto_dest,$ancho_orig,$alto_orig);
    // Crear fichero nuevo, según extensión.
    if ($tipo==1) // GIF
    if (function_exists("imagegif"))
      imagegif($img2, $ruta2);
    else
      return false;
    if ($tipo==2) // JPG
    if (function_exists("imagejpeg"))
      imagejpeg($img2, $ruta2);
    else
      return false;
    if ($tipo==3)  // PNG
    if (function_exists("imagepng"))
      imagepng($img2, $ruta2);
    else
      return false;
    return true;
  }


  public function actualizar_stock($id_almacen,$id_producto,$detalle_unidad_medida,$cantidad,$precio_unitario,$tipo_actualizacion,$tipo_comprobante,$serie,$correlativo){
    // $tipo_actualizacion; si es 1 el sistema sumara las cantidades .si es 2 lo reducira

    //buscar el factor de conversion
$sql="select * from detalle_unidad_producto where detalle_unidad_producto_id=".$detalle_unidad_medida;
    $datos_detalle_unidad=$this->Mantenimiento_m->consulta2($sql);
    $factor_conversion=$datos_detalle_unidad->detalle_unidad_producto_factor;





    // Datos de cantidad que se agregara nueva al stock;
    $cantidad_total=(float)$factor_conversion*(float)$cantidad;





        $precio_uni=((float)$precio_unitario*(float)$cantidad)/$cantidad_total;
    
    $datos_almacen=$this->Mantenimiento_m->consulta2("select * from detalle_producto_almacen where detalle_producto=".$id_producto." and detalle_almacen=".$id_almacen);
//extraeremos el stock actual e id de almacen;
    $stock_actual=(float)$datos_almacen->detalle_stock;
    $detalle_producto_almacen_id=$datos_almacen->detalle_producto_almacen_id;

      $nuevo_stock=0;
    if($tipo_actualizacion==1)
    {
        
        $nuevo_stock=$stock_actual+$cantidad_total; 
        $data=array(
        "detalle_stock"=>$nuevo_stock,
             
        );

        $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
        


$this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,1,"compra de producto", $serie,$correlativo, $precio_uni,$tipo_comprobante);













        return 1;


    }else{


      if($stock_actual>=$cantidad_total)
      {
        $nuevo_stock=$stock_actual-$cantidad_total; 
         $data=array(
        "detalle_stock"=>$nuevo_stock,
             
        );

        $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");  
        $this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,2,"VENTA DE PRODUCTO", $serie,$correlativo, $precio_uni,$tipo_comprobante);
         return 1;
         exit();
      }else
      {

        return 0;
        exit();

      }



    }
  }

  public function movimiento_stock_temporal($id_almacen,$id_producto,$detalle_unidad_medida,$cantidad,$precio_unitario,$tipo_actualizacion,$tipo_registro,$serie = null,$correlativo = null,$id_tipo_comprobante = null){
    $datos_detalle_unidad=$this->Mantenimiento_m->consulta2("select * from detalle_unidad_producto where detalle_unidad_producto_id=".$detalle_unidad_medida);
    $factor_conversion=$datos_detalle_unidad->detalle_unidad_producto_factor;
    $cantidad_total=(float)$factor_conversion*(float)$cantidad;
    $datos_almacen=$this->Mantenimiento_m->consulta2("select * from detalle_producto_almacen where detalle_producto=".$id_producto." and detalle_almacen=".$id_almacen);
    $stock_actual=(float)$datos_almacen->detalle_stock;
    $stock_temporal=(float)$datos_almacen->detalle_stock_temporal;
    $detalle_producto_almacen_id=$datos_almacen->detalle_producto_almacen_id;
    $nuevo_stock=0;
    $tem_stock_temporal=0;
    if($tipo_actualizacion==1){
      $tem_stock_temporal=$stock_temporal;
      $nuevo_stock=$stock_actual+$cantidad_total;      
      if ($tipo_registro == 1) {
        $data=array(
        "detalle_stock"=>$nuevo_stock
        );
        $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
        $this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,1,"VENTA DE PRODUCTO", $serie,$correlativo, $precio_unitario,$id_tipo_comprobante);
      }
      if ($tipo_registro == 2) {
        $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
        $data=array(
        "detalle_stock"=>$nuevo_stock,    
        "detalle_stock_temporal"=>$tem_stock_temporal
        );
         $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
      }
      if ($tipo_registro == 3) {
        $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
        $data=array( 
          "detalle_stock_temporal"=>$tem_stock_temporal
        );
        $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
        $this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,1,"VENTA DE PRODUCTO", $serie,$correlativo, $precio_unitario,$id_tipo_comprobante);
      }

      
      return 1;
    }else{
      if($stock_actual>=$cantidad_total){
        $tem_stock_temporal=$stock_temporal;
        $nuevo_stock=$stock_actual-$cantidad_total; 
        if ($tipo_registro == 1) {
          $data=array(
          "detalle_stock"=>$nuevo_stock
          );
          $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");  
          $this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,2,"VENTA DE PRODUCTO", $serie,$correlativo, $precio_unitario,$id_tipo_comprobante);
        }
        if ($tipo_registro == 2) {
          $tem_stock_temporal=$tem_stock_temporal+$cantidad_total; 
          $data=array(
          "detalle_stock"=>$nuevo_stock,    
          "detalle_stock_temporal"=>$tem_stock_temporal
          );
           $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
        }
        if ($tipo_registro == 3) {
          $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
          $data=array(    
          "detalle_stock_temporal"=>$tem_stock_temporal
          );
          $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");  
          $this->movimiento_kardex_producto($detalle_producto_almacen_id,$cantidad_total,2,"VENTA DE PRODUCTO", $serie,$correlativo, $precio_unitario,$id_tipo_comprobante);
        }

        
         return 1;
         exit();
      }else{
        return 0;
        exit();
      }
    }
  }

  public function movimiento_stock_tplatos($id_producto,$detalle_unidad_medida,$cantidad,$precio_unitario,$tipo_actualizacion,$tipo_registro){
    //$datos_detalle_unidad=$this->Mantenimiento_m->consulta2("select * from detalle_unidad_producto where detalle_unidad_producto_id=".$detalle_unidad_medida);
    //$factor_conversion=$datos_detalle_unidad->detalle_unidad_producto_factor;
$factor_conversion = 1;
    $cantidad_total=(float)$factor_conversion*(float)$cantidad;

    $datos_almacen=$this->Mantenimiento_m->consulta2("SELECT producto.producto_stock, producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$id_producto.";");
    $stock_actual=(float)$datos_almacen->producto_stock;
    $stock_temporal=(float)$datos_almacen->producto_stock_temporal;
    $nuevo_stock=0;
    $tem_stock_temporal=0;
    if($tipo_actualizacion==1){
      $tem_stock_temporal=$stock_temporal;
      $nuevo_stock=$stock_actual+$cantidad_total;      
      if ($tipo_registro == 1) {
        $data=array(
        "producto_stock"=>$nuevo_stock
        );
      }
      if ($tipo_registro == 2) {
        $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
        $data=array(
        "producto_stock"=>$nuevo_stock,    
        "producto_stock_temporal"=>$tem_stock_temporal
        );
      }
      if ($tipo_registro == 3) {
        $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
        $data=array( 
          "producto_stock_temporal"=>$tem_stock_temporal
        );
      }

      $this->Mantenimiento_m->actualizar("producto",$data,$id_producto,"producto_id");
      return 1;
    }else{
      if($stock_actual>=$cantidad_total){
        $tem_stock_temporal=$stock_temporal;
        $nuevo_stock=$stock_actual-$cantidad_total; 
        if ($tipo_registro == 1) {
          $data=array(
          "producto_stock"=>$nuevo_stock
          );
        }
        if ($tipo_registro == 2) {
          $tem_stock_temporal=$tem_stock_temporal+$cantidad_total; 
          $data=array(
          "producto_stock"=>$nuevo_stock,    
          "producto_stock_temporal"=>$tem_stock_temporal
          );
        }
        if ($tipo_registro == 3) {
          $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
          $data=array(    
          "producto_stock_temporal"=>$tem_stock_temporal
          );
        }

        $this->Mantenimiento_m->actualizar("producto",$data,$id_producto,"producto_id");  
         return 1;
         exit();
      }else{
        return 0;
        exit();
      }
    }
  }


  public function movimiento_stock($id_almacen,$id_producto,$detalle_unidad_medida,$cantidad,$precio_unitario,$tipo_actualizacion){
    $datos_detalle_unidad=$this->Mantenimiento_m->consulta2("select * from detalle_unidad_producto where detalle_unidad_producto_id=".$detalle_unidad_medida);
    $factor_conversion=$datos_detalle_unidad->detalle_unidad_producto_factor;
    $cantidad_total=(float)$factor_conversion*(float)$cantidad;
    $datos_almacen=$this->Mantenimiento_m->consulta2("select * from detalle_producto_almacen where detalle_producto=".$id_producto." and detalle_almacen=".$id_almacen);
    $stock_actual=(float)$datos_almacen->detalle_stock;
    $stock_temporal=(float)$datos_almacen->detalle_stock_temporal;
    $detalle_producto_almacen_id=$datos_almacen->detalle_producto_almacen_id;
    $nuevo_stock=0;
    $tem_stock_temporal=0;
    if($tipo_actualizacion==1){
      $tem_stock_temporal=$stock_temporal;
      $nuevo_stock=$stock_actual+$cantidad_total;
      $tem_stock_temporal=$tem_stock_temporal-$cantidad_total; 
      $data=array(
        "detalle_stock"=>$nuevo_stock,    
        "detalle_stock_temporal"=>$tem_stock_temporal
      );
      $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");
      return 1;
    }else{
      if($stock_actual>=$cantidad_total){
        $tem_stock_temporal=$stock_temporal;
        $nuevo_stock=$stock_actual-$cantidad_total; 
        $tem_stock_temporal=$tem_stock_temporal+$cantidad_total; 
         $data=array(
        "detalle_stock"=>$nuevo_stock,
        "detalle_stock_temporal"=>$tem_stock_temporal
        );

        $this->Mantenimiento_m->actualizar("detalle_producto_almacen",$data,$detalle_producto_almacen_id,"detalle_producto_almacen_id");  
         return 1;
         exit();
      }else{
        return 0;
        exit();
      }
    }
  }


  public function generar_movimiento($id_caja,$monto,$formapago,$concepto,$descripcion,$tipomovimiento,$id_tipo_comprobante,$descripcion_comprobante,$auxiliar=null,$extornar=null,$igv=null,$verificarin=null,$moneda=1, $precio_moneda=null,$periodo_anual=null,$periodo_mes=null){
    $codigo_comprobante=0;
    $sesion=$this->Mantenimiento_m->consulta2("SELECT max(sesion_caja.id_sesion_caja) as ult from sede_caja,sesion_caja 
      where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and sede_caja.id_sede='".$_COOKIE["id_sede"]."' and sede_caja.id_caja=".$id_caja." and sesion_caja.id_empleado=".$_COOKIE['usuario_id']." and sesion_caja.ses_estado=1");
 
    if ($tipomovimiento == 2) {
      $estado = $this->consultar_saldo($id_caja,$monto,$formapago);
      if ($estado == 50) {
        return 0;
        exit();
      }
    }
    if(isset($sesion->ult)){

      $caja=$this->Mantenimiento_m->consulta2("select * from sede_caja where id_sede=".$_COOKIE["id_sede"]." and id_caja=".$id_caja);
      $id_sede_caja=$caja->id_sede_caja;
      $data = array(
        'id_sesion_caja' => $sesion->ult,
        'mov_formapago' => $formapago,
        'mov_concepto' => $concepto,
        'mov_fecha' => date('Y-m-d'),
        'mov_monto' => $monto,
        'mov_descripcion' => $descripcion,
        'mov_hora'=>date('H:i:s'),
        'id_tipo_comprobante'=>$id_tipo_comprobante,
        'tipo_comprobante_descripcion'=>$descripcion_comprobante,
        "mov_fecha_tiempo"=>date('Y-m-d H:i:s'),
        "mov_igv"=>$igv,
        "mov_monto_cambio" =>$precio_moneda,
        "moneda_id" =>$moneda,
      );
      $estado=$this->db->insert('movimiento', $data);
      $id_movimiento=   $this->db->insert_id();

      $concepto_identificar=$this->Mantenimiento_m->consulta3("SELECT concepto.con_cuenta_contable, concepto.con_id FROM concepto where concepto.con_id=".$concepto);


      if ($tipomovimiento==1){
        $monto_total = $caja->sede_caja_monto + $monto;
      }else{
        $monto_total = $caja->sede_caja_monto  - $monto;
      }
      $data = array(
        'sede_caja_monto' => $monto_total
      );
      $this->db->where('id_sede_caja',$id_sede_caja);
      $estado=$this->db->update('sede_caja', $data);
      $estado=$id_movimiento;
      return $estado;
    }
}


           public function consultar_saldo($id_caja,$monto,$formapago){
              if ($formapago == 1) {
                $monto_ingreso=$this->Mantenimiento_m->consulta3("SELECT sum(movimiento.mov_monto) as monto FROM sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja INNER JOIN movimiento ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id where sede_caja.id_sede=".$_COOKIE["id_sede"]." and concepto.id_tipo_movimiento=1 and sesion_caja.ses_estado=1 and movimiento.mov_estado=1 and concepto.con_estado=1 and sede_caja.id_caja=1");
                $monto_egreso =$this->Mantenimiento_m->consulta3("SELECT sum(movimiento.mov_monto) as monto FROM sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja INNER JOIN movimiento ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id where sede_caja.id_sede=".$_COOKIE["id_sede"]." and concepto.id_tipo_movimiento=2 and sesion_caja.ses_estado=1 and movimiento.mov_estado=1 and concepto.con_estado=1 and sede_caja.id_caja=1");
                $monto_inicio= $this->Mantenimiento_m->consulta3("SELECT  sum(sesion_caja.ses_montoinicial) AS monto FROM   sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja WHERE   sede_caja.id_sede = ".$_COOKIE["id_sede"]." AND sesion_caja.ses_estado = 1 and sede_caja.id_caja=1");
                $total_caja = $monto_ingreso[0]["monto"]+$monto_inicio[0]["monto"]-$monto_egreso[0]["monto"];
                if($monto<=$total_caja){
                  return 1;
                }else{
                  return 50;
                }
              }else{
                $monto_ingreso=$this->Mantenimiento_m->consulta3("SELECT sum(movimiento.mov_monto) as monto FROM sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja INNER JOIN movimiento ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id where sede_caja.id_sede=".$_COOKIE["id_sede"]." and concepto.id_tipo_movimiento=1 and sesion_caja.ses_estado=1 and movimiento.mov_estado=1 and concepto.con_estado=1 and sede_caja.id_caja=2");
                $monto_egreso =$this->Mantenimiento_m->consulta3("SELECT sum(movimiento.mov_monto) as monto FROM sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja INNER JOIN movimiento ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id where sede_caja.id_sede=".$_COOKIE["id_sede"]." and concepto.id_tipo_movimiento=2 and sesion_caja.ses_estado=1 and movimiento.mov_estado=1 and concepto.con_estado=1 and sede_caja.id_caja=2");
                $monto_inicio= $this->Mantenimiento_m->consulta3("SELECT  sum(sesion_caja.ses_montoinicial) AS monto FROM   sede_caja INNER JOIN sesion_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja WHERE   sede_caja.id_sede = ".$_COOKIE["id_sede"]." AND sesion_caja.ses_estado = 1 and sede_caja.id_caja=2");
                $total_caja = $monto_ingreso[0]["monto"]+$monto_inicio[0]["monto"]-$monto_egreso[0]["monto"];
                if($monto<=$total_caja){
                  return 1;
                }else{
                  return 50;
                }
              }
            }


public function actualizar_stock_plato($producto_id,$cantidad,$tipo_movimiento)
{
// 1 es movimiento de sumar los stock, 2 es para restar los stock
  $data_producto=$this->Mantenimiento_m->consulta2(
       "select * from producto where producto_id=".$producto_id
  );

  $stock_producto=(float)$data_producto->producto_stock;
  $producto_id=$data_producto->producto_id;
  $stock_nuevo=0;
  if($tipo_movimiento==1)
   {
        
     $stock_nuevo=$stock_producto+$cantidad;
     $data=array(
     "producto_stock"=>$stock_nuevo
     );
      $this->Mantenimiento_m->actualizar("producto",$data,$producto_id,"producto_id");
      return 1;

   }else
   {

       if($cantidad<=$stock_producto){
              $stock_nuevo=$stock_producto-$cantidad;
              $data=array(
               "producto_stock"=>$stock_nuevo
               );
                $this->Mantenimiento_m->actualizar("producto",$data,$producto_id,"producto_id");
                return 1;


       }else
       {

        return 0;
       }
   }



}


public function movimiento_kardex_producto($id_almacen_producto,$cantidad,$tipo,$descripcion, $serie,$correlativo,$precio_unitario,$tipo_comprobante){
      //tipo entrada de almacen 1, salida de almacen 2

  $ultimo_id=$this->Mantenimiento_m->consulta3("select max(kardex_id) as id from kardex_producto where detalle_producto_almacen_id=".$id_almacen_producto);

  //echo "valor".$ultimo_id[0]["id"];
  if($ultimo_id[0]["id"]==""){
    $total=(float)($cantidad)*(float)($precio_unitario);
    $data=array(
      "detalle_producto_almacen_id"=>$id_almacen_producto,
      "kardex_descripcion"=>"Inventario Inicial",
      "kardex_fecha"=>date("Y-m-d H:i:s"),
      "kardex_tipo"=>1,
      "kardex_serie_comprobante"=>$serie,
      "kardex_correlativo_comprobante"=>$correlativo,
      "kardex_serie_correlativo_comprobante"=>$serie."-".$correlativo,
      "kardex_cantidad_unitaria"=>$cantidad,
      "kardex_precio_unitaria"=>$precio_unitario,
      "kardex_subtotal_unitaria"=>$total,
      "kardex_cantidad_total"=>$cantidad,
      "kardex_precio_total"=>$precio_unitario,
      "kardex_subtotal_total"=>$total,
      "kardex_tipo_comprobante"=>$tipo_comprobante

    );
    $this->Mantenimiento_m->insertar("kardex_producto",$data);
  }else{  
    $datos=$this->Mantenimiento_m->consulta3("select * from kardex_producto where kardex_id=".$ultimo_id[0]["id"]);
    $stock_total=(float)($datos[0]["kardex_cantidad_total"]);
    $subtotal_total=(float)($datos[0]["kardex_subtotal_total"]);
    $ultimo_costo=(float)($datos[0]["kardex_precio_total"]);
    $cantidad_unitario=(float)($cantidad);
    $precio_unitario=(float)($precio_unitario);


    if($tipo==1  ){

      $subtotal_unitaria=$cantidad_unitario*$precio_unitario;


      $cantidad_total=$stock_total+$cantidad_unitario;
      $total_subtotal=$subtotal_total+$subtotal_unitaria;
      $precio_promedio=$total_subtotal/$cantidad_total;

      $data=array(
        "detalle_producto_almacen_id"=>$id_almacen_producto,
        "kardex_descripcion"=>$descripcion,
        "kardex_fecha"=>date("Y-m-d H:i:s"),
        "kardex_tipo"=>1,
        "kardex_serie_comprobante"=>$serie,
        "kardex_correlativo_comprobante"=>$correlativo,
        "kardex_serie_correlativo_comprobante"=>$serie."-".$correlativo,
        "kardex_cantidad_unitaria"=>$cantidad_unitario,
        "kardex_precio_unitaria"=>$precio_unitario,
        "kardex_subtotal_unitaria"=>$subtotal_unitaria,
        "kardex_cantidad_total"=> $cantidad_total,
        "kardex_precio_total"=> $precio_promedio,
        "kardex_subtotal_total"=>$total_subtotal,

        "kardex_tipo_comprobante"=>$tipo_comprobante

      );

      $this->Mantenimiento_m->insertar("kardex_producto",$data);
    }else{

      $subtotal_unitario=$ultimo_costo*$cantidad_unitario;

      $cantidad_total=$stock_total-$cantidad_unitario;
      $total_subtotal=$subtotal_total-$subtotal_unitario;

      $data=array(
        "detalle_producto_almacen_id"=>$id_almacen_producto,
        "kardex_descripcion"=>$descripcion,
        "kardex_fecha"=>date("Y-m-d H:i:s"),
        "kardex_tipo"=>2,
        "kardex_serie_comprobante"=>$serie,
        "kardex_correlativo_comprobante"=>$correlativo,
        "kardex_serie_correlativo_comprobante"=>$serie."-".$correlativo,
        "kardex_cantidad_unitaria"=>$cantidad_unitario,
        "kardex_precio_unitaria"=>$ultimo_costo,
        "kardex_subtotal_unitaria"=>$subtotal_unitario,
        "kardex_cantidad_total"=> $cantidad_total,
        "kardex_precio_total"=> $ultimo_costo,
        "kardex_subtotal_total"=>$total_subtotal,

        "kardex_tipo_comprobante"=>$tipo_comprobante

      );

      $this->Mantenimiento_m->insertar("kardex_producto",$data);


    }

  }
}
  public function estock_actualizar(){
    $tipo_producto = array();
    $idproducto = array();
    $stock_total=0;
    $idproducto = $this->db->query("SELECT detalle_venta.cod_producto_venta, detalle_venta.cantidad FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$_POST["id"].";")->row();
    $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
    if($tipo_producto->producto_id_tipoproducto==1){
      $stock=$this->db->query("SELECT detalle_producto_almacen.detalle_stock as stock FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$idproducto->cod_producto_venta.";")->row();
      $stock_total=$stock->stock;
    }else{
      $stock_total=$this->db->query("SELECT producto.producto_stock as stock FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
      //$stock_total=$this->extraer_stock_plato($idproducto->cod_producto_venta,$_COOKIE["id_sede"]);


    }
    echo $stock_total;
  }

  public function Generarvariascuentas(){ 
    if($_POST['grabar']=='S') {
      $total = 0;
      for ($i=0; $i < count($_POST["cuentas"]) ; $i++) {
        $id_venta=$_POST['id_venta'];
        $total=$total + (double)$_POST['cuentas'][$i]['importe'];
        $nombr_cuenta = $_POST['cuentas'][0]["nombre_cuenta"];
        $estado=1;
      }
      $cuentas["id_venta"] = $id_venta;
      $cuentas["total"] = $total;
      $cuentas["estado"] = 1;
      $data = array(
        "cuentas_idventas" => $id_venta,
        "venta_monto" => $total,
        "venta_estado" => $estado,
        "venta_idsede" => $_COOKIE["id_sede"],
        "nombre_cuenta" =>  $_POST["cuentas"][0]["nombre_cuenta"],
        "venta_fechapedido" => time()
      );
      $this->db->insert('cuentas_venta_temporal', $data);
      $idcuentas = $this->db->insert_id();
      $cuentas["cuentas"] = $_POST["cuentas"];
      for ($i=0; $i < count($_POST["cuentas"]) ; $i++) {
        $datos = array(
          "descripcion" => $_POST["cuentas"][$i]["descripcion"],
          "cantidad" => $_POST["cuentas"][$i]["cantidad"],
          "precio" => $_POST["cuentas"][$i]["precio"],
          "id_venta" => $id_venta,
          "cuentas_idtemporal" => $idcuentas,
          "fecha_preparar" => date("Y/m/d"),
          "estado_descuento" => $_POST["cuentas"][$i]["iddetalleventa"],
          "cod_producto_venta" => $_POST["cuentas"][$i]["codigo_producto"]
        );
        $this->db->insert('detalle_cuentas_temporal', $datos);
        $iddetalle[$i] = $this->db->insert_id();
      }
    }else{
      $total = 0;
      for ($i=0; $i < count($_POST["cuentas"]) ; $i++) {
        $id_venta=$_POST['id_venta'];
        $total=$total + (double)$_POST['cuentas'][$i]['importe'];
        $nombr_cuenta = $_POST['cuentas'][$i]["nombre_cuenta"];
        $estado= $_POST['cuentas'][$i]["estado"];;
      }
      $cuentas["id_venta"] = $id_venta;
      $cuentas["nombr_cuenta"] = $nombr_cuenta;
      $cuentas["total"] = $total;
      $cuentas["estado"] = $estado;
      $cuentas["cuentas"] = $_POST["cuentas"];
    }

// $html = $this->load->view("Apoyo/cuentas",compact('cuentas'));
    $html = '';
    $html = $html.'<div style="position: relative;">';
    $h = 'auto' ;
    $html = $html.'<table width="100%" style="border-bottom: solid 2px #CCC;"   cellspacing="0" class="nombre_'.$nombr_cuenta.'">';
    $html = $html.'<tr>';
    $html = $html.'<td colspan="6" >';
    $html = $html.'<table class="tb_cabecera'.$nombr_cuenta.' tb_general" width="100px" style="width: 16%;float:left;height:'.$h.'" cellspacing="0">';
    $html = $html.'<tr>';
    $html = $html.'<td align="center">';
    $html = $html.'<span style="font-size: 40px;/* font-size: 2em; */font-style: oblique;font-weight: bolder;font-family: monospace;text-transform: uppercase;" class="span-cuentas" >'.$nombr_cuenta.'</span>';
    $html = $html.'<span class="p-cont" style="font-size: 14px;margin-left: 4px;">1</span>';
    $html = $html.'<input type="hidden" value=" '.$nombr_cuenta.'" name="input_cuenta[]" id="input_cuenta[]">';
    $html = $html.'<br>';
    if ($cuentas["estado"] == 1){
      $es = '';
      $dd='none';
    }else{
      $es = 'disabled';
      $dd='block';
    }
    $html = $html.'<p id="mensaje_'.$nombr_cuenta.'" style="font-size: 11px;font-weight: 700;text-align: center;background: rgb(42, 213, 110);width: 91px;margin-top: -5px; left: 35%;top: 60%;display:'.$dd.'">La cuenta ya fue Cancelada</p>';
    $html = $html.'</td>';
    $html = $html.'</tr>';
    $html = $html.'</table>';
    $html = $html.'<table width="83%" class='.$nombr_cuenta.'" style="float:right;border-left: 2px solid #ccc;" index="'.$nombr_cuenta.'" cellspacing="0">';
    $html = $html.'<tr>';
    $html = $html.'<td style="width: 13%;"></td>';
    $html = $html.'<td style="width:35%;"></td>';
    $html = $html.'<td style="width:15%"></td>';
    $html = $html.'<td style="width: 20%"></td>';
    $html = $html.'<td style="width:10%"></td>';
    $html = $html.'</tr>';
    $html = $html.'<tbody class="productos_vta_cuentas_tbody_'.$nombr_cuenta.'">';
    $totalc = 0 ;
    for ($i=0; $i < count($_POST["cuentas"]) ; $i++) {
      if (isset($_POST["cuentas"][$i]['id_temp'])) {
        $id_temp = $_POST["cuentas"][$i]['id_temp'];
        $id_temp_detalle = $_POST["cuentas"][$i]['id_cuentatemp'];
      }else{
        $id_temp = $iddetalle[$i];
        $id_temp_detalle =$idcuentas ;
      }
      if ($_POST["cuentas"][$i]["normal"] =='S' ){
        $t = $_POST["cuentas"][$i]['precio'] * $_POST["cuentas"][$i]['cantidad'];
        $cant=$_POST["cuentas"][$i]['cantidad'];
      }else{
        $t = ($_POST["cuentas"][$i]['precio'] * $_POST["cuentas"][$i]['cantidad']*$cliente)/100;
        $cant=($_POST["cuentas"][$i]['cantidad']*$_POST["cuentas"][$i])/100;
      }
      $totalc = $totalc + $t;

      $html = $html.'<tr>';
      $html = $html.'<td class="p-cantidad_cuenta letrastd" style="text-align: center;">'.sprintf("%.2f",$cant).'</td>';
      $html = $html.'<td class="p-descripcion_cuenta letrastd" style="text-align: left;">';
      $html = $html.'<input type="hidden" name="id_temp_'.$nombr_cuenta.'[]" id="id_temp'.$nombr_cuenta.'"
      value="'.$id_temp_detalle.'" class="id_temp_cuenta"/>';
      $html = $html.'<input type="hidden" name="id_temp_'.$nombr_cuenta.'[]" id="id_temp'.$nombr_cuenta.'"
      value="'.$id_temp.'" class="id_temp_detalle"/>';

      $html = $html.'<input type="hidden" name="codigo_producto_cuenta'.$nombr_cuenta.'[]" id="codigo_producto_cuenta'.$nombr_cuenta.'[]" value="'.$_POST["cuentas"][$i]['codigo_producto'].'" class="codigo_producto_cuenta">';
      $html = $html.'<input type="hidden" name="descripcion_cuenta'.$nombr_cuenta.'[]" id="descripcion_cuenta'.$nombr_cuenta.'[]" value="'.$id_temp_detalle.'" class="descripcion_cuenta">
      ';
      $html = $html.'<input type="hidden" name="nombre_cuentadetalle'.$nombr_cuenta.'[]" id="nombre_cuentadetalle'.$nombr_cuenta.'[]" value="'.$_POST["cuentas"][$i]["descripcion"].'" class="nombre_cuentadetalle"> ';
      $html = $html.'<input type="hidden" name="nombre_cuenta'.$nombr_cuenta.'[]" id="nombre_cuenta'.$nombr_cuenta.'[]" value="'.$nombr_cuenta.'" class="nombre_cuenta"> ';
      $html = $html.'<input type="hidden" name="descripcion_detalle'.$nombr_cuenta.'[]" id="descripcion_detalle'.$nombr_cuenta.'[]" value="'.$id_temp.'" class="descripcion_detalle">
      ';
      $html = $html.'<input type="hidden" name="precio_min_cuenta_'.$nombr_cuenta.'[]" id="precio_min_cuenta'.$nombr_cuenta.'[]" value="'.$_POST["cuentas"][$i]['precio_min'].'"  class="precio_min_cuenta" >';
      $html = $html.'<input type="hidden" name="cantidad_cuenta_'.$nombr_cuenta.'[]" id="cantidad_cuenta'.$nombr_cuenta.'[]" value="'.sprintf("%.2f",$cant).'"class="cantidad_cuenta" >';
      $html = $html.'<input type="hidden" name="precio_cuenta_'.$nombr_cuenta.'[]" id="precio_cuenta'.$nombr_cuenta.'[]" value="'.sprintf("%.2f",$_POST["cuentas"][$i]['precio']).'" class="precio_cuenta">';
      $html = $html.'<input type="hidden" name="importe_cuenta'.$nombr_cuenta.'[]" id="importe_cuenta'.$nombr_cuenta.'[]" value="'.sprintf("%.2f",$t).'" class="importe_cuenta">';
      $html = $html.'<input type="hidden" name="obs_cuenta'.$nombr_cuenta.'[]" id="obs_cuenta'.$nombr_cuenta.'[]" value="'.$_POST["cuentas"][$i]['obs'].'" class="obs_cuenta">';
      $html = $html.'<input type="hidden" name="estado_pedido_cuenta'.$nombr_cuenta.'[]" id="estado_pedido_cuenta'.$nombr_cuenta.'[]" value="'.$_POST["cuentas"][$i]['estado_pedido'].'" class="estado_pedido_cuenta">';
      $html = $html.'<input type="hidden" name="agrupado_cuenta_'.$nombr_cuenta.'[]" id="agrupado_cuenta'.$nombr_cuenta.'[]"  value="'.$_POST["cuentas"][$i]['estado_pedido'].'">';
      $html = $html.'<input type="hidden" name="id_detalle_producto_'.$nombr_cuenta.'[]" id="id_detalle_producto'.$nombr_cuenta.'[]"  value="0" class="id_detalle_producto_cuenta">';
      $html = $html.$_POST["cuentas"][$i]["descripcion"].'</td>';
      $html = $html.'<td class="letrastd" style="text-align: right;">'.$_POST["cuentas"][$i]['precio'].'</td>';
      $html = $html.'<td class="p-precio_cuenta letrastd" style="text-align: right;">'.sprintf("%.2f",$t).'</td>';
      $html = $html.'<td class="letrastd" style="text-align: center;"><a href="#" title = "Eliminar" class="delete"><img src="'.base_url().'public/img/Delete_Icon.png" width="24" height="18"></a></td>';
      $html = $html.'</tr>';
    }
    $html = $html.'</tbody> ';
    $html = $html.'<tr style="font-weight: 700;color: red;" >';
    $html = $html.'<td colspan="2" class="letrastd" style="text-align: right;" >Total S/&nbsp;&nbsp;</td>';
    $html = $html.'<td class="td_tt_x_cuenta" id="td_tt_x_cuenta'.$nombr_cuenta.'" class="letrastd" style="text-align: right;">'.sprintf("%.2f",$totalc).'</td>';
    $html = $html.'<td><input type="hidden"  class="letrastd" id="tt_x_cuenta_'.$nombr_cuenta.'" name="tt_x_cuenta'.$nombr_cuenta.'" class="tt_x_cuenta" value="'.sprintf("%.2f",$totalc).'"></td>';
    $html = $html.'</tr>';
    $html = $html.'<tr>';
    $html = $html.'<td colspan="5" align="right">';
    $html = $html.'<button style="height: 37px;margin-bottom: 5px;" class="btn  btn-success btn-rounded btn_guardar_cuentas" index="'.$nombr_cuenta.'" '.$es.' >guardar</button>';
    $html = $html.'</td>';
    $html = $html.'</tr>';
    $html = $html.'</table>';
    $html = $html.'</td>';
    $html = $html.'</tr>';
    $html = $html.'</table>';
    $html = $html.'<div class="fblock" id="fblock_'.$nombr_cuenta.'"  style="display:'.$dd.'"  ></div>';
    $html = $html.'</div>';

    $data["html"] = $html ;

    echo json_encode($data);


  }

  public function venta_actualizacion_stock($id_producto,$cantidad,$precio_unitario,$serie,$correlativo,$tipo_comprobante){
    if ($tipo_comprobante == 11) {
      $tipo_kardex = 1;
    }else{
      $tipo_kardex = 2;
    }
    $almacen=$this->Mantenimiento_m->consulta3("select * from almacenes where almacen_estado=1 and id_sede=".$_COOKIE["id_sede"]);
    $tipo_producto=$this->Mantenimiento_m->consulta3("select * from producto where producto_id=".$id_producto);
    $primer_almacen=$almacen[0]["almacen_id"];
    $tipo_product = array();
    $stock_detalle = array();

    if($tipo_producto[0]["producto_id_tipoproducto"]==1){


      $tipo_product=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$id_producto.";")->row();
      $producto=array(
        "producto_stock_temporal" => ((float)$tipo_product->producto_stock_temporal - (float)$cantidad)
      );
      $this->db->where('producto_id',$id_producto);
      $estado=$this->db->update('producto', $producto);
      if ( $tipo_producto[0]["producto_id_tipoproducto"]==1) {
        return 0;exit();
      }
    /*  $insumo=$this->Mantenimiento_m->consulta3("select * from producto_insumo where producto_id=".$id_producto);
      foreach ($insumo as $key => $value) {

        $cant_total=(float)($cantidad)*(float)($value["detalle_producto_insumo_cantidad"]);

        $this->actualizar_stock_venta_temporal($value["insumo_id"],$cant_total,$primer_almacen,$value["id_unidad_medida"],$serie,$correlativo,$precio_unitario,$tipo_comprobante,$tipo_kardex);
      }*/
    }else{
      $stock_detalle=$this->db->query("SELECT detalle_producto_almacen.detalle_stock,detalle_producto_almacen.detalle_stock_temporal FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$id_producto.";")->row();
      $detalle_almacen= array(
        "detalle_stock_temporal" => ((float)$stock_detalle->detalle_stock_temporal - (float)$cantidad)
      );
      $this->db->where('detalle_producto',$id_producto);
      $estado=$this->db->update('detalle_producto_almacen', $detalle_almacen);

      $cant_total=(float)($cantidad);
     // $this->actualizar_stock_producto_venta($id_producto,$cant_total,$primer_almacen,$serie,$correlativo,$precio_unitario,$tipo_comprobante,$tipo_kardex);
    }

  }

  public function anular_agrupacion_mesas($id_mesa)
  {

    $sql="update mesa set mesa_estado_agrupacion=0 where mesa_id=?";
    $this->db->query($sql,array($id_mesa));
    $sql="update mesa set mesa_estado_agrupacion=0 where mesa_id_padre=?";
      $this->db->query($sql,array($id_mesa));

  }






  public function enviar_notificacion_cliente($titulo,$mensaje,$cliente,$data=array()){



   $fcmMsg = array(
            'body' =>$mensaje,
            'title' =>$titulo,
            // "image"=> $image,
             "sound"=> "default",
          );

      $cliente=$this->db->query("select empleado_token_firebase from empleados where empleado_id=".$cliente)->row_array();

              $singleID= $cliente["empleado_token_firebase"];
             
          $fcmFields = array( 
            //'registration_ids' => $cliente,
            'to'=>$singleID,
            'priority' => 'high',
            'notification' => $fcmMsg,
            "data"=>$data
    
          );


          $api_key='AAAABs3jF_4:APA91bH4zlTbFV_yRFZHAJXPGPORffwLRBQplre5ea3glbh_JXHgltkR34P2TS8s0zwxBs6veLSVIp0zvo9Hjzf4QVIeCLclSKnGaaTiNbKjmQ5G4DQtFh7Pvhkce7ty4VleHZEnS34S';
          $headers = array(
            'Authorization: key=' .$api_key,
            'Content-Type: application/json'
          );
           
        //   echo json_encode($fcmFields);

          $ch = curl_init();
          curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
          curl_setopt( $ch,CURLOPT_POST, true );
          curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
          curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
          curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
          curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fcmFields,JSON_FORCE_OBJECT ) );
          $result = curl_exec($ch );
        curl_close( $ch );
        //  echo $result . "\n\n";
 //print_r($singleID);exit();

}

}
