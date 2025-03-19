<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require_once "BaseController.php";



class LoginController extends CI_Controller {



  public function __construct() {
    parent::__construct();
    date_default_timezone_set("America/Lima");
    $this->load->model("Mantenimiento_m");
    session_start();
  }

  public function cerrar_session(){
    session_destroy();
    $this->borrarCookie();
    header('Location: '.base_url());
  }

  public function cambiar_sede(){
    $this->setCookie("id_sede","0");
    $this->setCookie("id_contabilidad",0);
    header('Location: '.base_url()."tienda"); 
  }

  


  public function borrarCookie(){ 
    setcookie ('config_usuario', '', time()-604800,'/');
    setcookie ('id_contabilidad', '', time()-604800,'/');
    setcookie ('config_clave', '', time()-604800,'/');
    setcookie ('usuario_nombre', '', time()-604800,'/');
    setcookie ('usuario_perfil', '', time()-604800,'/');
    setcookie ('imagen', '', time()-604800,'/');
    setcookie ('perfil', '', time()-604800,'/');
    setcookie ('id_perfil', '', time()-604800,'/');
    setcookie ('empresa_sede', '', time()-604800,'/');
    setcookie ('ruc_empresa', '', time()-604800,'/');
    setcookie ('id_sede', '', time()-604800,'/');
    setcookie ('id_sede_c', '', time()-604800,'/');
    setcookie ('id_contabilidad', '', time()-604800,'/');
    setcookie ('empresa_ruc_c', '', time()-604800,'/');
    setcookie ('usuario_id', '', time()-604800,'/'); 
    unset ($_COOKIE ["config_usuario"]);
    unset ($_COOKIE ["config_clave"]);
    unset ($_COOKIE ["usuario_nombre"]);
    unset ($_COOKIE ["usuario_perfil"]);
    unset ($_COOKIE ["imagen"]);
    unset ($_COOKIE ["perfil"]);
    unset ($_COOKIE ["id_perfil"]);
    unset ($_COOKIE ["empresa_sede"]);
    unset ($_COOKIE ["ruc_empresa"]);
    unset ($_COOKIE ["id_sede"]);
    unset ($_COOKIE ["id_sede_c"]);
    unset ($_COOKIE["id_contabilidad"]);
    unset ($_COOKIE["empresa_ruc_c"]);
    unset ($_COOKIE["usuario_id"]);
    unset ($_COOKIE["id_contabilidad"]); 
  }

  public function index(){
    if(!isset($_COOKIE["config_usuario"])|| $_COOKIE["config_usuario"]==""){
      $empresa=$this->db->query("select * from empresa ")->row_array();
      $this->load->view('Login',compact('empresa'));
    }else{
      if ($_COOKIE["id_sede"]!=""){
        $datos=$this->Mantenimiento_m->consulta3("select * from perfiles where perfil_id=".$_COOKIE["id_perfil"]);
        $dat=$datos[0]["perfil_url"];
 
        header('Location: '.base_url().$dat);
      }else{
      header('Location: '.base_url()."tienda");
      }
    }
  }

    public function Iniciar(){
      //1 : CORRECTO INGRESA
      //0 : NO EXISTE
      //2 : INACTIVO
      $ruc_empresa = $this->Mantenimiento_m->consulta2("SELECT empresa_ruc FROM empresa LIMIT 1;");
      $login = $this->Mantenimiento_m->consulta2("SELECT empleados.empleado_id,empleados.empleado_nombres,empleados.empleado_apellidos,empleados.perfil_id,empleados.empleado_foto_perfil,
      perfiles.perfil_descripcion,empleados.empresa_sede,empleados.estado FROM empleados
      INNER JOIN perfiles ON empleados.perfil_id = perfiles.perfil_id
      INNER JOIN sede ON empleados.empresa_sede = sede.id_sede  where empleados.estado=1 and empleado_usuario='".$this->input->post("usuario")."' and empleado_clave='".$this->input->post("clave")."' and sede.sede_estado= 1");

    if ($login) {
      if ($login->estado == 1) {
       $this->setCookie("config_usuario",$this->input->post("usuario"));
       $this->setCookie("config_clave",$this->input->post("clave"));
       $this->setCookie("usuario_id",$login->empleado_id);
       $this->setCookie("usuario_nombre",$login->empleado_nombres.' '.$login->empleado_apellidos);
       $this->setCookie("usuario_perfil",$login->perfil_id);
       $this->setCookie("imagen",$login->empleado_foto_perfil);
       $this->setCookie("perfil",$login->perfil_descripcion);
       $this->setCookie("id_perfil",$login->perfil_id); 
       $this->setCookie("id_sede",$login->empresa_sede);
       $this->setCookie("ruc_empresa",$ruc_empresa->empresa_ruc);
       echo 1;
      }else{
        echo  2;
      }
    }else{  
      echo  0;
    }
  }


  public function setCookie($nombre,$valor){
    setcookie($nombre,$valor,time()+30*24*60*60,'/');
  }
}

