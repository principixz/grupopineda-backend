
<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once "BaseController.php";
require_once("src/autoload.php");
class almacen extends BaseController {

 public function __construct() {
        parent::__construct();
       	
      
    }

	public function index()
	{
	 // echo  $this->input->post("usuario")." ". $this->input->post("clave");
  
     $data=array();
      $data["titulo_descripcion"]="Lista de Almacenes";
      $data["tabla"]=$this->Mantenimiento_m->consulta3("select * from almacenes where almacen_estado=1 and id_sede=".$_COOKIE["id_sede"]);
	  $this->vista("Almacen/index",$data);
	}

	public function nuevo()
	{

	  $data=array();
      $data["titulo_descripcion"]="Nuevo Almacen";
     // $data["tabla"]=$this->Mantenimiento_m->consulta3("select * from proveedores where proveedor_estado=1 and empresa_ruc=".$_SESSION["ruc_empresa"]);
	  $this->vista("Almacen/nuevo",$data);
	}

	public function guardar()
  {

    $data=array(
      "almacen_descripcion"=>$this->input->post("descripcion"),
      "almacen_direccion"=>$this->input->post("direccion"),
      "id_sede"=>$_COOKIE["id_sede"]
      


    );
    if($this->input->post("id")=="")
    {
         $estado=$this->db->insert('almacenes', $data);
         $idalmacen=$this->db->insert_id();
         $insumos=$this->Mantenimiento_m->consulta3("select * from insumo where insumo_estado=1 and id_sede=".$_COOKIE["id_sede"]);
             foreach ($insumos as $key => $insumo) {
              $dat=array(
                     "id_insumo"=>$insumo["insumo_id"],
                     "id_almacen"=>$idalmacen,
                     "detalle_stock"=>0,
                     "detalle_stock_temporal"=>0
              );

              $this->Mantenimiento_m->insertar("detalle_insumo_almacen",$dat);
             }
         
         $productos=$this->Mantenimiento_m->consulta3("select * from producto where producto_estado=1 and producto_id_tipoproducto>1 and id_sede=".$_COOKIE["id_sede"]);
                     foreach ($productos as $key => $producto) {
              $dat=array(
                     "detalle_producto"=>$producto["producto_id"],
                     "detalle_almacen"=>$idalmacen,
                     "detalle_stock"=>0,
                     "detalle_stock_temporal"=>0
              );

              $this->Mantenimiento_m->insertar("detalle_producto_almacen",$dat);
             }


     


    }
    else
    {
                   $this->db->where('almacen_id',$this->input->post("id"));
                $estado=$this->db->update('almacenes', $data);
    }
     header('Location: '.base_url()."almacen");
  }


	public function editar($id)
	{
		  $data=array();
      $data["titulo_descripcion"]="Editar Proveedor";
      $data["id"]=$id;
     // $data["tabla"]=$this->Mantenimiento_m->consulta3("select * from proveedores where proveedor_estado=1 and empresa_ruc=".$_SESSION["ruc_empresa"]);
	  $this->vista("Almacen/nuevo",$data);

	}

  public function traer_uno()
  {
  	$dat=$this->Mantenimiento_m->consulta3("select * from almacenes where almacen_id=".$this->input->post("id"));
		echo json_encode($dat);
  }
   
 public function ver_ruc()
 {

  
  $cliente = new \Sunat\Sunat();
  $data=   $cliente->search( $this->input->post("ruc") );
  echo json_encode($data);


 }
 
	public function eliminar($id)
	{
      $this->Mantenimiento_m->consulta1("update almacenes set almacen_estado=0 where almacen_id=".$id);
	} 


	public function verificar_almacen()
	{
        
        $json=array();

       $sede=$this->Mantenimiento_m->consulta3("select * from sede where id_sede=".$_COOKIE["id_sede"]);
       if((int)$sede[0]["id_tipo_negocio"]==1)
       {
           $data=$this->Mantenimiento_m->consulta3("select * from almacenes where almacen_estado=1 and id_sede=".$_COOKIE["id_sede"]);
           if(count($data)>=2)
           {
            $json["estado"]=0;
           }else
           {
                 $json["estado"]=1;
           }
       }
       else
       {
             $json["estado"]=0;
       }

    echo json_encode($json);exit();

	}
	

}
?>