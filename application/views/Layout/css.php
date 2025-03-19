<link id="borrar1" href="<?php echo base_url()?>public/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link id="borrar2" rel="stylesheet" href="<?php echo base_url() ?>public/assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">
        <link id="borrar3" rel="stylesheet" href="<?php echo base_url() ?>public/css/bootstrap-extend.css">
        <link id="borrar4" rel="stylesheet" href="<?php echo base_url() ?>public/css/master_style.css">
        <link id="borrar5" rel="stylesheet" href="<?php echo base_url() ?>public/css/skins/_all-skins.css">
        <link id="" href="<?php echo base_url()?>public/assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link id="" href="<?php echo base_url()?>public/css/pages/form-icheck.css" rel="stylesheet">
        <link id="" href="<?php echo base_url()?>public/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <link id="borrar6" href="<?php echo base_url()?>public/css/style.css" rel="stylesheet">
        <link id="" href="<?php echo base_url()?>public/assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
        <link id="" href="<?php echo base_url()?>public/assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" type="text/css"> 
        <link rel="stylesheet" href="<?php echo base_url(); ?>public1/lib/bower_components/bootstrap-select/dist/css/bootstrap-select.min.css">


        <script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>


        <style type="text/css">
            .treeview-menu>li>a {
    display: block;
    font-size: 15px;
    line-height: 25px;
    border-style: solid;
    font-height: 5px;
    border-width: 1px;
    padding: 5px 5px 5px 20px;
    border-color: #212121;

}


.skin-red .sidebar-menu > li > a {
    border-left: 3px solid #242a33;
}


.skin-red .sidebar a {
    color: #e6e6e6;
}

.sidebar-menu li>a {
    position: relative;
    font-weight: 300;
    font-size: 15px;
}


<style>
.skin-red .sidebar-menu .treeview-menu > li > a {
    color: #dcdcdc;
}

.skin-red .sidebar-menu > li > .treeview-menu {
    margin: 0 0px;
    background: #171717;
}
        </style>

  <div class="modal fade in" id="validarcaja" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="" align="center">
                <br>
                <h4 class="">Atención Usuario !</h4>
                <h5>
                    <p id="mensaje"></p> <b id="fechacerrar"></b>
                </h5>
                <?php if ($_COOKIE["usuario_perfil"]==5) { ?>
                <div id="botonestado">

                </div>
                <?php }else{ ?>
                <a href="<?php echo base_url()?>control">
                <button type="button" class="btn btn-danger" >
                Regresar
                </button>

                </a>
                <?php } ?>
            </div>
                   <br>
        </div>
    </div>
</div>
<style type="text/css">
#formulario_caja{
        width: 460px;
}
</style>