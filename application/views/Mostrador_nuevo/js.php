 
  <script src="<?php echo base_url();?>public/assets/vendor_components/popper/dist/popper.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>public1/lib/bower_components/echarts/dist/echarts-en.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/plugins/moment/moment.js"></script>
  <script src="<?php echo base_url();?>public/assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/vendor_components/fastclick/lib/fastclick.js"></script>
  <script src="<?php echo base_url();?>public/js/template.js"></script>
  <script src="<?php echo base_url();?>public/js/demo.js"></script>
  <script src="<?php echo base_url();?>public/assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
  <script type="text/javascript" src="<?php echo base_url()?>public/js/jquery.validate.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/plugins/datatables/datatables.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/plugins/toast-master/js/jquery.toast.js"></script>
  <script src="<?php echo base_url(); ?>public/switchery/dist/switchery.min.js"></script>
  <script src="<?php echo base_url(); ?>public/js/jquery-confirm.min.js"></script>
  <script src="<?php  echo base_url() ?>public1/js/jquery.bootstrap-touchspin.min.js"></script>
  <link rel="stylesheet" href="<?php echo base_url(); ?>public/css/jquery-confirm.min.css">
  <script src="<?php echo base_url();?>public/assets/plugins/sweetalert/sweetalert.min.js"></script>
  <script src="<?php echo base_url();?>public/assets/plugins/toast-master/js/jquery.toast.js"></script>

  <script src="<?php echo base_url();?>public/js/toastr.js"></script>




  <script type="text/javascript">




   $(function() {
    $('#myTable').DataTable();
    $('#example1').DataTable();
    //$('#example1').editableTableWidget().numericInputExample().find('td:first').focus();
        //$('#mdate').bootstrapMaterialDatePicker({ weekStart: 0, time: false });
        //$('#timepicker').bootstrapMaterialDatePicker({ format: 'HH:mm', time: true, date: false });
        ///$('#date-format').bootstrapMaterialDatePicker({ format: 'dddd DD MMMM YYYY - HH:mm' });
        //$('.buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel').addClass('btn btn-primary mr-1');
      });
   function sololetras(e){
    key= e.keyCode || e.which;
    teclado=String.fromCharCode(key).toLowerCase();
    letras=" abcdefghijklmnñopqrstuvwxyz";
    especiales="8-37-38-46-164";
    teclado_especial=false;
    for(var i in especiales){
      if(key==especiales[i]){
        teclado_especial= true;
        break;
      }
    }
    if (letras.indexOf(teclado)==-1 && !teclado_especial){

      return false;

    }
  }


  function solonumeros(e){
    key=e.keyCode || e.which;
    teclado=String.fromCharCode(key);
    numeros=" 0123456789";
    especiales="8-37-38-46";
    teclado_especial=false;

    for(var i in especiales){
      if(key==especiales[i]){
        teclado_especial=true;
      }
    }
    if(numeros.indexOf(teclado)==-1 && !teclado_especial){
      return false;
    }
  }
  function alertasuccess(mensaje,titulo){
   $.toast({
    heading: mensaje,
    text: titulo,
    position: 'bottom-right',
    loaderBg:'#ff6849',
    icon: 'success',
    hideAfter: 3500,
    stack: 6
  });
   return false;
 }

 function alertainfo(mensaje,titulo){
   $.toast({
    heading: mensaje,
    text: titulo,
    position: 'bottom-right',
    loaderBg:'#ff6849',
    icon: 'error',
    hideAfter: 3500

  });

 }
 function jalar_sunat(){
  $("#sunat").text("procesando...");
  $.post(base_url+"proveedor/ver_ruc",{"ruc":$("#ruc").val()},function(data){
    if(data["success"]=="1"){
      $("#razon_social").val(data["result"]["RazonSocial"]);
      $("#direccion").val(data["result"]["Direccion"]);
      $("#telefono").val(data["result"]["Telefono"]);
      $("#habido").val(data["result"]["Condicion"]);

    }else{
     alert("error");
   }
   $("#sunat").text("sunat");
 },"json");
}

function eliminar(nombre_tabla,id){
 r=confirm("¿Estas seguro que desea eliminar?");
 if(r){
   $.post(base_url+nombre_tabla+"/eliminar/"+id,{},function(data){
    //  swal("Se Elimino correctamente", "exitoso ", "success");
    location.reload(true);
  });
 }

 return false;

}

function reload_url(url){
  $("#cuerpo_pagina_vista").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
 //  cargar_pagina(1);
 $.get(base_url+url,function(data){
        //cargar_pagina(2);
        $("#cuerpo_pagina_vista").empty().html(data);
      });

}
function reload_urlp(url){
  $("#cuerpo_pagina_vista").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
 //  cargar_pagina(1);
 $.post(base_url+url,function(data){
  $("#borrar1").remove();
  $("#borrar2").remove();
  $("#borrar3").remove();
  $("#borrar4").remove();
  $("#borrar5").remove();
  $("#borrar6").remove();
  $("#principal").empty().html(data);

});

}
function generar_notificacion(titulo,descripcion,icono,color_carga){
  $.toast().reset('all');
  $("#cuerposirena").removeAttr('class');
  $.toast({
    heading: titulo,
    text: descripcion,
    position: 'bottom-right',
    loaderBg: color_carga,
    icon: icono,
    hideAfter: 3500
  });

}
  function validarcaja(){
    $.get(base_url+"sesion_caja/validarcaja",function(data){
      if (data["html"]!="1") {
        $("#mensaje").text(data["html"]);
        $("#botonestado").html(data["html1"]);
        $("#validarcaja").modal({backdrop: 'static',show: true});
      }
    },"json");
  }

</script>