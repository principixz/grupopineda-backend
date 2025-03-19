<?php 

require APPPATH . 'libraries/ImplementJwt.php';

require_once "BaseController.php";


  header("Access-Control-Allow-Credentials: true");
  header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Origin, X-Requested-With, Content-Type, Accept, Authorization");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Content-Type: application/json; charset=UTF-8');
class Web_service extends BaseController {

	  public function  __construct(){
    parent::__construct();
    $this->load->model('Servicio_m');

$this->objOfJwt = new ImplementJwt();

   }

   public function index()
   {
    
   }


  public function consultar_token(){


    $header  =  $this->input->request_headers('authorization');
    $token="";

   if(isset($header['Authorization']))
   {
  $token= $header['Authorization'];
   }else{


      $token= $header['authorization'];
   }


    //echo $tokenparametro;exit();

    try {

      ///echo $tokenparametro."";exit();

      $jwtData = $this->objOfJwt->DecodeToken($token);



      return json_encode($jwtData);

    } catch (Exception $e) {

      http_response_code('401');

      echo json_encode(array("status" => false,"message" => $e->getMessage()));exit();

    }

  }
    public function LoginUsuario(){
    // $usuarioexist = true;

  $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
//  echo json_encode($request);exit();

  $usuarioexist=$this->Mantenimiento_m->consulta3("SELECT   empleados.*,perfiles.* FROM    empleados INNER JOIN perfiles on perfiles.perfil_id=empleados.perfil_id 
    WHERE empleado_usuario='".$request['usuario']."' and empleado_clave ='".$request['clave']."' and empleados.estado=1");

 $empresa=$this->db->query("SELECT * from empresa")->row_array();
  if(count($usuarioexist) > 0 ){ 
   $time = time();
   $tokenData['iat'] = $time;
   $tokenData['exp'] =  $time + (60*60*24*250);
   $tokenData['empleado_id'] = $usuarioexist[0]["empleado_id"];
   $tokenData['empleado_perfil'] = $usuarioexist[0]["perfil_id"];
      $tokenData['empresa_sede'] = $usuarioexist[0]["empresa_sede"];
   $jwtToken = $this->objOfJwt->GenerarToken($tokenData);

   $data['ok'] = true;
   $data['msg'] = 'Usuario valido';
   $data['nombre'] = $usuarioexist[0]["empleado_nombres"];
   $data['apellido'] = $usuarioexist[0]["empleado_apellidos"];
   $data['empleado_dni'] = $usuarioexist[0]["empleado_dni"];
   $data['empleado_id'] = $usuarioexist[0]["empleado_id"];
   $data['empleado_perfil'] = $usuarioexist[0]["perfil_id"];
   $data['usuario'] = $request['usuario'];
   $data['perfil_descripcion'] = $usuarioexist[0]['perfil_descripcion'];
   $data['ruc'] = $empresa['empresa_ruc'];
   

   //agrega el token para las notificaciones
      $token=$request['token'];
       $datos=array(
        "empleado_token_firebase"=>$token
       );
    $this->db->where("empleado_id",$usuarioexist[0]["empleado_id"]);
              $r=$this->db->update("empleados",$datos);


   $data['Token'] = $jwtToken;


 }else{
   $data['ok'] = false;
   $data['msg'] = 'Usuario o clave invalido';  
 }

 echo json_encode($data);exit();
}

public function cargardatosempresa()
{

	  $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
  $empresa=$this->db->query("SELECT empresa_razon_social,empresa_direccion,
    empresa_ruc,empresa_color,empresa_fondo,empresa_icono
   from empresa")->row_array();
  echo json_encode($empresa);exit();
}

public function cargar_mesas()
{
     $data_token = json_decode($this->consultar_token(),true);

  $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true);

  $sql_="";
  if((int)$request["tipo"]==2){
   $sql_=" and mesa.mesa_disponible = 0";
  } 
if((int)$request["tipo"]==3){
   $sql_=" and mesa.mesa_disponible = 1";
  } 
if((int)$request["tipo"]==4){
   $sql_=" and mesa.mesa_disponible = 2";
  } 







  $sql="select * from lugar_mesa where lugarmesa_estado=1";
  $tipo=$this->db->query($sql)->result_array();
  $response=array();
  $con_tipo_mesa=0;
  foreach ($tipo as $key => $value) {
     /* $sql1="select mesa.mesa_id as 'id_mesa',CONCAT('M',mesa.mesa_numero) as 'nombre_mesa',
      mesa.mesa_disponible as 'disponible'
       from mesa where mesa_estado='1' and mesa_id_lugar=".$value["lugarmesa_id"]." order by mesa.mesa_numero asc";*/


       $sql1="
       SELECT
  mesa.mesa_tipo,
  mesa.mesa_id,
IF
  (
    mesa.mesa_tipo <> 1,
    CONCAT( 'Mesa ', CONCAT( mesa.mesa_numero, buscar_mesas_hijo ( mesa.mesa_id ) ) ),
    CONCAT( 'Llevar ', mesa.mesa_numero ) 
  ) AS nombre_silla,
  lugar_mesa.lugarmesa_descripcion,
  mesa.mesa_id AS silla_idsilla,
  IF(venta.venta_pedidofecha is null,'',venta.venta_pedidofecha) as 'venta_pedidofecha',
  mesa.mesa_disponible AS silla_estado,
IF
  (
    mesa.mesa_disponible = 0,
    'Desocupado',
  IF
    ( mesa.mesa_disponible = 1, 'Ocupado', IF ( mesa.mesa_disponible = 2, 'Reservado', 'ERROR' ) ) 
  ) AS nombre_estado,
  IF(mesa.mesa_disponible = 0,'success',IF(mesa.mesa_disponible = 1,'danger',IF(mesa.mesa_disponible = 2,'warning','ERROR'))) AS nombre_color,

  
  if(venta.venta_idventas is null,0,venta.venta_idventas) as 'venta_idventas',
  if(venta.venta_codigomozo is null,0,venta.venta_codigomozo) as 'venta_codigomozo',
 
  if(venta.venta_monto is null,0,venta.venta_monto) as 'venta_monto',
  mesa.mesa_numero,
  
  mesa.mesa_estado_agrupacion as 'agrupado' ,
  mesa.mesa_disponible as 'disponible'
FROM
  mesa
  INNER JOIN lugar_mesa ON mesa.mesa_id_lugar = lugar_mesa.lugarmesa_id
  LEFT JOIN venta ON venta.venta_codigomesa = mesa.mesa_id 
  AND venta.venta_estado != 0 
  AND venta.venta_estado != 2 
WHERE
  mesa.mesa_id != 0 
  AND lugar_mesa.id_sede = 1 
  AND mesa.mesa_estado = 1 
  AND ( CONCAT( 'Mesa ', mesa.mesa_numero ) LIKE '%%' ) 
  AND mesa.mesa_estado_agrupacion IN ( 1, 0 ) 
  ".$sql_."
  AND   mesa_id_lugar=".$value["lugarmesa_id"]."  ORDER BY
  mesa.mesa_tipo ASC,
  mesa.mesa_numero";
  //echo $sql1;
       $mesas=$this->db->query($sql1)->result_array();
       if(count($mesas)>0)
       {
            $response[$con_tipo_mesa]["tipo"]["nombre"]= $value["lugarmesa_descripcion"];
            $response[$con_tipo_mesa]["tipo"]["id"]= $value["lugarmesa_id"];
            $response[$con_tipo_mesa]["tipo"]["mesas"]= $mesas;
            $con_tipo_mesa++;

        
       }

  }


header('Content-type:application/json;charset=utf-8');
echo json_encode($response);exit();

}



public function buscar_producto()
{
       $data_token = json_decode($this->consultar_token(),true);

   $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
  $sql="( SELECT
  producto.producto_encendido,
  producto.producto_id_tipoproducto,
  producto.producto_id,
  producto.producto_descripcion,
  producto.producto_precio,
  producto.categoria_producto_id,
  detalle_producto_almacen.detalle_stock AS stock,
  producto.producto_imagen 
  FROM
    producto
    INNER JOIN detalle_producto_almacen ON detalle_producto_almacen.detalle_producto = producto.producto_id
    INNER JOIN almacenes ON detalle_producto_almacen.detalle_almacen = almacenes.almacen_id 
  WHERE
    producto_estado = 1 
    AND ( producto_descripcion LIKE '' OR producto_codigobarra LIKE '' ) 
    AND producto.producto_id_tipoproducto = 1 
    AND almacenes.id_sede = 1 
    AND detalle_producto_almacen.detalle_almacen = 1 
  ) UNION
  (
  SELECT
    producto.producto_encendido,
    producto.producto_id_tipoproducto,
    producto.producto_id,
    producto.producto_descripcion,
    producto.producto_precio,
    producto.categoria_producto_id,
    producto.producto_stock AS stock,
    producto.producto_imagen 
  FROM
    producto 
  WHERE
    producto.id_sede = 1 
    AND producto.producto_estado = 1 
    AND producto.producto_id_tipoproducto = 3 
    AND ( producto.producto_descripcion LIKE '' OR producto.producto_codigobarra LIKE '' ) 
    AND producto.id_sede = 1 
  GROUP BY
    producto.producto_id 
  ORDER BY
  producto.producto_id_tipoproducto 
  )";


 $productos=$this->db->query($sql)->result_array();
$response=array();
    if (count($productos) != 0) {

      foreach ($productos as $key => $value) {
                $url="";

                  if($value["producto_imagen"]!="")
                  {
                    $url= $value['producto_imagen'];
                  }
                  else{
                    $url= 'default.jpg';
                  }
                  if((int)$value["producto_encendido"]==0)
                  {
                   $value["stock"]=0;
                  }
                  if($value["producto_id_tipoproducto"]=="1"){
                      $stock=$value["stock"];
                      if($stock==0){

                        $url= 'agotado.png';
                      }
                  }else{
                    $stock=$value["stock"];
                    if($stock==0){
                      $url= 'agotado.png';
                    }
                  } 


                                 
                  if((int)$value["producto_encendido"]==0)
                  {
                    $stock=0;

                  }

               $response[$key]["producto_encendido"]=$value["producto_encendido"];
               $response[$key]["producto_id_tipoproducto"]=$value["producto_id_tipoproducto"];
                 $response[$key]["categoria_producto_id"]=$value["categoria_producto_id"];
               $response[$key]["producto_id"]=$value["producto_id"];
               $response[$key]["producto_descripcion"]=$value["producto_descripcion"];
               $response[$key]["producto_precio"]=$value["producto_precio"];
               $response[$key]["stock"]=(int)$stock;
               $response[$key]["imagen"]=$url;




      }
    }

$response1=array();

  $sql2="select 
producto_descripcion as 'descripcion',
producto_id as 'id_producto',
detalle_venta.descripcion as 'comentario',
detalle_venta.precio as 'precio',
detalle_venta.cantidad as 'cantidad',
detalle_venta.id_detalle_venta as 'iddetalle'
from detalle_venta
INNER JOIN producto on producto.producto_id=detalle_venta.cod_producto_venta
where 
estado_pedido=1 and
detalle_venta.id_venta=".$request["idventa"];
$response2=$this->db->query($sql2)->result_array();
$response1["productos"]=$response;
$response1["detalle"]=$response2;

header('Content-type:application/json;charset=utf-8');
 echo json_encode($response1);exit();
}

public function procesar_pedido()
{

    $data_token = json_decode($this->consultar_token(),true);
  //  print_r($data_token);

    $response=array();

    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);
    $idventa=$request["idventa"];
    $idempleado= $data_token["empleado_id"];
    $idmesa=$request["idmesa"];
    $idsede=$data_token["empresa_sede"];

         $sql="SELECT IF(".$idmesa."=1,1,(mesa.mesa_disponible)) AS band,mesa.mesa_empleado,
        mesa.mesa_empleado,empleados.empleado_nombres,empleados.empleado_apellidos,mesa.mesa_id
        FROM mesa
        LEFT JOIN empleados ON empleados.empleado_id = mesa.mesa_empleado
        where mesa.mesa_id = ".$idmesa." ";
      $estado_ubicacion=$this->db->query($sql)->row(); 
      if (isset($estado_ubicacion->band)) {
        $estadoubicacion =$estado_ubicacion->band; 
        $empleado = $estado_ubicacion->mesa_empleado;
      }else{
        $estadoubicacion = 0; 
      } 


    $this->db->trans_begin();

      if (true ) {  

      $contador_tipoproducto=2;
      $pantallaestado =1 ;
    $suma = 0;
      foreach ($request["pedido"] as $k => $v) {
          if($v["estado"]==1){
        $prod_tipo=$this->Mantenimiento_m->consulta3("SELECT producto.producto_id_tipoproducto FROM producto where producto.producto_id_tipoproducto=1 and producto.producto_id=".$v["idplato"]);

          $suma = $suma +  ($v["cantidad"]*$v["precio"]);
        if(count($prod_tipo)>0){
          $contador_tipoproducto=2;
        }
        }
      }

      $estado_ubicacion=$this->db->query("SELECT IF(".$idmesa."=1,1,(mesa.mesa_disponible)) as 'mesa_disponible' FROM mesa where mesa.mesa_id =".$idmesa.";")->row();
      $nombre_variable = 'venta_codigomesa';
      $estado_ubicacion = $estado_ubicacion->mesa_disponible;
      if ($estado_ubicacion == 1) {
        $consulta_venta = $this->db->query("SELECT venta.venta_idventas,venta.venta_codigomozo,venta.venta_monto FROM venta where venta.venta_idventas =".$idventa." and venta.venta_estado != 2 and venta.venta_estado != 0;")->row();
        $id_venta = $consulta_venta->venta_idventas;
        $id_mozo =$consulta_venta->venta_codigomozo;
        $suma = $suma + $consulta_venta->venta_monto;       
        $venta_monto = $suma;

      }else{
        $id_mozo = $idempleado;
        $venta_monto = $suma;
      }







    if ($estado_ubicacion == 1){
      $ventaupdate = array(
        "venta_codigomozo" => $id_mozo,
        "venta_idsede" => $idsede,
        "venta_codigocliente" =>1,
      
        "venta_monto" => $venta_monto,
        "venta_estadococina"=>$pantallaestado,
        $nombre_variable => $idmesa
      );  

      $this->db->where('venta_idventas',$id_venta);
      $estado=$this->db->update('venta', $ventaupdate);
      $tipo_registro = 2;
    }else{
      $data = array(
        "venta_fechapedido" => time(), 
        "venta_pedidofecha" => date("Y-m-d H:i:s"),
        "venta_codigomozo" => $id_mozo,
        "venta_idsede" =>  $idsede,
        "venta_codigocliente" =>1,
   
        "venta_estadococina"=>$pantallaestado,
        "venta_monto" => $venta_monto,
        $nombre_variable => $idmesa 
      );  
      
      $this->db->insert('venta', $data);
      $id_venta = $this->db->insert_id(); 
 
        $mesa = array(
          'mesa_empleado' => $id_mozo,
          'mesa_disponible' => 1
        );
        $this->db->where('mesa_id',$idmesa);
        $estado=$this->db->update('mesa', $mesa); 
       $tipo_registro = 2;

    }
    
    $impr = array(
      "detalle_venta_imprimir" => 0
    );
    $this->db->where('id_venta',$id_venta);
    $this->db->update('detalle_venta',$impr);
    $tipo_producto = array();
    $stock_detalle = array();
    
 




 foreach ($request["pedido"] as $k => $v) {
  if($v["estado"]==1){
      $estado_preparado=1;
      //milton
      $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$v["idplato"].";")->row();
      if($tipo_producto->producto_id_tipoproducto==1){
        $almacen_id = $this->Mantenimiento_m->consulta2("SELECT almacen_id FROM almacenes where almacenes.id_sede = ".$idsede." and almacen_uso = 1 ");
        $id_almacen=$this->Mantenimiento_m->consulta2("SELECT detalle_producto_almacen.detalle_almacen as id_almacen FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$v["idplato"]." AND detalle_producto_almacen.detalle_almacen = ".$almacen_id->almacen_id.";");
        $id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida
          INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida 
          WHERE producto.producto_id = ".$v["idplato"]);

        $this->movimiento_stock_temporal($id_almacen->id_almacen,$v["idplato"],$id_unidad_medida->detalle_unidad_producto_id,$v["cantidad"],$v["precio"],2,$tipo_registro);

      }else{
        //$id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida HERE producto.producto_id = ".$ventas_producto["id_producto"][$i]);
        $this->movimiento_stock_tplatos($v["idplato"],null,$v["cantidad"],$v["precio"],2,$tipo_registro);       
      }
      //fin milton
      $datos = array(
        "descripcion" => $v["comentario"],
        "cantidad" => $v["cantidad"],
        "precio" => $v["precio"],
        "id_venta" => $id_venta,
        "fecha_preparar" => date("Y/m/d"),
        "id_tipoentrega" => 1,
        "cod_producto_venta" => $v["idplato"],
        "detalle_estado_preparado"=>$estado_preparado
      );
      
      $this->db->insert('detalle_venta', $datos);
      }
    }
 
    //$this->imprimir_comanda($id_venta);
   
    //$this->imprimir_comprobante($id_venta);
    /*$data = array(
      "venta_idventas" => $id_venta,
      "sesion_impresora_id" => 84
    );
    $this->db->insert('impresion',$data); */
    if ($this->db->trans_status() === FALSE){       
      $this->db->trans_rollback();      
     // return false;    
        $response["estado"]=false;
      $response["mensaje"]="Se produjo un error en la operacion";
    }else{      
      $this->db->trans_commit();    
      ///return true;    

        $response["estado"]=true;
      $response["mensaje"]="Se proceso correctamente";
    }   


 //echo $suma;exit();



     // $ayuda["accion"] = $this->pedidoconsumoaqui($ventas_producto,$ventas_total_pagar,$igv,$cantidadproductos,1);
    }else{
      //$ayuda["accion"] = $this->pedidoconsumoaqui($ventas_producto,$ventas_total_pagar,$igv,$cantidadproductos,1);
    /*  if ($estadoubicacion == 1 && ($empleado == $_COOKIE["usuario_id"] || $id==1)) {       
        $ayuda["accion"] = $this->pedidoconsumoaqui($ventas_producto,$ventas_total_pagar,$igv,$cantidadproductos,1);
      }else{
        $ayuda["accion"] = 3;
        
      }*/

      $response["estado"]=false;
      $response["mensaje"]="Se produjo un error en la operacion";
    }

