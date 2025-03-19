<?php  
$ver="";
if($data["datos_usuario"][0]["empleado_foto_perfil"]==""){
	$ver="icono_perfil.png";
}else{
	$ver=$data["datos_usuario"][0]["empleado_foto_perfil"];
}?>
<!DOCTYPE html>
<html lang="es">


<!-- Mirrored from html-templates.multipurposethemes.com/bootstrap-4/admin/unique/02/unique-admin/music-dashboard/pages/samplepage/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 02 Apr 2019 15:18:10 GMT -->
<head>
	  <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16" href="<?php echo $empresa['empresa_icono'];?>">
	    <link rel="stylesheet" href="<?php echo base_url()?>public/font-awesome.min.css">
	    <link rel="stylesheet" href="<?php echo base_url()?>public/materialdesignicons.min.css">	

	    <title>Sistema Restaurante</title>
		<?php include("Layout/css.php"); ?>
	</head>
  <script type="text/javascript">
    var base_url = "<?php echo base_url(); ?>";
</script>
<body id="principal" class="skin-red sidebar-mini fixed sidebar-mini-expand-feature">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="<?php echo base_url();?>" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
	  <b class="logo-mini">
		 <!-- <span class="light-logo"><img src="<?php echo base_url();?>public/images/logo-light.png" alt="logo"></span>
		  <span class="dark-logo"><img src="<?php echo base_url();?>public/images/logo-dark.png" alt="logo"></span>-->
	  </b>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">
		 <!-- <img src="<?php echo base_url();?>public/images/logo-light-text.png" alt="logo" class="light-logo">
	  	  <img src="<?php echo base_url();?>public/images/logo-dark-text.png" alt="logo" class="dark-logo">-->
	  </span>
    </a>
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" style="background-color: <?php echo $empresa["empresa_color"]; ?> !important;">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
		  
			
		  
          <!-- Messages -->
        

          <!-- Tasks -->
  
		  <!-- User Account -->
       <li >
            <a href="<?php echo base_url();?>Venta_mesa"  title="Registrar Venta" class="dropdown-toggle" >
              <i class="mdi mdi-cart-outline"></i>
            </a>
          
          </li>
      <li >
            <a href="<?php echo base_url();?>Mostrador_nuevo" title="Delivery" target="_blank" class="dropdown-toggle" >
              <i class="mdi mdi-motorbike"></i>
            </a>
          
          </li>
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<?php echo base_url();?>public/imagen-default.png" class="user-image rounded-circle" alt="User Image">
            </a>
            <ul class="dropdown-menu scale-up">
              <!-- User image -->
              <li class="user-header">
                <img src="<?php echo base_url();?>public/imagen-default.png" class="float-left rounded-circle" alt="User Image">

                <p>
                  <?php echo $data["datos_usuario"][0]["empleado_nombres"]; ?>
                  <small class="mb-5"><?php echo $data["datos_usuario"][0]["empleado_email"]; ?></small>

                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row no-gutters">

				<div role="separator" class="divider col-12"></div>
				  <div class="col-12 text-left">
                    <a href="<?php echo base_url();?>LoginController/cerrar_session"><i class="fa fa-power-off"></i> Cerrar Sesión</a>
                  </div>
                    <?php if ($_COOKIE["id_perfil"] == 12 || $_COOKIE["id_perfil"] == 8) { ?>
                        <div class="col-12 text-left">
                            <a href="<?php echo base_url();?>Usuario_e"><i class="fa fa-window-restore"></i> Usuario Eliminar</a>
                        </div>
                    <?php } ?>
                </div>
                <!-- /.row -->
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
         <!-- <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-cog fa-spin"></i></a>
          </li>-->
        </ul>
      </div>
    </nav>
  </header>

  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
		 <div class="ulogo">
			 <a href="<?php echo base_url();?>">
			  <!-- logo for regular state and mobile devices -->
			  <span>
       
        <b> <?php echo $empresa["empresa_nombre_comercial"]; ?>   </b>
        </span>
			</a>
		</div>
        <div class="image">
          <img src="<?php echo base_url();?>public/imagen-default.png" class="rounded-circle" alt="User Image">
        </div>
        <div class="info">
          <p><?php echo $data["datos_usuario"][0]["empleado_nombres"]; ?></p>
          <p><?php  echo $_COOKIE ["perfil"]; ?></p>
			<a href="#" class="link" data-toggle="tooltip" title="" data-original-title="Settings"><i class="ion ion-gear-b"></i></a>
            <a href="#" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ion ion-android-mail"></i></a>
            <a href="#" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ion ion-power"></i></a>
        </div>
      </div>
      
      <!-- sidebar menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="nav-devider"></li>
        <li class="header nav-small-cap">Menú</li>
        <?php foreach ($modulos as $value) {  
          if(count($value["lista"])>0){ ?>
        <li class="treeview">
          <a href="#">
            <i class="<?php echo strtolower($value["modulo_icono"])?>"></i> <span><?php echo ($value["modulo_nombre"])?></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <?php foreach ($value["lista"] as $val) { ?>
            <li><a onclick="mostrar_clase(<?php echo $value['modulo_id']; ?>,<?php echo $val['modulo_id']; ?>)" id="hijo_id_<?php echo $val['modulo_id']?>" href="<?php echo base_url().$val["modulo_url"]?>"><?php echo $val["modulo_nombre"]?></a></li>
            <?php }     ?>  
          </ul>
        </li> 
        <?php }else{ 

          }}?>

        
      </ul>
    </section>
  </aside>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php if(isset($data["titulo_descripcion"])){echo $data["titulo_descripcion"];}else{echo "Panel de Control";} ?>
      </h1>
      <!--<ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="breadcrumb-item"><a href="#">Examples</a></li>
        <li class="breadcrumb-item active">Blank page</li>
      </ol>-->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box" id="cuerpo_pagina_vista">
       <!-- <div class="box-header with-border" >
          <h3 class="box-title"><?php// if(isset($data["titulo_descripcion"])){echo $data["titulo_descripcion"];}else{echo "Panel de Control";} ?></h3>
        </div>-->
        

 
   
 