    echo json_encode($response);
    exit();
}

public function ws_reservar_mesa()
{

 $data_token = json_decode($this->consultar_token(),true);
  //  print_r($data_token);

 // opcion 0 anular reserva, 2 reservar

    $response=array();

    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);

  $id_silla=$request["idsilla"];
      $estado=$request['opcion'];
      $sql="update mesa set mesa_disponible=? where mesa_id=?";
      $this->db->query($sql,array($estado,$id_silla));
          $response["estado"]=true;
      $response["mensaje"]="Se proceso correctamente";
      echo json_encode($response);exit();
}

//funcion que no se usar
  public function anularpedido()
    {

 $data_token = json_decode($this->consultar_token(),true);
  //  print_r($data_token);

    $response=array();

    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);
      $id_silla=$request["idsilla"];
      //$estado=$_POST['opcion'];
      $sql="update mesa set mesa_disponible=0 where mesa_id=?";
      $this->db->query($sql,array($id_silla));

      $response["estado"]=true;
      $response["mensaje"]="Se proceso correctamente";
      echo json_encode($response);exit();

    }




   public function LoginUsuarioWeb(){
    // $usuarioexist = true;
    
  $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
//  echo json_encode($request);exit();`

  $usuarioexist=$this->Mantenimiento_m->consulta3("SELECT   empleados.*,perfiles.* FROM    empleados INNER JOIN perfiles on perfiles.perfil_id=empleados.perfil_id 
    WHERE empleado_usuario='".$request['usuario']."' and empleado_clave ='".$request['clave']."' and empleados.estado=1");

 $empresa=$this->db->query("SELECT * from empresa")->row_array();
  if(count($usuarioexist) > 0 ){
  //jwt 
   $time = time();
   $tokenData['iat'] = $time;
   $tokenData['exp'] =  $time + (60*60*24*250);
   $tokenData['empleado_id'] = $usuarioexist[0]["empleado_id"];
   $tokenData['empleado_perfil'] = $usuarioexist[0]["perfil_id"];
   $tokenData['empresa_sede'] = $usuarioexist[0]["empresa_sede"];
   $tokenData['empresa_ruc']=$empresa['empresa_ruc'];
   $jwtToken = $this->objOfJwt->GenerarToken($tokenData);

   $data['ok'] = true;
   $data['msg'] = 'Usuario valido';
   $data['nombre'] = $usuarioexist[0]["empleado_nombres"];
   $data['apellido'] = $usuarioexist[0]["empleado_apellidos"];
   $data['empleado_dni'] = $usuarioexist[0]["empleado_dni"];
   $data['empleado_id'] = $usuarioexist[0]["empleado_id"];
   $data['empleado_perfil'] = $usuarioexist[0]["perfil_id"];
   $data['usuario'] = $request['usuario'];
   $data['perfil_descripcion'] = $usuarioexist[0]['perfil_descripcion'];
   $data['ruc'] = $empresa['empresa_ruc'];


    $perfil=$this->db->query("SELECT * from perfiles where perfil_id=".$usuarioexist[0]["perfil_id"])->row_array();
    $data["url_inicial"]=$perfil["perfil_url_nuevo"];

   //agrega el token para las notificaciones
  /*    $token=$request['token'];
       $datos=array(
        "empleado_token_firebase"=>$token
       );
    $this->db->where("empleado_id",$usuarioexist[0]["empleado_id"]);
              $r=$this->db->update("empleados",$datos);*/


   $data['Token'] = $jwtToken;


 }else{
   $data['ok'] = false;
   $data['msg'] = 'Usuario o clave invalido';  
 }

 echo json_encode($data);exit();
}
public function cargar_menu(){

  $data_token = json_decode($this->consultar_token(),true);
  $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 

    // print_r($data_token["empleado_id"]);exit();
  $modulos=$this->Mantenimiento_m->consulta3(" SELECT * FROM  modulos WHERE modulo_id !=1  AND modulo_padre = 1 AND estado = 1 ");
  $i = 1;
  $response = array();
  $response[0]["header"]="Menu";
  foreach ($modulos as $keymodulo ) {  
   $lista_mod = $this->Mantenimiento_m->consulta3("SELECT   modulos.* FROM empleados 
     INNER JOIN   permisos_sede ON  empleados.perfil_id = permisos_sede.persed_id_perfil
     INNER JOIN modulos ON permisos_sede.persed_id_modulo = modulos.modulo_id 
     WHERE modulos.estado = 1 and empleados.empleado_id = ".$data_token["empleado_id"]." AND modulo_padre = ".$keymodulo["modulo_id"]." ");
   $band = false;
   $cont = 0;
   foreach ($lista_mod as $key => $listamodulos) {
    $band = true;
    $response[$i]["children"][$cont]["label"] = $listamodulos["modulo_nombre"];
    $response[$i]["children"][$cont]["route"] = $listamodulos["modulo_url"];  
        $response[$i]["children"][$cont]["id"] = $listamodulos["modulo_id"];  
    $cont++;
  }
  if($band){
    $response[$i]["label"] = $keymodulo["modulo_nombre"];
   // $response[$i]["url"] = $keymodulo["modulo_url"];  
    $response[$i]["iconClasses"] = $keymodulo["modulo_icono"]; 
     $response[$i]["id"] = $keymodulo["modulo_id"]; 
    $i++;
  }

}



echo json_encode($response);

}

/****************************************** concepto********************************/
public function lista_concepto()
{
  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
         $data["lista_concepto"]=$this->Mantenimiento_m->consulta3("select concepto.con_id as 'id',
 concepto.con_descripcion as 'descripcion',
 tipo_movimiento.tipo_movimiento_descripcion as 'descripcion_tipo' from concepto,tipo_movimiento where concepto.id_tipo_movimiento=tipo_movimiento.id_tipo_movimiento and con_estado_visible=1 and con_estado=1 and (id_sede IS NULL  or id_sede=".$data_token["empresa_sede"].")");

         echo json_encode($data);exit();


}

public function eliminar_concepto()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update concepto set con_estado=0 where con_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

  public function cargar_tipo_concepto()
  {

      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

      $response=$this->Mantenimiento_m->consulta3("select * from tipo_movimiento");
       echo json_encode($response);exit();

  }

  public function guardar_concepto()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              "id_tipo_movimiento"=>$request["tipo"],
              "con_descripcion"=>$request["descripcion"],
              "id_sede"=>$data_token["empresa_sede"]
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('concepto', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('con_id',$request["id"]);
        $estado=$this->db->update('concepto', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }
  public function cargar_concepto_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from concepto where con_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }


  /*******************************************tipo documento*******************************************/
public function lista_tipo_documento()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select tipodoc_id as 'id',tipodoc_descripcion as 'descripcion' from tipo_documento where tipodoc_estado =1");

         echo json_encode($data);exit();
}

public function eliminar_tipo_documento()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update tipo_documento set tipodoc_estado='0' where tipodoc_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

  public function guardar_tipo_documento()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "tipodoc_descripcion"=>$request["descripcion"],
            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('tipo_documento', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('tipodoc_id',$request["id"]);
        $estado=$this->db->update('tipo_documento', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

   public function cargar_tipo_documento_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from tipo_documento where tipodoc_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }

/***************************************************marca de producto****************************/

public function lista_marca_producto()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select marca_id as 'id',marca_descripcion as 'descripcion'from marca where marca_estado=1");

         echo json_encode($data);exit();
}


  public function guardar_marca_producto()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "marca_descripcion"=>$request["descripcion"],
            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('marca', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('marca_id',$request["id"]);
        $estado=$this->db->update('marca', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

  public function eliminar_marca_producto()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update marca set marca_estado='0' where marca_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

   public function cargar_marca_producto_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from marca where marca_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }
/***************************************************tipo de moneda****************************/


public function lista_tipo_moneda()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select moneda_id as 'id',moneda_descripcion as 'descripcion' from monedas where moneda_estado='1'");

         echo json_encode($data);exit();
}

public function eliminar_tipo_moneda()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update monedas set moneda_estado ='0' where moneda_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

   public function guardar_tipo_moneda()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "moneda_descripcion"=>$request["descripcion"],
            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('monedas', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('moneda_id',$request["id"]);
        $estado=$this->db->update('monedas', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

public function cargar_uno_tipo_moneda()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from monedas where moneda_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }
/***************************************************ubicacion de mesa****************************/
public function lista_ubicacion_mesa()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select lugar_mesa.lugarmesa_id as 'id',lugar_mesa.lugarmesa_descripcion as 'descripcion' from lugar_mesa where lugarmesa_estado =1 and id_sede=".$data_token["empresa_sede"]);

         echo json_encode($data);exit();
}

public function guardar_ubicacion_mesa()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "lugarmesa_descripcion"=>$request["descripcion"],
           "id_sede" => $data_token["empresa_sede"]
            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('lugar_mesa', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('lugarmesa_id',$request["id"]);
        $estado=$this->db->update('lugar_mesa', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

public function eliminar_ubicacion_mesa()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update lugar_mesa set lugarmesa_estado=0 where lugarmesa_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

  public function cargar_uno_ubicacion_mesa()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from lugar_mesa where lugarmesa_estado =1 and lugarmesa_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }

/*-------------------------------------------------------------------cocina**********************************************************/




public function ws_mostrar_cocina()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
$data="";

$cocina=array();

     $data=$this->Mantenimiento_m->consulta3(" SELECT if(datos_delivery.nombre IS null,'',datos_delivery.nombre) as 'nombre_delivery'
 ,mesa.*,venta.*,clientes.*,empleados.*,buscar_mesas_hijo(mesa.mesa_id) as 'mesas_agrupas'
FROM
mesa
left JOIN venta ON mesa.mesa_id = venta.venta_codigomesa
left JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
INNER JOIN empleados ON venta.venta_codigomozo = empleados.empleado_id 
LEFT JOIN datos_delivery ON datos_delivery.id_venta=venta.venta_idventas
where  venta.venta_idsede=".$data_token["empresa_sede"]." and (venta.venta_estado!=0 and venta.venta_estadococina = 1) 
   
order by venta.venta_idventas asc");


  


$contador=0;
foreach ($data as $key => $value) {
   $cont=0;
    $mod = $this->db->query("SELECT *
                FROM
                producto
                INNER JOIN detalle_venta ON detalle_venta.cod_producto_venta = producto.producto_id

                
                where  
                detalle_venta.cod_producto_venta<>9999 and
               detalle_venta.detalle_estado_preparado=1 and
               detalle_venta.estado_pedido=1 and
                detalle_venta.id_venta=".$value["venta_idventas"])->result_array();
                                 $data[$key]["lista"] = $mod;
            
                foreach ($mod as $key1 => $detalle_datos) {
                  $cont=1;
                     
                }

                if( $cont==1)
                {
                  $cocina[$contador]=$value;
                    $cocina[$contador]["lista"] = $mod;
                   $contador++;
                }


}

                  /*  foreach ($data as $key => $value) {
                                $mod = $this->db->query("SELECT *
                FROM
                producto
                INNER JOIN detalle_venta ON detalle_venta.cod_producto_venta = producto.producto_id
                INNER JOIN tipo_entrega ON detalle_venta.id_tipoentrega = tipo_entrega.tipoentrega_idtipoentrega
                where detalle_venta.id_venta=".$value["venta_idventas"]." and detalle_venta.detalle_estado_preparado=1 and detalle_venta.estado_pedido<>0 and producto.producto_id_tipoproducto=1")->result_array();
                                 $data[$key]["lista"] = $mod;
                    }*/


    echo json_encode($cocina);
}

public function actividad_venta(){
   $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 

    $sql="SELECT
venta.venta_codigomozo,

lugar_mesa.lugarmesa_descripcion,
UPPER(CONCAT('El pedido de la mesa ',
mesa_numero,buscar_mesas_hijo(mesa.mesa_id),' sector ',
CAST(lugar_mesa.lugarmesa_descripcion AS CHAR CHARACTER SET utf8)

 ,' esta listo para entregar al cliente')) as 'mesa',
'PEDIDO PREPARADO' as 'titulo'
from venta
inner join mesa on venta.venta_codigomesa=mesa.mesa_id
inner join lugar_mesa on lugar_mesa.lugarmesa_id=mesa.mesa_id_lugar

where venta.venta_idventas=".$request["id"];

$resp=$this->db->query($sql)->row_array();

$titulo=$resp["titulo"];
$mensaje=$resp["mesa"];
$cliente=$resp["venta_codigomozo"];
$data=array(
"titulo"=>$resp["titulo"],
"mensaje"=>$resp["mesa"]

);
$this->enviar_notificacion_cliente($titulo,$mensaje,$cliente,$data);


  $data=array(
        "venta_estadococina"=>2,
        "venta_fecha_preparacion"=>date("Y-m-d H:i:s")
    );
   
   $this->db->where('venta_idventas', $request["id"]);
      $this->db->update('venta', $data);


       $data=array(
       "detalle_estado_preparado"=>2,
    "fecha_preparar"=>date("Y-m-d H:i:s")
    );
   
   $this->db->where('id_venta', $request["id"]);
      $this->db->update('detalle_venta', $data);

   /* $data=$this->Mantenimiento_m->consulta3("SELECT producto.producto_id,detalle_venta.cantidad FROM  venta
  INNER JOIN detalle_venta ON detalle_venta.id_venta = venta.venta_idventas
  INNER JOIN producto ON detalle_venta.cod_producto_venta = producto.producto_id
  WHERE venta.venta_idsede=".$_COOKIE["id_sede"]." and producto.producto_id_tipoproducto = 1 and venta_idventas=".$_POST["id"]);
  foreach ($data as $key => $value) {
    $id_producto =$value["producto_id"] ;
    $cantidad = $value["cantidad"];
    $this->actualizar_stock_insumo_salida($id_producto,$cantidad);
  }
  echo 1 ;*/

       $response["estado"]=true;
      $response["mensaje"]="Se Preparo correctamente";
      echo json_encode($response);exit();
}


 public function deshacer_preparar()
     {
        
     $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
                 
            $data=array(
                "venta_estadococina"=>1,
                "venta_fecha_preparacion"=>""
            );
           
           $this->db->where('venta_idventas', $request["id"]);
              $this->db->update('venta', $data);


               $data=array(
               "detalle_estado_preparado"=>1,
            "fecha_preparar"=>""
            );
           
             $this->db->where('id_venta', $request["id"]);
                $this->db->update('detalle_venta', $data);

               $response["estado"]=true;
      $response["mensaje"]="Se proceso correctamente";
      echo json_encode($response);exit();


     }

/*****************************************************pagos****************************************************************/


public function buscar_cliente(){  
    $id=$this->input->get("tipo_pago");
  //  echo $id;
   $total = $this->input->get("totalpago");
   $tipo_pago=$this->input->get("tipo_pago");
   // $total=1;
    //$tipo_pago=1;
    $sql_insertar="";
    if($tipo_pago==2){
      $sql_insertar=" and cliente_id<>1";
    }
     if ($id == "1" || $id == "4" ) {
       $sql="SELECT cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni  from clientes where LENGTH(cliente_dni) =11 and (estado=1   and (cliente_nombres LIKE '%".$this->input->get("search")."%' or cliente_dni LIKE '%".$this->input->get("search")."%' or cliente_celular LIKE '%".$this->input->get("search")."%'  ) ".$sql_insertar.") limit 10";
    }else{
      if($id != "6"){
        if ($id == "2" and $total > 700) {
           $sql="SELECT  cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni from clientes where (estado=1 and clientes.cliente_id!=1 and (LENGTH(cliente_dni) = 8  ) and  (cliente_nombres LIKE '%".$this->input->get("search")."%' or cliente_dni LIKE '%".$this->input->get("search")."%' or cliente_celular LIKE '%".$this->input->get("search")."%' ) ".$sql_insertar.") limit 10";
        }else{
           $sql="SELECT  cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni from clientes where ((estado=1  and (LENGTH(cliente_dni) = 8 ) and (cliente_nombres LIKE '%".$this->input->get("search")."%' or cliente_dni LIKE '%".$this->input->get("search")."%' or cliente_celular LIKE '%".$this->input->get("search")."%' ) ".$sql_insertar.") ) limit 10";
        }
      }else{
        $sql="SELECT cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni  from clientes where (estado=1 and (cliente_nombres LIKE '%".$this->input->get("search")."%' or cliente_dni LIKE '%".$this->input->get("search")."%' or cliente_celular LIKE '%".$this->input->get("search")."%' ) ".$sql_insertar.") limit 10";
      }
    }
    

        //$sql="SELECT cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni  from clientes where (estado=1 and (cliente_nombres LIKE '%".$this->input->get("q")."%' or cliente_dni LIKE '%".$this->input->get("q")."%' or cliente_celular LIKE '%".$this->input->get("q")."%' ) ".$sql_insertar.") limit 10";
    $data=$this->Mantenimiento_m->consulta3($sql);
    $data1=array();
    foreach ($data as $key => $value) {
      $sql="select * from direccion where cliente_id=".$value["cliente_id"]." and direccion_estado=1 order by direccion_id desc";
      $direcciones=$this->db->query($sql)->row_array();
    //  $direccion=$this->db->query($sql);
      $data1[$key]["id"]=$value["cliente_id"]."/".$value["cliente_dni"]."/".$value["cliente_nombres"]."/".$direcciones["direccion_id"]."/".$direcciones["direccion_descripcion"];
      $data1[$key]["text"]=$value["cliente_nombres"];
      $data1[$key]["documento"]=$value["cliente_dni"];
    }
    echo json_encode($data1);

}

public function cargar_tipo_documento()
{

    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 

  $sql="select * from tipo_documento where tipodoc_estado=1 and tipodoc_id in(1,2,6) order by tipodoc_id desc";
  $re=$this->db->query($sql)->result_array();
  $sql="select * from formapago where for_estado=1 and for_id not in (1)";
    $re1=$this->db->query($sql)->result_array();
  $response["tipo_documento"]=$re;
  $response["formapago"]=$re1;

  echo json_encode($response);exit();


}



private function calcular_monto_entregado($pago)
{
  $efectivo=0;
  $total_dato=0;
  $tarjeta=0;
  if($pago["efectivo"]!=''){
   $efectivo=(float)$pago["efectivo"];
  }
  $pago_tarjeta=$pago["tarjeta"];
    foreach ($pago_tarjeta as $key => $value) {
     if($value["monto"]!=""){
        $tarjeta+=(float)$value["monto"];
     }
  }

    $total_dato=$efectivo+$tarjeta;

    return $total_dato;


}

private function crear_pagos_movimiento($pago, $total_pagar){
    $this->db->trans_begin(); // Iniciar transacción

    $cargar_caja = array();
    $vuelto = 0;

    try {
        if (!empty($pago["efectivo"])) {
            $efectivo = (float)$pago["efectivo"];

            if ($efectivo > $total_pagar) {
                $vuelto = $efectivo - $total_pagar;
                $cargar_caja[] = array("tipo_caja" => 1, "monto" => $total_pagar, "forma_pago" => 1);
            } else {
                $cargar_caja[] = array("tipo_caja" => 1, "monto" => $efectivo, "forma_pago" => 1);
            }
        }

        $pago_tarjeta = $pago["tarjeta"] ?? [];
        foreach ($pago_tarjeta as $key => $value) {
            if (!empty($value["monto"])) {
                $cargar_caja[] = array(
                    "tipo_caja" => 2,
                    "monto" => (float)$value["monto"],
                    "forma_pago" => (int)$value["tipo_comprobante"]
                );
            }
        }

        $retornar = array(
            "vuelto" => $vuelto,
            "cargar_caja" => $cargar_caja,
            "estado" => true,
            "mensaje" => "Proceso correctamente el cálculo"
        );

        // Verificación de errores en la transacción
        if ($this->db->trans_status() === FALSE) {
            throw new Exception('Error durante la transacción al calcular los movimientos.');
        }

        // Se comenta el commit temporalmente
        $this->db->trans_commit(); 

        return $retornar;

    } catch (Exception $e) {
        // Revertir la transacción en caso de error
        $this->db->trans_rollback();

        return array(
            "estado" => false,
            "mensaje" => "Se produjo un error: " . $e->getMessage()
        );
    }
}


public function generar_movimiento_nuevo(
  $infortoken, 
  $id_caja, 
  $monto, 
  $formapago, 
  $concepto, 
  $descripcion, 
  $tipomovimiento, 
  $id_tipo_comprobante, 
  $descripcion_comprobante, 
  $auxiliar = null, 
  $extornar = null, 
  $igv = null, 
  $verificarin = null, 
  $moneda = 1, 
  $precio_moneda = null, 
  $periodo_anual = null, 
  $periodo_mes = null
) {
  $this->db->trans_begin(); // Iniciar transacción

  try {
      $codigo_comprobante = 0;
      $sesion = $this->Mantenimiento_m->consulta2("SELECT max(sesion_caja.id_sesion_caja) as ult FROM sede_caja, sesion_caja 
          WHERE sede_caja.id_sede_caja = sesion_caja.id_sede_caja 
          AND sede_caja.id_sede = '" . $infortoken["empresa_sede"] . "' 
          AND sede_caja.id_caja = $id_caja 
          AND DATE(sesion_caja.ses_fechaapertura) = '" . date('Y-m-d') . "'
          AND sesion_caja.id_empleado = " . $infortoken['empleado_id'] . "
          AND sesion_caja.ses_estado = 1");

      if ($tipomovimiento == 2) {
          $estado = $this->consultar_saldo($id_caja, $monto, $formapago);
          if ($estado == 50) {
              throw new Exception('Saldo insuficiente para realizar la operación.');
          }
      }

      if (isset($sesion->ult)) {
          $caja = $this->Mantenimiento_m->consulta2("SELECT * FROM sede_caja WHERE id_sede = " . $infortoken["empresa_sede"] . " AND id_caja = $id_caja");
          $id_sede_caja = $caja->id_sede_caja;

          // Preparar los datos para el movimiento
          $data = array(
              'id_sesion_caja' => $sesion->ult,
              'mov_formapago' => $formapago,
              'mov_concepto' => $concepto,
              'mov_fecha' => date('Y-m-d'),
              'mov_monto' => $monto,
              'mov_descripcion' => $descripcion,
              'mov_hora' => date('H:i:s'),
              'id_tipo_comprobante' => $id_tipo_comprobante,
              'tipo_comprobante_descripcion' => $descripcion_comprobante,
              'mov_fecha_tiempo' => date('Y-m-d H:i:s'),
              'mov_igv' => $igv,
              'mov_monto_cambio' => $precio_moneda,
              'moneda_id' => $moneda,
          );

          // Insertar el movimiento
          if (!$this->db->insert('movimiento', $data)) {
              throw new Exception('Error al insertar el movimiento.');
          }

          $id_movimiento = $this->db->insert_id();

          // Actualizar el monto de la caja
          if ($tipomovimiento == 1) {
              $monto_total = $caja->sede_caja_monto + $monto;
          } else {
              $monto_total = $caja->sede_caja_monto - $monto;
          }

          $data = array(
              'sede_caja_monto' => $monto_total
          );

          $this->db->where('id_sede_caja', $id_sede_caja);
          if (!$this->db->update('sede_caja', $data)) {
              throw new Exception('Error al actualizar el monto de la caja.');
          }

          // Verificar el estado de la transacción
          if ($this->db->trans_status() === FALSE) {
              throw new Exception('Error en la transacción.');
          }

          $this->db->trans_commit(); // Comentar temporalmente
          return $id_movimiento;

      } else {
          throw new Exception('No se encontró una sesión de caja activa.');
      }

  } catch (Exception $e) {
      $this->db->trans_rollback(); // Revertir la transacción en caso de error

      return array(
          "estado" => false,
          "mensaje" => "Error: " . $e->getMessage()
      );
  }
}

public function procesar_venta_pago()
{
    // Declaramos variables
    $data_token = json_decode($this->consultar_token(), true);
    $empleado_id = ($data_token["empleado_id"]);
    $response = array();
    $post = file_get_contents("php://input");
    $request = json_decode($post, true);
    $idventa = 0;
    $idempleado = $data_token["empleado_id"];
    if (!isset($request['listaServicios'][0])) {
        $response = [
            'estado' => false,
            'mensaje' => 'Problemas internos: No se encontraron los datos del servicio.'
        ];
        echo json_encode($response);
        exit();
    }

    // Validar los campos requeridos en el primer servicio
    $servicio = $request['listaServicios'][0];
    if (
        !isset($servicio['id']) || 
        !isset($servicio['nombreServicio']) || 
        !isset($servicio['precioServicio']) || 
        !isset($servicio['cantidad'])
    ) {
        $response = [
            'estado' => false,
            'mensaje' => 'Problemas internos: Datos incompletos en el servicio. Faltan campos obligatorios.'
        ];
        echo json_encode($response);
        exit();
    }

    // Asignar valores desde listaServicios
    $idTipoMembresia = $servicio['id'];
    $nombreMembresia = $servicio['nombreServicio'];
    $costoMembresia = $servicio['precioServicio'];
    $cantidadMeses = $servicio['cantidad'];
    if (array_key_exists('fechaInicio', $servicio)) {
      $fechaInicio = $servicio['fechaInicio'];
    } else {
      $fechaInicio = null;
    }

    $idsede = $data_token["empresa_sede"];
    $id_caja = 0;
    $monto = 0;
    $descripcion_comprobante = "";
    $serie = "";
    $correlativo = "";
    $id_documento = "";
    $nuevo_correlativo = 0;
    $igv = 0;
    $estado_igv = "";
    $monto_igv = 0;
    $monto_parcial = 0;
    $id_mozo = null;
    $pago = $request["pago"];
    $clienteData = $pago["cliente"];
    
    $clienteArray = explode('/', $clienteData);
    
    // Validar que el array contiene suficientes elementos
    if (count($clienteArray) > 0) {
        $idCliente = $clienteArray[0]; // Extraer el ID del cliente
    } else {
        throw new Exception("El formato del cliente es inválido o está vacío.");
    }
    // Iniciar transacción
    $this->db->trans_begin();

    try {
        $dinero_entrego = $this->calcular_monto_entregado($pago);
        $pedidoProducto = isset($request["pedidoproducto"]) ? $request["pedidoproducto"] : [];
        $pedidoServicio = isset($request["clientesSeleccionados"]) ? $request["clientesSeleccionados"] : [];
        $cantidadproductos = 0;

        if (count($pedidoProducto) > 0 || $idTipoMembresia != 0) {
            $cantidadproductos = count($pedidoProducto) + 1;
        } else {
            throw new Exception("No se encontraron productos");
        }

        if ($dinero_entrego <= 0) {
            throw new Exception("No existe monto entregado");
        }

        // Calcular el total a pagar
        $total_pagar = 0;
        foreach ($pedidoProducto as $k => $v) {
            $total_pagar += (float)$v["precio"] * (float)$v["cantidad"];
        }
        $total_pagar += (float)$costoMembresia;
        $total_pagar += (float)$pago["delivery"];

        $calcular_pago_caja = $this->crear_pagos_movimiento($pago, $total_pagar);

        $concepto = 1;
        $descripcion = "COBRO DE VENTA DE PRODUCTOS";
        $tipomovimiento = 1;
        $id_movimiento_transporte = 0;
        $vuelto = $calcular_pago_caja["vuelto"];
        $pagos_encaja = $calcular_pago_caja["cargar_caja"];
        $lista_movimiento_id = [];
        $id_tipo_comprobante = $pago["tipo_comprobante"];

        foreach ($pagos_encaja as $key => $value) {
            $lista_movimiento_id[] = $this->generar_movimiento_nuevo(
                $data_token,
                $value["tipo_caja"],
                $value["monto"],
                $value["forma_pago"],
                $concepto,
                $nombreMembresia,
                $tipomovimiento,
                $id_tipo_comprobante,
                $descripcion_comprobante
            );
        }

        if (array_sum($lista_movimiento_id) == 0) {
            throw new Exception("Por favor verifica si tiene la caja abierta o permisos para esta operación.");
        }
        // Generar correlativos
        $dat = $this->Mantenimiento_m->consulta3("SELECT * FROM detalle_doc_sede 
            INNER JOIN documento ON detalle_doc_sede.detalle_id_documento = documento.id_documento
            INNER JOIN tipo_documento ON documento.id_tipodocumento = tipo_documento.tipodoc_id 
            WHERE detalle_doc_sede.detalle_id_sede=" . $data_token["empresa_sede"] . " 
            AND documento.id_tipodocumento=" . $id_tipo_comprobante);

        $descripcion_comprobante = $dat[0]["doc_serie"] . "-" . $dat[0]["doc_correlativo"];
        $serie = $dat[0]["doc_serie"];
        $correlativo = $dat[0]["doc_correlativo"];
        $id_documento = $dat[0]["id_documento"];
        $nuevo_correlativo = (int)$correlativo + 1;

        $datos = array("doc_correlativo" => $nuevo_correlativo);
        $this->Mantenimiento_m->actualizar("documento", $datos, $id_documento, "id_documento");
        
        // Insertar venta
        $data = array(
            "venta_fechapedido" => time(),
            "venta_pedidofecha" => date("Y-m-d H:i:s"),
            "venta_idsede" => $idsede,
            "venta_monto" => $total_pagar,
            "venta_codigocliente" => $idCliente,
            "ventas_idtipodocumento" => $id_tipo_comprobante,
            "venta_formapago" => $pagos_encaja[0]["forma_pago"],
            'venta_num_serie' => $serie,
            'venta_num_documento' => $correlativo,
            "venta_estado_pagado" => 1,
            "venta_monto_entregado" => $dinero_entrego,
            "venta_glosario" => $nombreMembresia,
            "venta_codigomozo" => $idempleado
        );
        if (!$this->db->insert('venta', $data)) {
            throw new Exception("Error al insertar venta");
        }

        $id_venta = $this->db->insert_id();

        // Actualizar movimientos
        foreach ($lista_movimiento_id as $key => $valor1) {
            $sql = "UPDATE movimiento 
                    SET venta_idventas = $id_venta, 
                        tipo_comprobante_descripcion = '$descripcion_comprobante' 
                    WHERE mov_id = $valor1";
            if (!$this->db->query($sql)) {
                throw new Exception("Error al actualizar movimiento.");
            }
        }

        
        // Verificar transacción
        if ($this->db->trans_status() === FALSE) {
            throw new Exception("Error en la transacción.");
        }
        
        $result_membresia = $this->insertar_membresia($pedidoServicio, $idTipoMembresia, $cantidadMeses, $costoMembresia, $id_venta, $fechaInicio,$empleado_id);
        if (!$result_membresia['estado']) {
            throw new Exception($result_membresia['mensaje']);
        }

        $this->db->trans_commit(); // Comentar temporalmente
        $response["estado"] = true;
        $response["mensaje"] = "Se procesó correctamente";
        $response["idventa"] = $id_venta;

    } catch (Exception $e) {
        $this->db->trans_rollback(); // Revertir transacción en caso de error
        $response["estado"] = false;
        $response["mensaje"] = "Error: " . $e->getMessage();
    }

    echo json_encode($response);
    exit();
}
private function obtener_fechafin($cliente_id){
  $sqlPagos ="select * from formapago where for_estado=1 "; 
  $sqlVencimiento = "SELECT 
      CASE 
          WHEN clientes.cliente_estado_fechavencimiento = 1 THEN clientes.fechaFinMembresia
          ELSE (
              SELECT membresia.membresia_fecha_fin 
              FROM membresia 
              WHERE membresia.cliente_id = clientes.cliente_id 
              ORDER BY membresia.membresia_fecha_fin DESC 
              LIMIT 1
          )
      END AS fecha_vencimiento
  FROM 
      clientes
  WHERE 
      clientes.cliente_id = ? 
      AND clientes.estado = '1' 
      AND clientes.cliente_nombres IS NOT NULL
  LIMIT 1;";
  $query = $this->db->query($sqlVencimiento, array($cliente_id));
  if ($query->num_rows() > 0) {
      $result = $query->row();
      $fechaVencimiento = $result->fecha_vencimiento;
      $fecha = new DateTime($fechaVencimiento);
      $fecha->modify('+0 day');
      $fechaVencimiento = $fecha->format('Y-m-d');
  } else {
      $fechaVencimiento = date('Y-m-d'); // Cliente no encontrado o sin fecha de vencimiento
  }
  return $fechaVencimiento;
}
private function insertar_membresia($pedidoServicio, $idTipoMembresia, $cantidadMeses, $costoMembresia, $idventa, $fechaInicio, $empleado_id) {
  $this->db->trans_begin(); // Iniciar transacción
  $fechaInicioFlag = $fechaInicio;
  try {
      foreach ($pedidoServicio as $cliente) {
          // Verificar si el cliente existe
          $cliente_db = $this->db->get_where('clientes', ['cliente_id' => $cliente['id']])->row();
          if (!$cliente_db) {
              $this->db->trans_rollback();
              return [
                  'estado' => false,
                  'mensaje' => "El cliente con ID {$cliente['id']} no existe."
              ];
          }
          if ($fechaInicioFlag == null) {
            $fechaInicio = $this->obtener_fechafin($cliente['id']);
          }
          // Verificar conflictos de fechas con membresías existentes
          $conflictos = $this->db->select('*')
          ->from('membresia')
          ->where('cliente_id', $cliente['id'])
          ->group_start()
          ->where("'{$fechaInicio}' >= membresia_fecha_inicio") // La fechaInicio debe ser mayor al inicio del rango
          ->where("'{$fechaInicio}' < membresia_fecha_fin") // La fechaInicio debe ser menor o igual al último día del rango
          ->group_end()
          ->get()
          ->result();

          if (!empty($conflictos)) {
              $ultimaFechaFinExistente = $conflictos[0]->membresia_fecha_fin;
              $this->db->trans_rollback();
              return [
                  'estado' => false,
                  'mensaje' => "No se puede registrar la membresía. La nueva fecha de inicio debe ser posterior al {$ultimaFechaFinExistente}."
              ];
          }

          // Determinar última fecha de vencimiento
          $ultima_fecha_fin = $fechaInicio;

          // Obtener información del tipo de membresía
          $tipo_membresia = $this->db->get_where('tipo_membresia', [
              'tipo_membresia_id' => $idTipoMembresia,
              'tipo_membresia_estado' => 1
          ])->row();
          if (!$tipo_membresia) {
              $this->db->trans_rollback();
              return [
                  'estado' => false,
                  'mensaje' => "El tipo de membresía con ID {$idTipoMembresia} no está activo o no existe."
              ];
          }

          // Calcular nueva fecha de vencimiento
          $fecha_inicio = new DateTime($ultima_fecha_fin);
          $duracion = (int) $tipo_membresia->tipo_membresia_duracion;
          $duracion_total = $duracion * $cantidadMeses;

          switch ($tipo_membresia->tipo_membresia_tipopago) {
              case '1': // Diario
                  $dias_a_sumar = $duracion_total - 1;
                  $fecha_inicio->modify("+{$dias_a_sumar} days");
                  break;
              case '2': // Mensual
                  $fecha_inicio->modify("+{$duracion_total} months");
                  break;
              case '3': // Anual
                  $fecha_inicio->modify("+{$duracion_total} years");
                  break;
          }

          $nueva_fecha_fin = $fecha_inicio->format('Y-m-d');

          // Registrar cambios en el log
          if ($cliente_db->fechaFinMembresia !== $nueva_fecha_fin) {
              $this->Servicio_m->log_cambio_cliente(
                  $this->generarUUID(),
                  $cliente['id'],
                  'UPDATE',
                  'fechaFinMembresia',
                  $cliente_db->fechaFinMembresia,
                  $nueva_fecha_fin,
                  'Actualización de membresía por método de venta',
                  $empleado_id
              );
          }

          if ($cliente_db->cliente_tipomembresia != $idTipoMembresia) {
              $this->Servicio_m->log_cambio_cliente(
                  $this->generarUUID(),
                  $cliente['id'],
                  'UPDATE',
                  'cliente_tipomembresia',
                  $cliente_db->cliente_tipomembresia,
                  $idTipoMembresia,
                  'Cambio de tipo de membresía por método de venta',
                  $empleado_id
              );
          }

          // Actualizar cliente con nueva fecha de vencimiento y cambiar estado
          $this->db->where('cliente_id', $cliente['id']);
          $this->db->update('clientes', [
              'fechaFinMembresia' => $nueva_fecha_fin,
              'cliente_tipomembresia' => $idTipoMembresia,
              'cliente_estado_fechavencimiento' => 0
          ]);

          // Insertar nueva membresía
          $data = [
              'cliente_id' => $cliente['id'],
              'tipo_membresia_id' => $idTipoMembresia,
              'membresia_fecha_inicio' => $ultima_fecha_fin,
              'membresia_fecha_fin' => $nueva_fecha_fin,
              'membresia_precio_mes' => $costoMembresia,
              'membresia_meses' => $duracion_total,
              'membresia_fecha_registro' => date('Y-m-d'),
              'membresia_idventa' => $idventa
          ];

          $this->db->insert('membresia', $data);
      }

      // Confirmar transacción
      $this->db->trans_commit();
      return [
          'estado' => true,
          'mensaje' => 'Membresías procesadas correctamente.'
      ];

  } catch (Exception $e) {
      $this->db->trans_rollback();
      return [
          'estado' => false,
          'mensaje' => 'Error al procesar la membresía: ' . $e->getMessage()
      ];
  }
}


public function ws_informacion_caja(){
    $data_token = json_decode($this->consultar_token(),true); 
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true); 
    if ($data_token["empleado_perfil"] != 5 && $data_token["empleado_perfil"] != 8) { 
      $this->consultar_saldo_caja(3,$data_token);
    }else{
      if ($data_token["empleado_perfil"] == 5) { 
        $estadosesioncaja = $this->Mantenimiento_m->consulta3("SELECT sesion_caja.id_empleado FROM sesion_caja,sede_caja WHERE sesion_caja.id_sede_caja = sede_caja.id_sede_caja and sesion_caja.ses_estado = 1 AND sede_caja.id_sede = ".$data_token["empresa_sede"]." GROUP BY sesion_caja.id_empleado");
        if (isset($estadosesioncaja[0]["id_empleado"])) {
          if ($data_token["empleado_id"] == $estadosesioncaja[0]["id_empleado"]) {
            $this->consultar_saldo_caja(1,$data_token);
          }else{
            $this->consultar_saldo_caja(0,$data_token);
          }

        }else{
          $this->consultar_saldo_caja(0,$data_token);
        }
      }else{
        //$this->consultar_caja_sedes(); no incluye
      }     
    }
  }



  public function consultar_saldo_caja($estado,$data_token){
    $estadosesioncaja = $estado;
    if ($estado == 1 || $estado == 0) {
      $data["titulo_descripcion"]="Sesión de Caja";
      $id_sede=$data_token['empresa_sede'];
      $fecha_dia =date("Y-m-d");
      $sql="SELECT MAX(sesion_caja.id_sesion_caja) as ult FROM sede_caja,sesion_caja where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and
      sede_caja.id_caja=1 and sede_caja.id_sede=".$id_sede." 
      and sesion_caja.id_empleado = ".$data_token["empleado_id"]." ";
      $ulsesionf=$this->Mantenimiento_m->consulta3($sql);
      if (!isset($ulsesionf[0]["ult"])) {
        $array_formapago=array();
        $data["titulo_descripcion"]="Sesión Caja";
        $data["estado_caja"]=2;
        $data["hingresosf"]=0;
        $data["hegresosf"]=0;
        $data["hingresosv"]=0;
        $data["hegresosv"]=0;
        $data["ingresosf"]=0;
        $data["egresosf"]=0;
        $data["ingresosv"]=0;
        $data["egresosv"]=0;
        $data["fecha_dia"]="0000-00-00";
        $data["movif"]=0;
        $data["moviv"]=0;
        $data["saldoinicialv"]=0;
        $data["saldoinicialf"]=0;
        $data["caja1"] = 0;
        $data["caja2"] = 0;
        $data["estadosesioncaja"] = 1;  
        $dat=$this->Mantenimiento_m->consulta3("select * from formapago where for_estado=1");
        foreach ($dat as $key => $value) {
          $array_formapago[$key]["descripcion"]=$value["for_descripcion"];
          $array_formapago[$key]["transacciones"]= 0;
          $array_formapago[$key]["ingreso"]=0.00;
          $array_formapago[$key]["egreso"]=0.00;
          $array_formapago[$key]["total"]=0;
        }
        $data["array_formapago"]=$array_formapago;
      }else{


        $estado_sesionf = $this->db->query("select * from sesion_caja where id_sesion_caja=".$ulsesionf[0]["ult"]." 
        and sesion_caja.id_empleado = ".$data_token["empleado_id"]." ")->result_array();
        $fecha = explode(' ', $estado_sesionf[0]["ses_fechaapertura"]);
        $fecha_dia=$fecha[0];
        if ($estado_sesionf[0]["ses_estado"]==0){   
          $estado_caja = 2;         
        }else{
          if($fecha[0]==date('Y-m-d')){
            $estado_caja = 3;
          }else{
            $estadosesion = $this->db->query("select * from sesion_caja where id_sesion_caja=".$ulsesionf[0]['ult']." and sesion_caja.id_empleado = ".$data_token["empleado_id"]. " ")->result_array();
            $fecha = explode(' ', $estadosesion[0]["ses_fechaapertura"]);
            $estado_caja = 3;
          }
        }
        $estadoactual = $this->Mantenimiento_m->consulta3("SELECT sesion_caja.ses_estado FROM sesion_caja INNER JOIN sede_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja 
        WHERE DATE(sesion_caja.ses_fechaapertura) = '".$fecha[0]."' and sede_caja.id_sede=".$id_sede."  and sesion_caja.id_empleado = ".$data_token["empleado_id"]." 
        ORDER BY sesion_caja.id_sesion_caja DESC LIMIT 1");
        $estadoactual = $estadoactual[0]["ses_estado"];
        $idsesion = $this->Mantenimiento_m->consulta3("SELECT sesion_caja.id_sesion_caja FROM sesion_caja INNER JOIN sede_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja 
        WHERE sesion_caja.ses_estado =".$estadoactual."  and sesion_caja.id_empleado = ".$data_token["empleado_id"]."   and sede_caja.id_sede=".$id_sede." 
        and DATE(sesion_caja.ses_fechaapertura) = '".$fecha[0]."' ORDER BY sesion_caja.id_sesion_caja DESC LIMIT 2");
        if (isset($idsesion[0]["id_sesion_caja"])) {
          $caja1 =  $idsesion[0]["id_sesion_caja"];
          $caja2 = $idsesion[1]["id_sesion_caja"];
        }else{
          $caja1 =  0;
          $caja2 = 0;
        }
        $ingresosf=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto, movimiento.mov_estado  from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
          concepto.id_tipo_movimiento=1 and sede_caja.id_caja=1  and movimiento.mov_estado = 1 and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        $saldoinicialf = $this->Mantenimiento_m->consulta3("SELECT sesion_caja.ses_montoinicial
          FROM sesion_caja,sede_caja where sesion_caja.id_sede_caja = sede_caja.id_sede_caja and sesion_caja.ses_estado = ".$estadoactual." and sede_caja.id_caja=1  and sede_caja.id_sede =".$id_sede." ORDER BY sesion_caja.ses_fechaapertura DESC LIMIT 1");
        if ($ingresosf[0]["monto"]=="") {
          $ingresosf=0.00;
        }else{
          $ingresosf = $ingresosf[0]["monto"];
        }
        if (!isset($saldoinicialf[0]["ses_montoinicial"])) {
          $saldoinicialf = 0.00;
        }else{
          $saldoinicialf = $saldoinicialf[0]["ses_montoinicial"];
        }

        $egresosf=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
          concepto.id_tipo_movimiento=2 and sede_caja.id_caja=1 and movimiento.mov_estado = 1 and sesion_caja.ses_estado= ".$estadoactual." and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        if ($egresosf[0]["monto"]=="") {
          $egresosf=0.00;
        }else{
          $egresosf = $egresosf[0]["monto"];
        }

        $movimientof=$this->Mantenimiento_m->consulta3("SELECT COUNT(movimiento.mov_id) as contar from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id  and sede_caja.id_caja=1 and movimiento.mov_estado = 1 and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        if ($movimientof[0]["contar"]=="") {
          $movif=0.00;
        }else{
          $movif = $movimientof[0]["contar"];
        }
        $ingresosv=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
          concepto.id_tipo_movimiento=1 and sede_caja.id_caja=2 and movimiento.mov_estado  = 1 and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        $saldoinicialv= $this->Mantenimiento_m->consulta3("SELECT sesion_caja.ses_montoinicial
          FROM sesion_caja,sede_caja where sesion_caja.id_sede_caja = sede_caja.id_sede_caja  and sesion_caja.ses_estado = ".$estadoactual." and  sede_caja.id_caja=2 and sede_caja.id_sede =".$id_sede." ORDER BY sesion_caja.ses_fechaapertura DESC LIMIT 1");

        if ($ingresosv[0]["monto"]=="") {
          $ingresosv=0.00;
        }else{
          $ingresosv = $ingresosv[0]["monto"];
        }

        if (!isset($saldoinicialv[0]["ses_montoinicial"])) {
          $saldoinicialv = 0.00;
        }else{
          $saldoinicialv = $saldoinicialv[0]["ses_montoinicial"];
        }
        $egresosv=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
          concepto.id_tipo_movimiento=2 and sede_caja.id_caja=2 and movimiento.mov_estado  = 1  and sesion_caja.ses_estado= ".$estadoactual." and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        if ($egresosv[0]["monto"]=="") {
          $egresosv=0.00;
        }else{
          $egresosv = $egresosv[0]["monto"];
        } 

        $movimientov=$this->Mantenimiento_m->consulta3("SELECT COUNT(movimiento.mov_id) as contar from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id  and sede_caja.id_caja=2 and movimiento.mov_estado =1 and movimiento.mov_fecha='".$fecha[0]."' and sede_caja.id_sede=".$id_sede);
        if ($movimientov[0]["contar"]=="") {
          $moviv=0.00;
        }else{
          $moviv = $movimientov[0]["contar"];
        }
        $data["estado_caja"]=$estado_caja;
        $data["ingresosf"]=$ingresosf;
        $data["egresosf"]=$egresosf;
        $data["ingresosv"]=$ingresosv;
        $data["egresosv"]=$egresosv;
        $data["fecha_dia"]=$fecha_dia;
        $data["movif"]=$movif;
        $data["moviv"]=$moviv;
        $data["saldoinicialv"]=$saldoinicialv;
        $data["saldoinicialf"]=$saldoinicialf;
        $data["caja1"] = $caja1;
        $data["caja2"] = $caja2;
        $data["estadosesioncaja"] = $estadosesioncaja;
        $array_formapago=array();
        $dat=$this->Mantenimiento_m->consulta3("select * from formapago where for_estado=1");

        if(!isset($estadoactual)) {
          $estadoactual = '""';
        }
        foreach ($dat as $key => $value) {

          $array_formapago[$key]["descripcion"]=$value["for_descripcion"];


          $sql="SELECT COUNT(movimiento.mov_id) as contar from sede_caja,sesion_caja,movimiento,concepto 
          where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and 
          sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id and sesion_caja.ses_estado = 1 and movimiento.mov_formapago=".$value["for_id"]." and movimiento.mov_estado = 1 and movimiento.mov_fecha='".$fecha_dia."' and sede_caja.id_sede=".$id_sede;

          $movimientof=$this->Mantenimiento_m->consulta3($sql);


          $array_formapago[$key]["transacciones"]= $movimientof[0]["contar"];


          $ingresosf=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto from sede_caja,sesion_caja,movimiento,concepto 
            where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and sesion_caja.ses_estado = ".$estadoactual." and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
            sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
            concepto.id_tipo_movimiento=1   and movimiento.mov_estado = 1 and movimiento.mov_fecha='".$fecha_dia."' and movimiento.mov_formapago=".$value["for_id"]);

          if ($ingresosf[0]["monto"]=="") {
            $array_formapago[$key]["ingreso"]=0.00;
          }else{
            $array_formapago[$key]["ingreso"]=$ingresosf[0]["monto"];
          }

          $egreso=$this->Mantenimiento_m->consulta3("SELECT SUM(movimiento.mov_monto) as monto from sede_caja,sesion_caja,movimiento,concepto 
            where sede_caja.id_sede_caja=sesion_caja.id_sede_caja and sesion_caja.ses_estado = ".$estadoactual." and (movimiento.id_sesion_caja = ".$caja1." or movimiento.id_sesion_caja =".$caja2." ) and
            sesion_caja.id_sesion_caja=movimiento.id_sesion_caja and movimiento.mov_concepto=concepto.con_id AND
            concepto.id_tipo_movimiento=2   and movimiento.mov_estado = 1 and movimiento.mov_fecha='".$fecha_dia."' and movimiento.mov_formapago=".$value["for_id"]);

          if ($egreso[0]["monto"]=="") {
            $array_formapago[$key]["egreso"]=0.00;
          }else{
            $array_formapago[$key]["egreso"]=$egreso[0]["monto"];
          }
          $total=$array_formapago[$key]["ingreso"]-$array_formapago[$key]["egreso"];
          $array_formapago[$key]["total"]=$total;
          $data["array_formapago"]=$array_formapago;
        }
      }
    }else{
      $array_formapago=array();
      $data["titulo_descripcion"]="Usted No tiene permisos!!!!!";
      $data["estado_caja"]=0;
      $data["hingresosf"]=0;
      $data["hegresosf"]=0;
      $data["hingresosv"]=0;
      $data["hegresosv"]=0;
      $data["ingresosf"]=0;
      $data["egresosf"]=0;
      $data["ingresosv"]=0;
      $data["egresosv"]=0;
      $data["fecha_dia"]="0000-00-00";
      $data["movif"]=0;
      $data["moviv"]=0;
      $data["saldoinicialv"]=0;
      $data["saldoinicialf"]=0;
      $data["caja1"] = 0;
      $data["caja2"] = 0;
      $data["estadosesioncaja"] = 3;  
      $dat=$this->Mantenimiento_m->consulta3("select * from formapago where for_estado=1");
      foreach ($dat as $key => $value) {
        $array_formapago[$key]["descripcion"]=$value["for_descripcion"];
        $array_formapago[$key]["transacciones"]= 0;
        $array_formapago[$key]["ingreso"]=0.00;
        $array_formapago[$key]["egreso"]=0.00;
        $array_formapago[$key]["total"]=0;
      }
      $data["array_formapago"]=$array_formapago;
    }
    echo json_encode($data);exit();
   // $this->vista("Sesion_caja/index",$data);
  }
public function ws_sesion_traerfisica(){
   $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);

    $guardar["dias"] =  $request;
    $tz = new DateTimeZone('UTC');  
    $datos= $this->Mantenimiento_m->consulta("SELECT Sum(movimiento.mov_monto) AS monto,movimiento.mov_fecha as fecha,
      HOUR(movimiento.mov_hora) AS Hora,YEAR(movimiento.mov_fecha) as Anio,MONTH(movimiento.mov_fecha) as Mes,DAY(movimiento.mov_fecha) as Dia
      FROM  movimiento
      INNER JOIN sesion_caja ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja
      INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id
      INNER JOIN tipo_movimiento ON concepto.id_tipo_movimiento = tipo_movimiento.id_tipo_movimiento
      WHERE
      sesion_caja.id_sesion_caja = ".$request["cajafisica"]." AND
      tipo_movimiento.id_tipo_movimiento = 2
      GROUP BY movimiento.mov_fecha, HOUR(movimiento.mov_hora), YEAR(movimiento.mov_fecha), MONTH(movimiento.mov_fecha), DAY(movimiento.mov_fecha)
      ORDER BY HOUR(movimiento.mov_hora)");
    $nombre = "Compras del Día";
    $guardar["data"]["compras"]["name"] = $nombre;
    foreach ($datos  as  $key =>  $grafico) {
      $fechahora = $grafico->fecha . ' ' . $grafico->Hora.':00';
      $date = new DateTime($fechahora, $tz);
      $da[0]=(1000 * $date->format('U'));
      $da[1]=(float)$grafico->monto;
      $guardar["data"]["compras"]["data"][$key]= $da;   
    }

    $datos= $this->Mantenimiento_m->consulta("SELECT Sum(movimiento.mov_monto) AS monto, movimiento.mov_fecha as fecha,
      HOUR(movimiento.mov_hora) AS Hora,YEAR(movimiento.mov_fecha) as Anio,MONTH(movimiento.mov_fecha) as Mes,DAY(movimiento.mov_fecha) as Dia
      FROM  movimiento
      INNER JOIN sesion_caja ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja
      INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id
      INNER JOIN tipo_movimiento ON concepto.id_tipo_movimiento = tipo_movimiento.id_tipo_movimiento
      WHERE
      sesion_caja.id_sesion_caja = ".$request["cajafisica"]." AND
      tipo_movimiento.id_tipo_movimiento = 1
      GROUP BY movimiento.mov_fecha, HOUR(movimiento.mov_hora), YEAR(movimiento.mov_fecha), MONTH(movimiento.mov_fecha), DAY(movimiento.mov_fecha)
      ORDER BY HOUR(movimiento.mov_hora)");
    $nombre = "Ventas del Día";
    $guardar["data"]["ventas"]["name"] = $nombre;
    foreach ($datos  as  $key =>  $grafico) {
      $fechahora = $grafico->fecha . ' ' . $grafico->Hora.':00';
      $date = new DateTime($fechahora, $tz);
      $da[0]=(1000 * $date->format('U'));
      $da[1]=(float)$grafico->monto;
      $guardar["data"]["ventas"]["data"][$key]= $da;    
    }
    echo json_encode($guardar);
  }

  public function ws_sesion_traervirtual(){
    $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);

    $guardar["dias"] =  $request;
    $tz = new DateTimeZone('UTC');
    $datos= $this->Mantenimiento_m->consulta("SELECT Sum(movimiento.mov_monto) AS monto,movimiento.mov_fecha as fecha,
      HOUR(movimiento.mov_hora) AS Hora,YEAR(movimiento.mov_fecha) as Anio,MONTH(movimiento.mov_fecha) as Mes,DAY(movimiento.mov_fecha) as Dia
      FROM  movimiento
      INNER JOIN sesion_caja ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja
      INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id
      INNER JOIN tipo_movimiento ON concepto.id_tipo_movimiento = tipo_movimiento.id_tipo_movimiento
      WHERE
      sesion_caja.id_sesion_caja = ".$request["cajavirtual"]." AND
      tipo_movimiento.id_tipo_movimiento = 2
      GROUP BY movimiento.mov_fecha, HOUR(movimiento.mov_hora), YEAR(movimiento.mov_fecha), MONTH(movimiento.mov_fecha), DAY(movimiento.mov_fecha)
      ORDER BY HOUR(movimiento.mov_hora)");
    $nombre = "Compras del Día";
    $guardar["data"]["compras"]["name"] = $nombre;
    foreach ($datos  as  $key =>  $grafico) {
      $fechahora = $grafico->fecha . ' ' . $grafico->Hora.':00';
      $date = new DateTime($fechahora, $tz);
      $da[0]=(1000 * $date->format('U'));
      $da[1]=(float)$grafico->monto;
      $guardar["data"]["compras"]["data"][$key]= $da;   
    }

    $datos= $this->Mantenimiento_m->consulta("SELECT Sum(movimiento.mov_monto) AS monto,movimiento.mov_fecha as fecha,
      HOUR(movimiento.mov_hora) AS Hora,YEAR(movimiento.mov_fecha) as Anio,MONTH(movimiento.mov_fecha) as Mes,DAY(movimiento.mov_fecha) as Dia
      FROM  movimiento
      INNER JOIN sesion_caja ON movimiento.id_sesion_caja = sesion_caja.id_sesion_caja
      INNER JOIN concepto ON movimiento.mov_concepto = concepto.con_id
      INNER JOIN tipo_movimiento ON concepto.id_tipo_movimiento = tipo_movimiento.id_tipo_movimiento
      WHERE
      sesion_caja.id_sesion_caja = ".$request["cajavirtual"]." AND
      tipo_movimiento.id_tipo_movimiento = 1
      GROUP BY movimiento.mov_fecha, HOUR(movimiento.mov_hora), YEAR(movimiento.mov_fecha), MONTH(movimiento.mov_fecha), DAY(movimiento.mov_fecha)
      ORDER BY HOUR(movimiento.mov_hora)");
    $nombre = "Ventas del Día";
    $guardar["data"]["ventas"]["name"] = $nombre;
    foreach ($datos  as  $key =>  $grafico) {
      $fechahora = $grafico->fecha . ' ' . $grafico->Hora.':00';
      $date = new DateTime($fechahora, $tz);
      $da[0]=(1000 * $date->format('U'));
      $da[1]=(float)$grafico->monto;
      $guardar["data"]["ventas"]["data"][$key]= $da;    
    }
    echo json_encode($guardar);
  }


  public function ws_cargar_tipo_documento()
  {
   $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);
    
    $tipo=$this->db->query("select * from tipo_cliente where tipo_cliente_estado=1")->result_array();
    echo json_encode($tipo);exit(); 
  }

   public function ws_guardar_cliente()
  {
   $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);
    $validar=$this->db->query("select * from clientes where estado=1 and cliente_dni='".$request["numero_documento"]."' and tipo_cliente_id=".$request["tipo_documento"])->result_array();
    if(count($validar)==0)
    {
      $response["estado"]=false;
      $response["mensaje"]="EL CLIENTE YA EXISTE";
    echo json_encode($response);exit();
    }
    
       $data=array(
              
              "cliente_nombres"=>$request["razon_social"],
              "cliente_direccion"=>$request["direccion"],
              "cliente_dni"=>$request["numero_documento"],
             
              "cliente_celular"=>$request["celular"],
              "cliente_email"=>$request["correo"],

              "tipo_cliente_id"=>$request["tipo_documento"],
              "empresa_ruc"=>$data_token["empresa_ruc"]

            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('clientes', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('cliente_id',$request["id"]);
        $estado=$this->db->update('clientes', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();
  }


  public function ws_cerrar_sesion_caja()
  {

     $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);

    $caja = $this->Mantenimiento_m->consulta("SELECT * FROM sede_caja where id_sede = '".$data_token['empresa_sede']."' ");
      foreach ($caja as $values) {
        $data = array(
          'ses_fechacierre' => date('Y-m-d').' '.date('H:i'),
          'ses_montocierre' => $values->sede_caja_monto,
          'ses_estado' => 0
        );
        $this->db->where('ses_estado',1);
        $this->db->where('id_sede_caja',$values->id_sede_caja);
        $estado=$this->db->update('sesion_caja', $data);
        if ($values->id_caja == 1) {
          $saldocaja = $request["ingresosf"];
        }else{
          $saldocaja = $request["ingresosv"];
        }
        $dato = array(
          'sede_caja_monto' => ($values->sede_caja_monto + $saldocaja)
        );
        $this->db->where('id_caja',$values->id_caja);
        $this->db->where('id_sede_caja',$values->id_sede_caja);
        $estado=$this->db->update('sede_caja', $dato);

  }

          $response["estado"]=true;
      $response["mensaje"]="Se realizo correctamente";
    echo json_encode($response);exit();

}



public function ws_cerrar_sesion_apertura_caja(){

    $data_token = json_decode($this->consultar_token(),true);
    $response=array();
    $post=file_get_contents("php://input");  
    $request=json_decode($post, true);


// $tokenData['empleado_id'] = $usuarioexist[0]["empleado_id"];
 //  $tokenData['empleado_perfil'] = $usuarioexist[0]["perfil_id"];
    //  $tokenData['empresa_sede'] = $usuarioexist[0]["empresa_sede"];
    //echo $_POST["inicio_caja"][0];exit();
      $sql="select * from sesion_caja where ses_estado=1 and id_empleado='".$data_token['empleado_id']."'";
      $exist_sesion = $this->db->query($sql)->result_array(); 
      if (count($exist_sesion)==0) {
        $caja = $this->Mantenimiento_m->consulta("SELECT * FROM sede_caja where id_sede = '".$data_token['empresa_sede']."' ");
        $aux = 0;
        foreach ($caja as $values) {
          $saldo = $values->sede_caja_monto - $request["inicio_caja"][($values->id_caja-1)];
          $caja_sede[($values->id_caja-1)] = $values->sede_caja_monto - $request["inicio_caja"][($values->id_caja-1)];
          $data = array(
            'sede_caja_monto' => $saldo
          );
          $this->db->where('id_sede_caja',$values->id_sede_caja);
          $this->db->where('id_caja',$values->id_caja);
          $estado=$this->db->update('sede_caja', $data);

//      Sesioncaja::open_sesioncaja();
        }

        $ult =$this->Mantenimiento_m->consulta("SELECT Max(sesion_caja.id_sesion_caja) AS ult,sede_caja.id_caja,sede_caja.sede_caja_monto,sede_caja.id_sede_caja FROM sesion_caja
          INNER JOIN sede_caja ON sesion_caja.id_sede_caja = sede_caja.id_sede_caja
          where sede_caja.id_sede =  '".$data_token['empresa_sede']."' GROUP BY sede_caja.id_caja, sede_caja.id_sede_caja");
        if(count($ult) != 0){
          $hora = date('H:i');
          foreach ($ult as $values) {

            if( $values->ult ==""){
              $ultimo = 0;

            }else{
              $ultimo = $values->ult;
            }
            $estadosesion = $this->db->query("select * from sesion_caja where id_sesion_caja=".$ultimo)->result_array();
            if (count($estadosesion)==0) {
              $valid_fecha = date('Y-m-d');

            }else{
              $fecha = explode(' ', $estadosesion[0]["ses_fechaapertura"]);
              if ($fecha[0]==date('Y-m-d')) {
                $actual = date('Y-m-d');
                $valid_fecha = date('Y-m-d',strtotime('+0 days', strtotime($actual)));
              }else{
                $valid_fecha = date('Y-m-d');
              }
            }
        //$caja = $this->db->query("SELECT * FROM sede_caja where id_sede_caja = '".$values->id_sede_caja."' ")->result_array();
            $data = array(
              'id_empleado' => $data_token['empleado_id'],
              'id_sede_caja' => $values->id_sede_caja,
              'ses_fechaapertura' => $valid_fecha.' '.$hora,
              'ses_montoapertura' => $caja_sede[($values->id_caja-1)],
              'ses_montoinicial' => $request["inicio_caja"][($values->id_caja-1)],
              'ses_montocierre' => 0.00
            );
            $estado=$this->db->insert('sesion_caja', $data);
          }
        }else{
          $valid_fecha = date('Y-m-d');
          $hora = date('H:i');
          $caja = $this->db->query("SELECT sede_caja.id_sede_caja,sede_caja.id_caja FROM sede_caja where id_sede ='".$data_token['empresa_sede']."'")->result_array();
          foreach ($caja as $sedes) {
            $data = array(
              'id_empleado' => $data_token['empleado_id'],
              'id_sede_caja' => $sedes['id_sede_caja'],
              'ses_fechaapertura' => $valid_fecha.' '.$hora,
              'ses_montoapertura' => $caja_sede[($sedes['id_caja']-1)],
              'ses_montoinicial' => $request["inicio_caja"][($sedes['id_caja']-1)],
              'ses_montocierre' => 0.00
            );
            $estado=$this->db->insert('sesion_caja', $data);
          }

        }


          $response["estado"]=true;
      $response["mensaje"]="Se realizo correctamente";
    echo json_encode($response);exit();
      }else{


          $response["estado"]=false;
      $response["mensaje"]="Se produjo un error";
    echo json_encode($response);exit();
      }
   
  }



  /***************************************************almacen****************************/
public function lista_almacen()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select almacenes.almacen_id as id,almacen_descripcion as descripcion,almacenes.almacen_direccion as direccion from almacenes where almacen_estado=1  and id_sede=".$data_token["empresa_sede"]);

         echo json_encode($data);exit();
}

public function guardar_almacen()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "almacen_descripcion"=>$request["descripcion"],
           "id_sede" => $data_token["empresa_sede"],
            
              "almacen_direccion"=>$request["direccion"]
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('almacenes', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('almacen_id',$request["id"]);
        $estado=$this->db->update('almacenes', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

public function eliminar_almacen()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update almacenes set almacen_estado=0 where almacen_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

  public function cargar_uno_almacen()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from almacenes where almacen_estado =1 and almacen_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }

    public function ws_cargar_platos()
  {

  $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

    $sql="SELECT * 
          from producto
          where producto_estado=1
          and producto_id_tipoproducto=3
          and id_sede=".$data_token["empresa_sede"];

          $dato=$this->db->query($sql)->result_array();

          echo json_encode($dato);exit();
  }

  public function ws_habilitar_prender_producto()
  {
    $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    $data=array(
      "producto_encendido"=>$request["estado"]
    );

       $this->db->where('producto_id',$request["id"]);
                $estado=$this->db->update('producto', $data);

                      $response["estado"]=true;
      $response["mensaje"]="SE PROCESO CORRECTAMENTE";
      echo json_encode($response);exit();

  }

/*----------------------------------------------pedido-----------------------------------------------------------------------------------------*/

  public function ws_eliminar_pedido(){

    $data_token = json_decode($this->consultar_token(),true);
    //print_r($data_token);
    //exit();
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    if(!empty($request["eliminar_usuario_total"])){
      $administrador = array();
      $administrador = $datos_venta = $this->Mantenimiento_m->consulta3("SELECT id_usuarioe as empleado_id FROM usuario_eliminar WHERE usuario_eli = '".$request['eliminar_usuario_total']."'  and clave_eli = '".$request['eliminar_contrasena_total']."';");
      if(count($administrador)==0){
        $response=array();
        $response["estado"]=false;
        $response["mensaje"]="ERROR EN USUARIO Y CLAVE DEL ADMINISTRADOR , POR FAVOR COMUNICATE CON ÉL";
        $response["idventa"]="";
        echo json_encode($response);exit();
        exit();
      }
    }
    $id_venta=$request["idventa"];
    $motivo=$request["motivo_modal"];
    $data=array(
      "venta_estado"=>"0",
      "venta_fecha_eliminacion"=>date("Y-m-d H:i:s"),
      "venta_empleado_eliminacion"=>$data_token["empleado_id"],
      "venta_eliminacion_descripcion"=>$motivo
    );

    $this->db->where('venta_idventas', $id_venta);
    $this->db->update('venta', $data);
    $datos=$this->Mantenimiento_m->consulta3("select * from detalle_venta where id_venta=".$id_venta);
    $tipo_producto = array();
    $stock_detalle = array();
    $idproducto = array();
    foreach ($datos as $key => $value) {
   
      $data=array(
        "observacion_eliminado"=>$motivo,
        "estado_pedido"=>0,
        "detalle_usuario_eliminado"=>$data_token["empleado_id"],
        "detalle_venta_fecha_eliminar"=>date("Y-m-d H:i:s")
      );
      $this->db->where('id_detalle_venta',$value["id_detalle_venta"]);
      $this->db->update('detalle_venta', $data);
      $idproducto = $this->db->query("SELECT detalle_venta.cod_producto_venta, detalle_venta.cantidad,detalle_venta.precio FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$value["id_detalle_venta"].";")->row();
      $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
      if($tipo_producto->producto_id_tipoproducto==1){
        $almacen_id = $this->Mantenimiento_m->consulta2("SELECT almacen_id FROM almacenes where almacenes.id_sede = ".$data_token["empresa_sede"]." and almacen_uso = 1 ");
        $id_almacen=$this->Mantenimiento_m->consulta2("SELECT detalle_producto_almacen.detalle_almacen as id_almacen FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$idproducto->cod_producto_venta." AND detalle_producto_almacen.detalle_almacen = ".$almacen_id->almacen_id.";");
        $id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida
          INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida 
          WHERE producto.producto_id = ".$idproducto->cod_producto_venta);
        $this->movimiento_stock_temporal($id_almacen->id_almacen,$idproducto->cod_producto_venta,$id_unidad_medida->detalle_unidad_producto_id,$idproducto->cantidad,$idproducto->precio,1,2);

      }else{
        //$id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida WHERE producto.producto_id = ".$idproducto->cod_producto_venta);
        $this->movimiento_stock_tplatos($idproducto->cod_producto_venta,null,$idproducto->cantidad,$idproducto->precio,1,2);
                
      }


    }
    $dat=$this->Mantenimiento_m->consulta3("select * from venta where venta_idventas=".$id_venta);
      $id_mesa=$dat[0]["venta_codigomesa"];
      $data=array(
        "mesa_disponible"=>"0"
      );
      $this->Mantenimiento_m->actualizar("mesa",$data,  $id_mesa,"mesa_id");
    
  $response=array();
  $response["estado"]=true;
  $response["mensaje"]="Se elimino correctamente el pedido";
  $response["idventa"]="";
  echo json_encode($response);exit();
  }



  /***************************************************marca de producto****************************/

public function lista_categoria_producto()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select categoria_producto_id as 'id',categoria_producto_descripcion as 'descripcion' from categoria_producto where categoria_producto_estado=1 and id_sede=".$data_token["empresa_sede"]);

         echo json_encode($data);exit();
}


  public function guardar_categoria_producto()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "categoria_producto_descripcion"=>$request["descripcion"],
              "categoria_imagen"=>"default.jpg",  
              "id_sede"=>$data_token["empresa_sede"]
            
      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('categoria_producto', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('categoria_producto_id',$request["id"]);
        $estado=$this->db->update('categoria_producto', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }
   public function cargar_categoria_producto_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from categoria_producto where categoria_producto_id=".$request["id"])->row_array();



       echo json_encode($response);exit();


  }

   public function eliminar_categoria_producto()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update categoria_producto set categoria_producto_estado='0' where categoria_producto_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 


  public function lista_unidad_medida()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select id_unidad_medida as id,unidad_medida_descripcion as descripcion,descripcion_sunat as sunat from unidad_medida where unidad_medida_estado=1 ");

         echo json_encode($data);exit();
}

public function guardar_unidad_medida()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "unidad_medida_descripcion"=>$request["descripcion"],
         
            
              "descripcion_sunat"=>$request["sunat"]
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('unidad_medida', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('id_unidad_medida',$request["id"]);
        $estado=$this->db->update('unidad_medida', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

  public function eliminar_unidad_medida()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update unidad_medida set unidad_medida_estado=0 where id_unidad_medida=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

    public function cargar_uno_unidad_medida()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from unidad_medida where unidad_medida_estado =1")->row_array();
       echo json_encode($response);exit();


  }



  public function lista_mesas()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select mesa_id as id,mesa_numero as descripcion,lugarmesa_descripcion as mesa FROM mesa INNER JOIN lugar_mesa ON mesa.mesa_id_lugar = lugar_mesa.lugarmesa_id WHERE lugar_mesa.id_sede  = ".$data_token["empresa_sede"]." and mesa.mesa_estado = 1");

         echo json_encode($data);exit();
}

public function eliminar_mesas()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update mesa set mesa_estado=0 where mesa_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

   public function lista_lugar_mesas()
{

  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();  

    $data["lista"]=$this->Mantenimiento_m->consulta3("select * FROM lugar_mesa WHERE lugar_mesa.id_sede  = ".$data_token["empresa_sede"]." and lugarmesa_estado = '1'");

         echo json_encode($data);exit();
}

 public function cargar_uno_mesa()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from mesa where mesa_estado ='1' and mesa_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }




public function guardar_mesa()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              
              "mesa_numero"=>$request["descripcion"],
         
            
              "mesa_id_lugar"=>$request["lista"]
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('mesa', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('mesa_id',$request["id"]);
        $estado=$this->db->update('mesa', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }

  public function guardar_mesa_multiple()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        foreach ($request["lista_numero"] as $key => $value) {
      $data = array(
        "mesa_numero" => $value,
        "mesa_estado" => 1,
        "mesa_id_lugar" => $request["lista"]

      ); 
      $estado=$this->db->insert('mesa', $data);
    }
      $response["estado"]=true;
      $response["mensaje"]="Se proceso correctamente";
    echo json_encode($response);exit();

  }


public function ws_cargar_empresa()
{
   $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
  $dat=$this->Mantenimiento_m->consulta3("select * from empresa ");
    echo json_encode($dat);
}


public function ws_guardar_empresa()
    {

       $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
       $data=array(
          "empresa_razon_social"=>$request["razon_social"],
          "empresa_direccion"=>$request["empresa_direccion"],
          "empresa_telefono"=>$request["empresa_telefono"],
          "empresa_correo"=>$request["empresa_correo"],
          "empresa_abreviatura"=>$request["empresa_abreviatura"],
          "empresa_nombre_comercial"=>$request["empresa_nombre_comercial"],
         "empresa_token_facturacion"=>$request["empresa_token_facturacion"],
         "empresa_icono"=>$request["empresa_icono"],
         "empresa_fondo"=>$request["empresa_fondo"],
         "empresa_color"=>$request["empresa_color"]


          
        



       );
             $this->db->where('empresa_ruc',$data_token["empresa_ruc"]);
          $estado=$this->db->update('empresa', $data);
       $response["estado"]=true;
      $response["mensaje"]="Se Guardado correctamente";
    echo json_encode($response);exit();
    }


    public function cargar_categoria_producto(){

  $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from categoria_producto where categoria_producto_estado=1 and id_sede=".$data_token["empresa_sede"])->result_array();
      
      $resp=array();

       $resp[]=array(
          "categoria_producto_id"=>"0",
        "categoria_producto_descripcion"=>"Todos",
        "categoria_producto_estado"=>  "",
        "id_sede"=> "1",
        "estado_seleccionar"=>true,
        "categoria_imagen"=> "default.jpg");
      foreach ($response as $key => $value) {
         $resp[]=array(
          "categoria_producto_id"=> $value["categoria_producto_id"],
        "categoria_producto_descripcion"=> $value["categoria_producto_descripcion"],
        "categoria_producto_estado"=>  $value["categoria_producto_estado"],
        "id_sede"=> $value["id_sede"],
        "estado_seleccionar"=>false,
        "categoria_imagen"=> $value["id_sede"]);
      }

       echo json_encode($resp);exit();
     //  echo json_encode($response);exit();

    }


    public function ws_estock_actualizar(){

      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    $tipo_producto = array();
    $idproducto = array();
    $stock_total=0;
    $idproducto = $this->db->query("SELECT detalle_venta.cod_producto_venta, detalle_venta.cantidad FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$request["id"].";")->row();
    $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
    if($tipo_producto->producto_id_tipoproducto==1){
      $stock=$this->db->query("SELECT detalle_producto_almacen.detalle_stock as stock FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$idproducto->cod_producto_venta.";")->row();
      $stock_total=$stock->stock;
    }else{
      $stock_total=$this->db->query("SELECT producto.producto_stock as stock FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
      $stock_total=$stock_total->stock;
      //$stock_total=$this->extraer_stock_plato($idproducto->cod_producto_venta,$_COOKIE["id_sede"]);


    } 

    echo json_encode(array("stock"=>$stock_total));
    exit();
  }


  public function ws_editar_datos_detalle(){  
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    $administrador = $datos_venta = $this->Mantenimiento_m->consulta3("SELECT id_usuarioe as empleado_id FROM usuario_eliminar WHERE usuario_eli = '".$request['usuario']."'  and clave_eli = '".$request['contrasena']."';");
    if(count($administrador)==0){
         echo json_encode(array("estado"=>false,"mensaje"=>"error en usuario o clave"));

      exit();
    } 
    $detalle_venta=$this->Mantenimiento_m->consulta3("SELECT detalle_venta.id_detalle_venta, detalle_venta.cod_producto_venta,producto.producto_id_tipoproducto,
      detalle_venta.precio,detalle_venta.cantidad
      FROM detalle_venta
      INNER JOIN producto ON detalle_venta.cod_producto_venta = producto.producto_id  where id_detalle_venta=".$request["id_detalle_venta"]." and detalle_venta.estado_pedido<>0");
 
    foreach ($detalle_venta as $key => $value){ 

      $cantidad_nueva=(float)$request["cantidad"]; 
      $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$value["cod_producto_venta"].";")->row();
      if($tipo_producto->producto_id_tipoproducto==1){  
        $almacen_id = $this->Mantenimiento_m->consulta2("SELECT almacen_id FROM almacenes where almacenes.id_sede = ".$data_token["id_sede"]." and almacen_uso = 1 ");
        $id_almacen=$this->Mantenimiento_m->consulta2("SELECT detalle_producto_almacen.detalle_almacen as id_almacen FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$value["cod_producto_venta"]." AND detalle_producto_almacen.detalle_almacen = ".$almacen_id->almacen_id.";");
        $id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida
          INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida 
          WHERE producto.producto_id = ".$value["cod_producto_venta"]);
        $this->movimiento_stock_temporal($id_almacen->id_almacen,$value["cod_producto_venta"],$id_unidad_medida->detalle_unidad_producto_id,$value["cantidad"],$value["precio"],1,2,null,null,null);
        $this->movimiento_stock_temporal($id_almacen->id_almacen,$value["cod_producto_venta"],$id_unidad_medida->detalle_unidad_producto_id,$cantidad_nueva,$value["precio"],2,2,null,null,null); 
      }else{ 
        //$id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida WHERE producto.producto_id = ".$value["cod_producto_venta"]);
        $this->movimiento_stock_tplatos($value["cod_producto_venta"],null,$value["cantidad"],$value["precio"],1,2);
        $this->movimiento_stock_tplatos($value["cod_producto_venta"],null,$cantidad_nueva,$value["precio"],2,2);
      }
      $detalle_venta=array(
          "cantidad"=>$request["cantidad"],
      );
      $this->db->where('id_detalle_venta',$request["id_detalle_venta"]);
      $this->db->update('detalle_venta', $detalle_venta);
    }
$cod_venta=$this->db->query("SELECT detalle_venta.id_venta FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$request["id_detalle_venta"].";")->row();
      $datos_venta=$this->Mantenimiento_m->consulta3("SELECT detalle_venta.cantidad, detalle_venta.precio FROM detalle_venta WHERE detalle_venta.estado_pedido <> 0 and detalle_venta.id_venta=".$cod_venta->id_venta);
    //multiplicar y sumar
      $total=0;
      foreach ($datos_venta as $key => $value) {
        $total=$total+((float)$value["cantidad"]*(float)$value["precio"]);
      }
    //traer monto delivery
      $monto_delivery=$this->db->query("SELECT venta.venta_monto_delivery FROM venta WHERE venta.venta_idventas=".$cod_venta->id_venta.";")->row();
      $total= $total+(float)$monto_delivery->venta_monto_delivery;
    //actualizar total venta
      $datos_venta_actualizar = array(
        "venta_monto"=>$total
      );
      $this->db->where('venta_idventas',$cod_venta->id_venta);
      $this->db->update('venta', $datos_venta_actualizar);
    
    echo json_encode(array("estado"=>true,"mensaje"=>"Se edito correctamente", "cantidad"=>$request["cantidad"]));
  }


  public function ws_eliminar_pedido_detalle(){

     $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    if(!empty($request["eliminar_usuario"])){
      $administrador = array();
      $administrador= $datos_venta=$this->Mantenimiento_m->consulta3("SELECT empleados.empleado_id FROM empleados WHERE empleados.perfil_id=12 AND empleados.empleado_usuario='".$request['eliminar_usuario']."' AND empleados.empleado_clave='".$request['eliminar_contrasena']."' AND empleados.empresa_sede=".$data_token["empresa_sede"]);
      if(count($administrador)==0){
       echo json_encode(array("estado"=>false,"mensaje"=>"usuario o clave invalido"));
      }
    }
    $motivo=$request["motivo"];
    $id_detalle_venta=$request["id_detalle_venta_modal"];
    $sede=$this->Mantenimiento_m->consulta3("select * from sede where id_sede=".$data_token["empresa_sede"]);
    $ruc=$this->Mantenimiento_m->consulta2("SELECT empresa_ruc FROM empresa LIMIT 1");
    $ruc = $ruc->empresa_ruc;
    $existes = 1;
    $tipo_producto = array();
    $stock_detalle = array();
    $idproducto = array();
    if(($existes)==1){
      $data=array(
        "observacion_eliminado"=>$motivo,
        "estado_pedido"=>0,
        "detalle_usuario_eliminado"=>$data_token["empleado_id"],
        "detalle_venta_fecha_eliminar"=>date("Y-m-d H:i:s")
      );
      $this->db->where('id_detalle_venta',$id_detalle_venta);
      $this->db->update('detalle_venta', $data);
      $idproducto = $this->db->query("SELECT detalle_venta.cod_producto_venta, detalle_venta.cantidad,detalle_venta.precio FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$request["id_detalle_venta_modal"].";")->row();
      $tipo_producto=$this->db->query("SELECT producto.producto_id_tipoproducto, producto.producto_stock,producto.producto_stock_temporal FROM producto WHERE producto.producto_id=".$idproducto->cod_producto_venta.";")->row();
      if($tipo_producto->producto_id_tipoproducto==1){
        $almacen_id = $this->Mantenimiento_m->consulta2("SELECT almacen_id FROM almacenes where almacenes.id_sede = ".$data_token["empresa_sede"]." and almacen_uso = 1 ");
        $id_almacen=$this->Mantenimiento_m->consulta2("SELECT detalle_producto_almacen.detalle_almacen as id_almacen FROM detalle_producto_almacen WHERE detalle_producto_almacen.detalle_producto=".$idproducto->cod_producto_venta." AND detalle_producto_almacen.detalle_almacen = ".$almacen_id->almacen_id.";");
        $id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida
          INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida 
          WHERE producto.producto_id = ".$idproducto->cod_producto_venta);
        $this->movimiento_stock_temporal($id_almacen->id_almacen,$idproducto->cod_producto_venta,$id_unidad_medida->detalle_unidad_producto_id,$idproducto->cantidad,$idproducto->precio,1,2);
      }else{
        //$id_unidad_medida = $this->Mantenimiento_m->consulta2("SELECT detalle_unidad_producto.detalle_unidad_producto_id FROM producto INNER JOIN unidad_medida ON producto.unidad_medida_id = unidad_medida.id_unidad_medida INNER JOIN detalle_unidad_producto ON detalle_unidad_producto.id_unidad_medida = unidad_medida.id_unidad_medida WHERE producto.producto_id = ".$idproducto->cod_producto_venta);
        $this->movimiento_stock_tplatos($idproducto->cod_producto_venta,null,$idproducto->cantidad,$idproducto->precio,1,2);    
      }
      $detalle=$this->Mantenimiento_m->consulta3("select * from detalle_venta where id_detalle_venta=".$id_detalle_venta);

      $activo_detalle=$this->Mantenimiento_m->consulta3("select * from detalle_venta where estado_pedido=1 and id_venta=".$detalle[0]["id_venta"]);
      $total=0;
      foreach ($activo_detalle as $key => $value) {
        $total+=(float)$value["cantidad"]*(float)$value["precio"];
      }
      $venta=$this->Mantenimiento_m->consulta3("select * from venta where venta_idventas=".$detalle[0]["id_venta"]);
      $total=$total+(float)$venta[0]["venta_monto_delivery"];
      $data=array(
        "venta_monto"=> $total
      );
      $this->db->where('venta_idventas',$detalle[0]["id_venta"]);
      $this->db->update('venta', $data);
      $venta_total=$this->Mantenimiento_m->consulta3("select count(id_detalle_venta) as numero from detalle_venta where id_venta=".$detalle[0]["id_venta"]);
      $eliminar_total=$this->Mantenimiento_m->consulta3("select count(id_detalle_venta) as numero from detalle_venta where estado_pedido=0 and id_venta=".$detalle[0]["id_venta"]);
      $cocinado=$this->Mantenimiento_m->consulta3("select count(id_detalle_venta) as numero from detalle_venta where estado_pedido=0 and id_venta=".$detalle[0]["id_venta"]);
      if($venta_total[0]["numero"]==$eliminar_total[0]["numero"]){
        $data=array(
          "venta_estado"=>"0",
          "venta_fecha_eliminacion"=>date("Y-m-d H:i:s"),
          "venta_empleado_eliminacion"=>$data_token["empleado_id"]
        );
        $this->db->where('venta_idventas',$detalle[0]["id_venta"]);
        $this->db->update('venta', $data);
        $dat=$this->Mantenimiento_m->consulta3("select * from venta where venta_idventas=".$detalle[0]["id_venta"]);
          $id_mesa=$dat[0]["venta_codigomesa"];
          $data=array(
            "mesa_disponible"=>"0"
          );
          $this->Mantenimiento_m->actualizar("mesa",$data,  $id_mesa,"mesa_id");
      }
      else{  
        $sql="select count(id_detalle_venta) as numero from detalle_venta where detalle_estado_preparado=1 and estado_pedido=1 and id_venta=".$detalle[0]["id_venta"];
        $cantidad_detalle_activo=$this->Mantenimiento_m->consulta3($sql);
        if($cantidad_detalle_activo[0]["numero"]==0){
          $data=array(
            "venta_estadococina"=>2,
            "venta_fecha_preparacion"=>date("Y-m-d H:i:s")
          );
          $this->db->where('venta_idventas',$detalle[0]["id_venta"]);
          $this->db->update('venta', $data);
        }
      }
    echo json_encode(array("estado"=>true,"mensaje"=>"Se elimino correctamente","id_detalle_venta"=>$id_detalle_venta));
    }
    else{
     echo json_encode(array("estado"=>false,"mensaje"=>"No existe usuario"));
    }
  }


    public function ws_editar_canje_parte(){

      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 
    $administrador = $datos_venta = $this->Mantenimiento_m->consulta3("SELECT id_usuarioe as empleado_id FROM usuario_eliminar WHERE usuario_eli = '".$request['usuariocanje']."'  and clave_eli = '".$request['contrasenacanje']."';");
    if(count($administrador)==0){
      echo json_encode(array("estado"=>false,"mensaje"=>"usuario o clave invalido"));
      exit();
    }
      //editar detalle
    //DC : Descuento Canje.
    //DS : Descuento Soles.
    //DP : Descuento Porcentaje
    //print_r($_POST);exit();
      if ($request["descuento"] == 1) {
        $estadodescuento = 'DC';
        $descripcion = 'Canje';
      }else{
        $estadodescuento = 'DS';
        $descripcion = 'Descuento';
      }

      if ($request["estockcanje_producto"] == 0) {
        $estadoplato = 0;
      }else{
        $estadoplato = 1;
      }
      $detalle_venta=array(
        "cantidad"=>$request["estockcanje_producto"],
        "estado_pedido" => $estadoplato
      );
      $this->db->where('id_detalle_venta',$request["id_detalle_canje"]);
      $this->db->update('detalle_venta', $detalle_venta);
    //traer datos de la venta
      $cod_venta=$this->db->query("SELECT detalle_venta.id_venta,detalle_venta.cod_producto_venta FROM detalle_venta WHERE detalle_venta.id_detalle_venta=".$request["id_detalle_canje"].";")->row();
      $detalle_deventa = array(
        "descripcion" => $descripcion,
        "cantidad" => $request["cantidadcanje"],
        "precio" => $request["precio_canjeproducto"],
        "id_venta" => $cod_venta->id_venta,
        "fecha_preparar" => date("Y/m/d"),
        "id_tipoentrega" => 1,
        "estado_descuento" => $estadodescuento,
        "cod_producto_venta" => $cod_venta->cod_producto_venta
      );
      $this->db->insert('detalle_venta', $detalle_deventa); 
      $datos_venta=$this->Mantenimiento_m->consulta3("SELECT detalle_venta.cantidad, detalle_venta.precio FROM detalle_venta WHERE detalle_venta.estado_pedido <> 0 and detalle_venta.id_venta=".$cod_venta->id_venta);
    //multiplicar y sumar
      $total=0;
      foreach ($datos_venta as $key => $value) {
        $total=$total+((float)$value["cantidad"]*(float)$value["precio"]);
      }
    //traer monto delivery
      $monto_delivery=$this->db->query("SELECT venta.venta_monto_delivery FROM venta WHERE venta.venta_idventas=".$cod_venta->id_venta.";")->row();
      $total= $total+(float)$monto_delivery->venta_monto_delivery;
    //actualizar total venta
      $datos_venta_actualizar = array(
        "venta_monto"=>$total
      );
      $this->db->where('venta_idventas',$cod_venta->id_venta);
      $this->db->update('venta', $datos_venta_actualizar);
      echo 1;

//    }
  }


  public function ws_cliente_lista()
  {
      try {
          // Decodifica el token y valida su formato
          $data_token = json_decode($this->consultar_token(), true);
          if (json_last_error() !== JSON_ERROR_NONE) {
              throw new Exception("Error al decodificar el token: " . json_last_error_msg());
          }
  
          $response = array();
  
          // Obtiene los datos del cuerpo de la solicitud
          $postdata = file_get_contents("php://input");
          $request = json_decode($postdata, true);
  
          if (json_last_error() !== JSON_ERROR_NONE) {
              throw new Exception("Error al decodificar el cuerpo de la solicitud: " . json_last_error_msg());
          }
  
          // Consulta los datos en la base de datos
          $data["tabla"] = $this->Mantenimiento_m->consulta3("
              SELECT 
    clientes.cliente_id AS 'id',
    clientes.*,
    tipo_membresia.tipo_membresia_id,
    tipo_membresia.tipo_membresia_descripcion AS 'tipo_membresia_nombre',
    CASE 
        WHEN clientes.cliente_estado_fechavencimiento = 1 THEN clientes.fechaFinMembresia
        ELSE (
            SELECT membresia.membresia_fecha_fin 
            FROM membresia 
            WHERE membresia.cliente_id = clientes.cliente_id 
            ORDER BY membresia.membresia_fecha_fin DESC 
            LIMIT 1
        )
    END AS fecha_vencimiento,
    CASE 
        WHEN clientes.cliente_estado_fechavencimiento = 1 THEN 'Opción Activada'
        ELSE 'Opción Desactivada'
    END AS estado_opcion
FROM clientes
LEFT JOIN tipo_membresia 
    ON clientes.cliente_tipomembresia = tipo_membresia.tipo_membresia_id
WHERE clientes.estado = '1' 
  AND clientes.cliente_nombres IS NOT NULL  
ORDER BY fecha_vencimiento DESC
          ");
  
          if ($data["tabla"] === false) {
              throw new Exception("Error al obtener los datos de la base de datos.");
          }
  
          // Devuelve los datos en formato JSON
          echo json_encode($data);
  
      } catch (Exception $e) {
          // Manejo del error y respuesta en caso de excepción
          $error_response = array(
              "success" => false,
              "message" => $e->getMessage()
          );
  
          http_response_code(500); // Responde con un código HTTP 500
          echo json_encode($error_response);
      }
  }

  public function guardar_cliente(){
    $data_token = json_decode($this->consultar_token(), true);
    $response = array();
    $postdata = file_get_contents("php://input");
    $request = json_decode($postdata, true);

    // Validar fecha
    $fechaFinMembresia = $request["fechaFinMembresia"];
    $fechaActual = date('Y-m-d');

    if (strtotime($fechaFinMembresia) < strtotime($fechaActual)) {
        $response["estado"] = false;
        $response["mensaje"] = "La fecha de membresía no es vigente.";
        echo json_encode($response);
        exit();
    }

    // Consultar membresía
    $membresia = $this->db->query("SELECT * FROM membresia WHERE cliente_dni = ? AND estado = 1", [$request["dni"]])->row_array();

    if (empty($membresia)) {
        $response["estado"] = false;
        $response["mensaje"] = "No se encontró información en la tabla membresía para el cliente.";
        echo json_encode($response);
        exit();
    }

    exit();
      if($request["id"]=="")
      {
        $estado=$this->db->insert('clientes', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('cliente_id',$request["id"]);
        $estado=$this->db->update('clientes', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }
  
  public function cargar_cliente_uno()
  {
      $data_token = json_decode($this->consultar_token(), true);
      $response = array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata, true); 
  
      if (isset($request['id'])) {
          // Consulta por ID
          $dat = $this->db->query("SELECT clientes.cliente_id as 'id',clientes. * 
                                   FROM clientes 
                                   WHERE cliente_id = ?", [$request['id']])->row_array();
      } elseif (isset($request['dni'])) {
          // Consulta por DNI
          $dat = $this->db->query("SELECT clientes.cliente_id as 'id', clientes.* 
                                   FROM clientes 
                                   WHERE cliente_dni = ?", [$request['dni']])->row_array();
      } else {
          // Si no se proporciona ni id ni dni, retornar error
          echo json_encode([
              'estado' => 'error',
              'mensaje' => 'Debe proporcionar un ID o un DNI para realizar la consulta.'
          ]);
          return;
      }
  
      // Retornar los datos obtenidos o un mensaje si no se encuentra
      if ($dat) {
          echo json_encode($dat);
      } else {
          echo json_encode([
              'estado' => 'error',
              'mensaje' => 'Cliente no encontrado.'
          ]);
      }
  }

  public function eliminar_cliente() {
    $data_token = json_decode($this->consultar_token(), true);
    $id_empleado = $data_token["empleado_id"]; 
    $response = array();
    $postdata = file_get_contents("php://input");
    $request = json_decode($postdata, true); 
    $id_cliente = $request['id'];
    $motivo = $request["mensaje"];
    $tipo_transaccion = 'DELETE';
    $transaccion_id = $this->generarUUID(); // Generar un identificador único para la transacción

    $this->db->trans_begin(); // Iniciar transacción

    try {
        // Validar que el cliente existe y está activo
        $cliente = $this->Servicio_m->obtener_cliente_por_id($id_cliente);
        if (!$cliente) {
            throw new Exception("El cliente no existe o ya está inactivo.");
        }

        // Cambios detectados para registrar en el log
        $cambios = [
            [
                'campo_cambiado' => 'estado',
                'valor_anterior' => $cliente->estado,
                'valor_nuevo' => '0',
            ],
            [
                'campo_cambiado' => 'cliente_motivoeliminacion',
                'valor_anterior' => $cliente->cliente_motivoeliminacion,
                'valor_nuevo' => $motivo,
            ]
        ];

        // Actualizar estado del cliente a inactivo y registrar el motivo de eliminación
        $update_query = "
            UPDATE clientes 
            SET estado = '0', cliente_motivoeliminacion = ?
            WHERE cliente_id = ?";
        $this->db->query($update_query, array($motivo, $id_cliente)); 

        // Registrar cada cambio en el log de transacciones
        foreach ($cambios as $cambio) {
            $log_query = "
                INSERT INTO transacciones_cliente_log (transaccion_id, cliente_id, empleado_id, accion, campo_cambiado, valor_anterior, valor_nuevo, motivo)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $this->db->query($log_query, array(
                $transaccion_id,
                $id_cliente,
                $id_empleado,
                $tipo_transaccion,
                $cambio['campo_cambiado'],
                $cambio['valor_anterior'],
                $cambio['valor_nuevo'],
                $motivo
            ));
        }

        // Verificar el estado de la transacción
        if ($this->db->trans_status() === FALSE) {
            throw new Exception("Error al realizar la transacción.");
        }

        $this->db->trans_commit(); // Confirmar transacción

        $response["estado"] = true;
        $response["mensaje"] = "Cliente eliminado correctamente y transacción registrada.";
    } catch (Exception $e) {
        $this->db->trans_rollback(); // Revertir transacción

        $response["estado"] = false;
        $response["mensaje"] = "Error: " . $e->getMessage();
    }

    echo json_encode($response);
    exit();
}

private function generarUUID() {
  return sprintf(
      '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
      mt_rand(0, 0xffff), mt_rand(0, 0xffff),
      mt_rand(0, 0xffff),
      mt_rand(0, 0x0fff) | 0x4000,
      mt_rand(0, 0x3fff) | 0x8000,
      mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
  );
}
  public function cargar_platos_productos()
  {
     $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
     $data["tabla"]=$this->Mantenimiento_m->consulta3("SELECT producto.producto_id as 'id',producto.*
FROM
producto
INNER JOIN categoria_producto ON categoria_producto.categoria_producto_id = producto.categoria_producto_id

 where producto_estado=1 and producto.producto_id_tipoproducto=3 and producto.id_sede=".$data_token["empresa_sede"]);

      echo json_encode($data);
  }

public function ws_actualizar_categoria(){

   $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();

  $json=$this->Mantenimiento_m->consulta3("select * from categoria_producto where categoria_producto_estado=1 and id_sede=".$data_token["empresa_sede"]);
  echo json_encode($json);exit();
}


public function ws_guardar_plato()
{

   $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
      $nombre_imagen="";
       if($request['imagen']['name']!="")
       {    $dir_subida = "public/img/productos/";
            $nombre=basename($request['imagen']['name']) ;
            $datos_url=explode(".", $nombre);
            $can=sizeof($datos_url);
            $res=$can-1;
            $url=md5(rand().time()).".".$datos_url[$res];
            $fichero_subido = $dir_subida.$url;
            $ancho_nuevo=400; 
            $alto_nuevo=400; 
             if (copy($request['imagen']['tmp_name'], $fichero_subido)){
              }else {
                echo "Error al subir la foto es demasiado grande";                 
              }     
              $this->redim ($fichero_subido,$fichero_subido,$ancho_nuevo,$alto_nuevo); 
              $nombre_imagen=$url;
       }else
       {

            if($request["producto_id"]!=""){
               $imagen=$this->Mantenimiento_m->consulta3("select * from producto where  producto_id=".$request["producto_id"]);
               $nombre_imagen=$imagen[0]["producto_imagen"];
            }else{

            $nombre_imagen="default.jpg";

            }



       }
                
   
     $id_producto="";
    // echo "data".$_POST["producto_id"];exit();
      if($request["producto_id"]=="")
      {

           $data=array(
        "producto_codigobarra"=>$request["codigo_barra"],
        "producto_codigo_referencia"=>$request["codigo_referencia"],
        "producto_descripcion"=>$request["descripcion"],
        "producto_precio"=>$request["moneda"],
        "moneda_id"=>$request["tipo_moneda"],
        "categoria_producto_id"=>$request["categoria"],
        "producto_stock"=>0,
       
       
        "producto_minimo"=>$request["stock_minimo"],
      
        "producto_id_tipoproducto"=>3,
        "id_sede"=>$data_token["empresa_sede"],
        "unidad_medida_id"=>$request["unidad"],
       
        "producto_imagen"=>$nombre_imagen,
           
      );
             
        $this->Mantenimiento_m->insertar("producto",$data);
        $id_producto= $this->db->insert_id();


      }

      else{

        $data=array(
        "producto_codigobarra"=>$request["codigo_barra"],
        "producto_codigo_referencia"=>$request["codigo_referencia"],
        "producto_descripcion"=>$request["descripcion"],
        "producto_precio"=>$request["moneda"],
        "moneda_id"=>$request["tipo_moneda"],
        "categoria_producto_id"=>$request["categoria"], 
       
       
        "producto_minimo"=>$request["stock_minimo"],
      
        "producto_id_tipoproducto"=>3,
        "id_sede"=>$data_token["empresa_sede"],
        "unidad_medida_id"=>$request["unidad"],
       
        "producto_imagen"=>$nombre_imagen,
           
      );

        $this->Mantenimiento_m->actualizar("producto",$data,$request["producto_id"],"producto_id");
        $id_producto=$request["producto_id"];

      }
       $response["estado"]=true;
      $response["mensaje"]="se guardo correctamente";
      echo json_encode($response);exit();
}


/*



  public function eliminar_unidad_medida()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update unidad_medida set unidad_medida_estado=0 where id_unidad_medida=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

    public function cargar_uno_unidad_medida()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from unidad_medida where unidad_medida_estado =1")->row_array();
       echo json_encode($response);exit();


  }

  
*/



/***************************************************************perfil************************************************************************************/


public function lista_perfil()
{
  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
         $data["lista_concepto"]=$this->Mantenimiento_m->consulta3("select perfiles.perfil_id as 'id',
 perfiles.perfil_descripcion as 'descripcion',
 perfiles.perfil_url as 'url'
from perfiles where 
 estado=1");

         echo json_encode($data);exit();


}

public function eliminar_perfil()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update perfiles set estado=0 where perfil_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 


  public function guardar_perfil()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              "perfil_descripcion"=>$request["descripcion"],
              "perfil_url"=>$request["url"],
      
              "estado"=>1

      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('perfiles', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('perfil_id',$request["id"]);
        $estado=$this->db->update('perfiles', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }
  public function cargar_perfil_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from perfiles where perfil_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }


/*********************************************************************************************************************************************************/
/***************************************************************modulo************************************************************************************/

public function lista_modulopadre()
{
  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
         $data["lista_concepto"]=$this->Mantenimiento_m->consulta3("select * 
from modulos
where modulo_padre=1
and estado=1");

         echo json_encode($data);exit();


}
public function lista_modulo()
{
  $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
         $data["lista_concepto"]=$this->Mantenimiento_m->consulta3("select modulos.modulo_id as 'id',
 modulos.modulo_nombre as 'descripcion',
 modulos.modulo_url as 'url'
from modulos where 
 estado=1");

         echo json_encode($data);exit();


}

public function eliminar_modulo()
  {
    $data_token = json_decode($this->consultar_token(),true);

   $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
    $data=array();
    $id=$request['id'];
      $this->Mantenimiento_m->consulta1("update modulos set estado=0 where modulo_id=".$id);
      $response["estado"]=true;
      $response["mensaje"]="se elimino correctamente";
      echo json_encode($response);exit();

  } 

  
  public function guardar_modulo()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 

        $data=array(
              "modulo_nombre"=>$request["descripcion"],
              "modulo_icono"=>$request["icono"],
              "modulo_url"=>$request["url"],
              "modulo_padre"=>$request["modulopadre"],
              "estado"=>1

      
          );
      if($request["id"]=="")
      {
        $estado=$this->db->insert('modulos', $data);
        $mensaje="Se Registro Correctamente";
      }
      else
      {
        $this->db->where('modulo_id',$request["id"]);
        $estado=$this->db->update('modulos', $data);
        $mensaje="Se Actualizo Correctamente";

      }
      $response["estado"]=true;
      $response["mensaje"]=$mensaje;
    echo json_encode($response);exit();

  }
  public function cargar_modulo_uno()
  {
      $data_token = json_decode($this->consultar_token(),true);
      $response=array();
      $postdata = file_get_contents("php://input");
      $request = json_decode($postdata,true); 


      $response=$this->db->query("select * from modulos where modulo_id=".$request["id"])->row_array();
       echo json_encode($response);exit();


  }


/*********************************************************************************************************************************************************/



  public function ws_cargar_perfil()

  {

     $data_token = json_decode($this->consultar_token(),true);

     $response=array();

      $data=$this->db->query("select * from perfiles where estado=1")->result_array();

      foreach ($data as $key => $value) {



        $response[$key]["value"]=$value["perfil_id"];

        $response[$key]["label"]=$value["perfil_descripcion"];



      }

      echo json_encode($response);exit();

  }

  public function ws_traer_modulo()
  {
      try {
          // Verificar token
          $data_token = json_decode($this->consultar_token(), true);
  
          // Inicializar respuesta y procesar datos entrantes
          $response = [];
          $postdata = file_get_contents("php://input");
          $request = json_decode($postdata, true); 
  
          if (!isset($request["perfil_id"])) {
              throw new Exception("El perfil_id es requerido.");
          }
          $perfil_id = intval($request["perfil_id"]);
  
          // Consulta principal para obtener los módulos padres
          $data = $this->db->query("
              SELECT 
                  modulohijo.modulo_id,
                  modulohijo.modulo_padre,
                  modulohijo.modulo_nombre as nombre_padre
              FROM
                  modulos
              INNER JOIN modulos AS modulohijo ON modulos.modulo_padre = modulohijo.modulo_id
              WHERE 
                  modulohijo.modulo_id != 1 
                  AND modulos.estado = 1
              GROUP BY 
                  modulohijo.modulo_id,
                  modulohijo.modulo_padre,
                  modulohijo.modulo_nombre
          ")->result_array();
  
          foreach ($data as $key => $value) {
              // Consulta para obtener los submódulos y su estado
              $mod = $this->db->query("
                  SELECT 
                      modulos.modulo_id as id,
                      modulos.modulo_nombre,
                      IF((
                          SELECT 
                              permisos_sede.persed_id_modulo 
                          FROM 
                              permisos_sede
                          WHERE 
                              permisos_sede.persed_id_modulo = modulos.modulo_id
                              AND permisos_sede.persed_id_perfil = ?
                      ) IS NULL, false, true) as estado
                  FROM
                      modulos
                  INNER JOIN modulos AS modulohijo ON modulos.modulo_padre = modulohijo.modulo_id
                  WHERE 
                      modulohijo.modulo_id = ? 
                      AND modulos.estado = 1
              ", [$perfil_id, intval($value["modulo_id"])])->result_array();
  
              // Agregar submódulos al módulo padre
              foreach ($mod as $key1 => $value1) {
                  $data[$key]["lista"][$key1] = [
                      "estado" => (int) $value1["estado"],
                      "id" => $value1["id"],
                      "modulo_nombre" => $value1["modulo_nombre"]
                  ];
              }
          }
  
          // Retornar la respuesta en formato JSON
          echo json_encode($data);
  
      } catch (Exception $e) {
          // Manejar errores y retornar un mensaje de error en JSON
          http_response_code(400);
          echo json_encode([
              "error" => true,
              "message" => $e->getMessage()
          ]);
      }
  }


  public function ws_procesar_permiso()

  {

      $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

  // echo  count($params["modulo"]);

    if(!isset($params["modulo"]) || count($params["modulo"])==0 ){

       $response['ok'] = true;

      $response['msg'] = 'Al menos debe agregar un modulo';

      $response['estado'] = 2;



      

    }else{

      $cantidad = count($params["modulo"]); 

      $this->Mantenimiento_m->consulta1("DELETE FROM permisos_sede WHERE persed_id_perfil=".$params["perfil_id"]);

      for ($i=0; $i < $cantidad; $i++) { 

        $data=array(

          "persed_id_perfil"=>$params["perfil_id"],

          "persed_id_modulo" => $params["modulo"][$i],

         

        );

        $estado=$this->db->insert('permisos_sede', $data);

      } 

      $response['ok'] = true;

      $response['msg'] = 'Se agregó correctamente los permisos';

      $response['estado'] = 1;

    }

    echo json_encode($response);exit();

  }







  /*****************************************************************************************************************************************************/

  public function buscar_tabla(){

$data_token = json_decode($this->consultar_token(),true);
 // $response=array();
  $postdata = file_get_contents("php://input");
  $request = json_decode($postdata,true); 
//print_r($request);
  $columns = array( 
      0 =>'id', 
      1 =>'cliente',
      2=> 'glosario',
      3=> 'fecha',
      4=> 'monto',
      5=> 'serie',

      6=>'button',
    );
    $limit =  $request['length'];
    $start = $request['start'];
    $order = $columns[ $request['order'][0]['column']];
    $dir = $request['order'][0]['dir'];
    $d= $request['order'][0]["column"];
  

      $sql1="SELECT * FROM venta
      INNER JOIN empleados ON venta.venta_codigomozo = empleados.empleado_id
      INNER JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
      where venta.venta_estado=1 and venta.venta_idsede=".$data_token["empresa_sede"]."  order by 
      venta.venta_fecha_pago desc";
    



    $lista=$this->db->query($sql1)->result_array();
    $formar_order="";
  if( $d==0)
    {
      $formar_order="venta.venta_idventas";
    }
    if( $d==1)
    {
      $formar_order="venta.venta_idventas";

    }
    if( $d==2)
    {
      //$formar_order="mesa.mesa_TableName";

    }

    if( $d==2)
    {
      $formar_order="venta.venta_idventas";

    }
    if( $d==3){
      $formar_order="venta.venta_idventas";
    }
    if( $d==4){
      $formar_order="venta.venta_idventas";
    }
    if( $d==5){
      $formar_order="venta.venta_idventas";
    }



    $totalFiltered = count($lista); 
    $totalData = count($lista); 




    $data;
       if(empty($request['search']['value']))
        { // cuando no existe buscar
          
            $sql="SELECT * FROM venta
            INNER JOIN empleados ON venta.venta_codigomozo = empleados.empleado_id
            INNER JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
            where venta.venta_estado=1 and venta.venta_idsede=".$data_token["empresa_sede"]."
            ORDER BY ".$formar_order." desc limit ".$start.",".$limit;
          
          
          $lista_datos=$this->db->query($sql);

          if($lista_datos->num_rows()>0)
          {
            $data= $lista_datos->result(); 
          }
          else
          {
            $data= null;
          }
        }
        else
        {
          // cuando  existe buscar
          $search = $request['search']['value']; 
        
            $sql="SELECT * FROM venta
            INNER JOIN empleados ON venta.venta_codigomozo = empleados.empleado_id
            INNER JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
            where venta.venta_estado=1  and (empleados.empleado_nombres like '%". $search."%' or clientes.cliente_nombres like '%". $search."%' or (CONCAT(venta.venta_num_serie,'-',venta.venta_num_documento) like '%".$search."%'  )  ) and venta.venta_idsede=".$data_token["empresa_sede"]."";
            $dat=$this->db->query($sql);
            $sql="SELECT * FROM venta         
            INNER JOIN empleados ON venta.venta_codigomozo = empleados.empleado_id
            INNER JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
            where venta.venta_estado=1 and (empleados.empleado_nombres like '%". $search."%' or clientes.cliente_nombres like '%". $search."%' or  (CONCAT(venta.venta_num_serie,'-',venta.venta_num_documento) like '%".$search."%'  )  ) and venta.venta_idsede=".$data_token["empresa_sede"]."
            ORDER BY ".$formar_order." desc limit ".$start.",".$limit;          
            $lista_datos=$this->db->query($sql);
          
          if($lista_datos->num_rows()>0)
          {
            $data= $lista_datos->result(); 
            $totalFiltered = $dat->num_rows();
          }
          else
          {
            $data= null;
            $totalFiltered = 0;
          }



        }

        $tabla = "'ventas'";
        $data1 = array();
        if(!empty($data)){
          foreach ($data as $post){
           $html1="";
            $nestedData['id'] = $post->venta_idventas;
            $nestedData['cliente'] = $post->cliente_nombres;
            $nestedData['glosario'] = $post->venta_glosario;
            $nestedData['fecha'] = $post->venta_pedidofecha;
            $nestedData['monto'] =$post->venta_monto;
            $nestedData['serie'] =$post->venta_num_serie.'-'.$post->venta_num_documento;
            $nestedData['pdf'] =$post->venta_pdf_facturacion;
            $nestedData['xml'] =$post->venta_xml_facturacion;
            $nestedData['cdr'] =$post->venta_cdr_facturacion;
            $nestedData['estado'] =(int)$post->venta_estado;

            $html="";

            $data1[] = $nestedData;

          }

        }
  $json_data = array(
          "draw"            => intval($request['draw']),  
          "recordsTotal"    => intval($totalData),  
          "recordsFiltered" => intval($totalFiltered), 
          "data"            => $data1   
        );

        echo json_encode($json_data); 












  }

    public function buscar_mesas_agrupar()
    {

        $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

      $idsilla=$params["idsilla"];
      $sql="select * from mesa where mesa_id=?";
      $mesa=$this->db->query($sql,array($idsilla))->row_array();

      $sql="SELECT
        mesa.mesa_tipo,
        mesa.mesa_id,
      IF
        ( mesa.mesa_tipo <> 1, CONCAT( 'Mesa ', mesa.mesa_numero ), CONCAT( 'Llevar', mesa.mesa_numero ) ) AS nombre_silla,
        lugar_mesa.lugarmesa_descripcion,
        mesa.mesa_id AS silla_idsilla,
        mesa.mesa_disponible AS silla_estado,
        mesa.mesa_numero 
      FROM mesa
       INNER JOIN lugar_mesa ON
       mesa.mesa_id_lugar = lugar_mesa.lugarmesa_id
      WHERE
        mesa.mesa_id not in (0,".$idsilla.")
        AND lugar_mesa.id_sede = 1
        AND mesa.mesa_estado = 1 
        and lugar_mesa.lugarmesa_id=?
        and mesa.mesa_tipo=0
        and mesa.mesa_disponible=0
    
      ORDER BY

        mesa.mesa_numero";
         $response=$this->db->query($sql,array($mesa["mesa_id_lugar"]))->result_array();
    echo json_encode($response);exit();
      
    }

        public function guardar_mesa_agrupar()
    {
      $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

      $idsilla=$params["idsilla"];
          if( $idsilla!="")
          {

             if (isset($params["mesanueva"])) {
                  $sql="update mesa set mesa_estado_agrupacion=? where mesa_id=?";
                  $this->db->query($sql,array(1,$idsilla));

                  foreach ($params["mesanueva"] as $key => $value) {
                    
                        $sql="update mesa set mesa_estado_agrupacion=?,mesa_id_padre=? where mesa_id=?";
                  $this->db->query($sql,array(2,$idsilla,$value));
                  }

                    $resp["estado"]=true;
               $resp["mensaje"]="Se registro correctamente";
               echo json_encode($resp);exit();


             }
             else{
                $resp["estado"]=false;
           $resp["mensaje"]="No se encuentran sillas seleccionadas";
           echo json_encode($resp);exit();
             }
          }else{

           $resp["estado"]=false;
           $resp["mensaje"]="Numero de silla no valido";
           echo json_encode($resp);exit();
          }
    }

public function anular_mesaagrupar()
    {
        
         $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

      $idsilla=$params["idsilla"];
          if( $idsilla!="")
          {

          $this->anular_agrupacion_mesas($idsilla);
            $resp["estado"]=true;
               $resp["mensaje"]="Se registro correctamente";
               echo json_encode($resp);exit();
          }else{
      $resp["estado"]=false;
              $resp["mensaje"]="Numero de silla no valido";
              echo json_encode($resp);exit();

        }
    }

       public function reserva()
    {
            $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

      $id_silla=$params["idsilla"];
      $estado=$params['opcion'];
      $sql="update mesa set mesa_disponible=? where mesa_id=?";
      $this->db->query($sql,array($estado,$id_silla));
      
    }
    public function soporte_pedido()
    {


    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);
    }

    public function punto_pedido_restaurante()
    {

       $post=file_get_contents("php://input"); 
      $params=json_decode($post, true);
      $myfile = fopen("/public/newfile.txt", "w") or die("Unable to open file!");
      fwrite($myfile, $post);

      fclose($myfile);
    }
 

 public function buscar_cliente2(){ 

      $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);

    $term = $params['term'];
      $sql="SELECT cliente_celular,cliente_id,cliente_nombres, (IF(cliente_dni is null,'No cuenta con D.N.I',cliente_dni)) as cliente_dni  from clientes where cliente_id<>1 and (estado=1   and (cliente_nombres LIKE '%".$term."%' or cliente_dni LIKE '%".$term."%' or cliente_celular LIKE '%".$term."%'  ) ) limit 10";
    

    $data=$this->Mantenimiento_m->consulta3($sql);
    $data1=array();
    foreach ($data as $key => $value) {
      $sql="select * from direccion where cliente_id=".$value["cliente_id"]." and direccion_estado=1 order by direccion_id desc";
      $direcciones=$this->db->query($sql)->row_array();
    

      $data1[$key]["id"]=$value["cliente_id"]."/".$value["cliente_dni"]."/".$value["cliente_nombres"]."/".$direcciones["direccion_id"]."/".$direcciones["direccion_descripcion"];
      $data1[$key]["label"]=$value["cliente_celular"]." | ".$value["cliente_nombres"];
      $data1[$key]["value"]=$value["cliente_celular"];

    }
    echo json_encode($data1);

  }






  /*************************************************************************reporte**********************************************************/

   public function venta_dia(){
     $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      HOUR(venta_fecha_pago) AS Hora from venta where venta_idsede=".$data_token["empresa_sede"]." and DATE(venta_fecha_pago) = '".$params["fecha_inicio"]."' and venta_estado=2  and venta_fecha_pago is not null  GROUP BY HOUR(venta_fecha_pago)
      ORDER BY HOUR(venta_fecha_pago)");
       foreach ($dat as $key => $value) {
           $datos["extension"][$key]=$value["Hora"]." Horas";
           $datos["monto"][$key]=(float)$value["monto"];

       }
        $datos["cronologia"]="Horas";
       echo json_encode($datos);
   }


   public function venta_semana(){
      $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 

    $params=json_decode($post, true);
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      DATE_FORMAT(venta_fecha_pago,'%a') AS nombre_dia,DAY(venta_fecha_pago) from venta where venta_idsede=".$data_token["empresa_sede"]." and DATE(venta_fecha_pago) BETWEEN '".$params["fecha_inicio"]."' and '".$params["fecha_fin"]."' and venta_estado=2  and venta_fecha_pago is not null GROUP BY DATE(venta_fecha_pago)
      ORDER BY DATE(venta_fecha_pago)");
       foreach ($dat as $key => $value) {
           $datos["extension"][$key]=$this->nombre_dias_castellano($value["nombre_dia"]);
           $datos["monto"][$key]=(float)$value["monto"];

       }
        $datos["cronologia"]="Dias";
       echo json_encode($datos);
   }

     public function venta_mes(){
         $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 
        $params=json_decode($post, true);
      $datos=array();
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      DATE(venta_fecha_pago) AS nombre_dia,DAY(venta_fecha_pago) from venta where  venta_idsede=".$data_token["empresa_sede"]." and DATE(venta_fecha_pago) BETWEEN '".$params["fecha_inicio"]."' and '".$params["fecha_fin"]."' and venta_estado=2 and venta_fecha_pago is not null GROUP BY DATE(venta_fecha_pago)
      ORDER BY DATE(venta_fecha_pago)");
       foreach ($dat as $key => $value) {

           $timestamp = strtotime($value["nombre_dia"]); 
      $new_date = date('d/m/Y', $timestamp);
           $datos["extension"][$key]=$new_date;
           $datos["monto"][$key]=(float)$value["monto"];

       }
        $datos["cronologia"]="Fecha";
       echo json_encode($datos);
   }

   public function venta_anio(){
       $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 
        $params=json_decode($post, true);
     $datos=array();
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      MONTH(venta_fecha_pago) AS nombre_dia,DAY(venta_fecha_pago) from venta where venta_idsede=".$data_token["empresa_sede"]." and DATE(venta_fecha_pago) BETWEEN '".$params["fecha_inicio"]."' and '".$params["fecha_fin"]."' and venta_estado=2 and venta_fecha_pago is not null GROUP BY MONTH(venta_fecha_pago)
      ORDER BY MONTH(venta_fecha_pago)");
       foreach ($dat as $key => $value) {

        
           $datos["extension"][$key]=$this->nombre_meses_castellano($value["nombre_dia"]);
           $datos["monto"][$key]=(float)$value["monto"];

       }
        $datos["cronologia"]="Meses";
       echo json_encode($datos);
   }





   public function venta_anual(){
       $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 
        $params=json_decode($post, true);
     $datos=array();
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      YEAR(venta_fecha_pago) AS nombre_dia,DAY(venta_fecha_pago) from venta where venta_idsede=".$data_token["empresa_sede"]." and venta_estado=2 and venta_fecha_pago is not null GROUP BY YEAR(venta_fecha_pago)
      ORDER BY YEAR(venta_fecha_pago)");
       foreach ($dat as $key => $value) {

        
           $datos["extension"][$key]=($value["nombre_dia"]);
           $datos["monto"][$key]=(float)$value["monto"];

       }
        $datos["cronologia"]="";
       echo json_encode($datos);
   }


   public function venta_diagrama(){
        $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 
        $params=json_decode($post, true);
     $datos=array();
       $dat=$this->Mantenimiento_m->consulta3("select Sum(venta_monto) AS monto,
      YEAR(venta_fecha_pago) AS anio,MONTH(venta_fecha_pago) AS mes from venta where venta_idsede=".$data_token["empresa_sede"]." and venta_estado=2 and venta_fecha_pago is not null
       GROUP BY YEAR(venta_fecha_pago),MONTH(venta_fecha_pago)
      ORDER BY YEAR(venta_fecha_pago)");
      $datos[0][0]='ID';
       $datos[0][1]='Monto de Venta';
       $datos[0][2]='Fecha';
       $datos[0][3]='Descripcion';
       $datos[0][4]='Monto';


       foreach ($dat as $key => $value) {
        $dat=$value["anio"]."-".$value["mes"]."-1";
                    $timestamp = strtotime($dat); 
        
              $datos[$key+1][0]=$value["anio"].",".$value["mes"];
               $datos[$key+1][1]=(float)$value["monto"];
       $datos[$key+1][2]=(float)$timestamp ;
      
       $datos[$key+1][3]=$value["anio"].",".$this->nombre_meses_castellano($value["mes"])."(".$value["monto"].")";
       $datos[$key+1][4]=(float)$value["monto"];



      

       }
       echo json_encode($datos);
   }

 

 
 

 





   public function nombre_dias_castellano($dat)
   {
        
        switch ($dat) {
          case 'Sun':
            return "Domingo";
            break;
          
          case 'Mon':
          return "Lunes";
            # code...
            break;
          case 'Tue':
            # code...
          return "Martes";
            break;
          case 'Wed':
            # code...
          return "Miercoles";
            break;
          case 'Thu':
            # code...
          return "Jueves";
            break;
          case 'Fri':
            # code...
          return "Viernes";
            break;
          case 'Sat':
            # code...
          return "Sabado";
            break;

          default:
            # code...
            break;
        }
   }
    public function nombre_meses_castellano($dat)
   {
        
        switch ($dat) {
          case '1':
            return "Enero";
            break;
          
          case '2':
          return "Febrero";
            # code...
            break;
          case '3':
            # code...
          return "Marzo";
            break;
          case '4':
            # code...
          return "Abril";
            break;
          case '5':
            # code...
          return "Mayo";
            break;
          case '6':
            # code...
          return "Junio";
            break;
          case '7':
            # code...
          return "Julio";
            break;
          case '8':
            # code...
          return "Agosto";
            break;
          case '9':
            # code...
          return "Setiembre";
            break;

          case '10':
            # code...
          return "Octubre";
            break;

          case '11':
            # code...
          return "Noviembre";
            break;

          case '12':
            # code...
          return "Diciembre";
            break;



          default:
            # code...
            break;
        }
   }

 /**********************************************************************************************************************************************************************************************/

public function cargar_reporte_venta()
  {    $resp=array();
         $data_token = json_decode($this->consultar_token(),true);

        $response=array();

    $post=file_get_contents("php://input"); 
        $params=json_decode($post, true);
     $datos=array();
    $response=array();

    $documento="";
    if((int)$params["tipo"]==2)
    {
           $documento=" and venta_estado_pagado = 1";
    }

     if((int)$params["tipo"]==3)
    {
           $documento=" and  venta_estado_pagado = 2";
    }
  
 $sql="SELECT
  venta.venta_num_serie AS 'serie',
  venta.venta_num_documento AS 'documento',
  DATE_FORMAT( venta.venta_fecha_pago, '%d/%m/%Y' ) AS 'fecha',
  TIME( venta.venta_fecha_pago ) AS 'hora',
IF
  ( venta_estado_pagado = 1, venta.venta_nombre_descripcion, 'Cliente anulado' ) AS 'cliente',
  IF ( venta_estado_pagado = 1, venta.venta_documento_descripcion, '00000000' ) AS 'nro_documento',
IF
  ( venta_estado_pagado = 1, ROUND( venta.venta_monto, 2 ), 0 ) AS 'monto',
IF
  ( ventas_idtipodocumento = 1, 'FACTURA ELECTRÓNICA', IF ( ventas_idtipodocumento = 2, 'BOLETA ELECTRÓNICA', 'TICKET' ) ) AS 'codigo_documento',
  venta.venta_idventas ,
 IF
  (  venta.venta_eliminacion_descripcion is null,'',venta.venta_eliminacion_descripcion) as 'motivo_eliminacion',
    formapago.for_descripcion as 'formapago',
  CONCAT(empleados.empleado_nombres,' ',empleados.empleado_apellidos) as 'nombre'
FROM
  venta
  LEFT JOIN clientes ON venta.venta_codigocliente = clientes.cliente_id
  INNER JOIN empleados ON empleados.empleado_id = venta.venta_id_cajero 
    LEFT JOIN movimiento on movimiento.mov_id=venta.venta_idmovimiento
  LEFT JOIN formapago on formapago.for_id=movimiento.mov_formapago
WHERE
  venta.venta_estado IN ( 2, 0 ) 
  AND date( venta.venta_fecha_pago ) BETWEEN '".$params["fecha_inicio"]."' and '".$params["fecha_fin"]."'
  AND venta.ventas_idtipodocumento != 0  
   ". $documento."
  order by venta_fecha_pago desc";
//echo $sql;
$response=$this->db->query($sql)->result_array();


    
    echo json_encode($response); 
  }

public function traer_personal()
  {
    $data1="";
    if(isset($_GET["search"])){
           $data1=$_GET["search"];
    }
    $data=$this->Mantenimiento_m->consulta3("select * from empleados where empleado_nombre_completo like '%".$data1."%' and estado=1 and empresa_sede=".$_COOKIE["id_sede"]." limit 60");
    $datos=array();
    foreach ($data as $key => $value) {
                $datos["results"][$key]["id"]=$value["empleado_id"];  
                $datos["results"][$key]["text"]=$value["empleado_nombre_completo"];        

    }
    echo json_encode($datos);
  }
}