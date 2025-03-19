<style type="text/css">
  .configwrapper {
    background: #fff;
  }
  
  .mt-40{
    margin-top: 40px !important;
    margin-left: 24px;
  }
  :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }
  .nav-tabs > li {
    margin-right: 5px;
  }
  .nav-tabs>li {
    float: left;
    margin-bottom: -1px;
  }

  .nav>li {
    position: relative;
    display: block;
  }
  .custom-tab-1 .nav-tabs > li.active > a {
    border-bottom: 3px solid #0fc5bb;
  }
  .custom-tab-1 .nav-tabs > li > a {
    background: transparent !important;
    border: none;
  }
  .nav-tabs > li:first-child > a {
    border-top-left-radius: 10px;
  }
  .nav-tabs > li.active > a, .nav-tabs > li.open > a {
    background: #fff;
    color: #212121;
    border-color: transparent;
  }
  .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
    border: none;
  }
  .nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
  }
  .nav-tabs > li > a {
    background: #dedede;
    border: none;
    padding: 10px 20px;
    color: #878787;
    margin: 0;
    border-radius: 0;
    text-transform: capitalize;
    -webkit-transition: 0.2s ease;
    -moz-transition: 0.2s ease;
    transition: 0.2s ease;
  }
  .nav-tabs>li>a {
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
  }
  .nav>li>a {
    position: relative;
    display: block;
    padding: 10px 15px;
  }

  a {
    text-decoration: none;
    color: #212121;
  }
  h2 {
    font-size: 36px;
    line-height: 44px;
  }
</style> 
<div class="configwrapper configwrapper-content ng-scope">
  <div class="row animated fadeInRight m-l-none m-r-none">
    <div class="tab-struct custom-tab-1 mt-40">
      <ul role="tablist" class="nav nav-tabs" id="myTabs_7">
        <li class="active" class="" role="presentation">
          <a aria-expanded="false" data-toggle="tab" role="tab" id="home_tab_7" href="#home_7">DATOS EMPRESA</a>
        </li>
        <li role="presentation" >
          <a data-toggle="tab" id="profile_tab_7" role="tab" href="#profile_7" aria-expanded="true">COMPROBANTES</a>
        </li>
      </ul>
      <div class="tab-content" id="myTabContent_7">
        <div id="home_7" style="opacity: 1 !important;"  class="tab-pane fade active in" role="tabpanel">
          <br>
          <div class="container">
            <form id="formulario_empresa">
            <div class="col-md-12">
              <div class="col-md-12">
                <div class="row">

                  <div class="col-md-4">
                    <div class="form-group">

                      <label>Razon Social</label>
                      <input type="text" class="form-control" autocomplete="off" name="razon_social" id="razon_social">
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <label>Direccion</label>
                      <input type="text" class="form-control" autocomplete="off" name="empresa_direccion" id="empresa_direccion">
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="form-group">
                     <label>Telefono</label>
                     <input type="text" class="form-control" autocomplete="off" name="empresa_telefono" id="empresa_telefono">
                   </div>
                 </div>


                 <div class="col-md-4">
                  <div class="form-group">
                    <label>Correo</label>
                    <input type="text" class="form-control" autocomplete="off" name="empresa_correo" id="empresa_correo">
                  </div>
                </div>
                

                <div class="col-md-4" style="display: none;">
                  <div class="form-group">
                    <label>Abreviatura(Max. 12)</label>
                    <input type="text" class="form-control" autocomplete="off" name="empresa_abreviatura" id="empresa_abreviatura">
                  </div>
                </div>


                <div class="col-md-4" >
                  <div class="form-group">
                   <label>Nombre Comercial</label>
                   <input type="text" class="form-control" autocomplete="off" name="empresa_nombre_comercial" id="empresa_nombre_comercial">
                 </div>
               </div>
               <div class="col-md-4">
                <div class="form-group">
                  <label>Token de facturación</label>
                  <input type="text" class="form-control" autocomplete="off" name="empresa_token_facturacion" id="empresa_token_facturacion"> 
                </div>
              </div>

               <div class="col-md-4">
                <div class="form-group">
                  <label>Icono </label>
                  <input type="text" class="form-control" autocomplete="off" name="empresa_icono" id="empresa_icono"> 
                </div>
              </div>
               <div class="col-md-4">
                <div class="form-group">
                  <label>Fondo </label>
                  <input type="text" class="form-control" autocomplete="off" name="empresa_fondo" id="empresa_fondo"> 
                </div>
              </div>

              <div class="col-md-4">
                <div class="form-group">
                  <label>Color</label>
                  <br>
                  <input type="color" id="empresa_color" name="empresa_color" value="">
                </div>
              </div>
           

  
           

           </div>  

           

           <center>
            <button class="btn btn-success" id="guardar_informacion" type="button">Guardar</button>
          </center> 
        </div>                      
      </div>

    </form>
    </div>
  </div>
  <div id="profile_7" class="tab-pane fade" role="tabpanel">
    <div ui-view="" class="ng-scope">
      <form id="correlati" class="form-horizontal ng-pristine ng-valid ng-scope" method="post" role="form">
        <div class="hr-line-dashed col-lg-12 col-md-12 col-sm-12 col-xs-12 black-bg"></div>
        <div class="row">
          <div class="col-md-6"  style="">
            <div class="ibox float-e-margins">
              <div class="ibox-content padding-cero">
                <h2>Correlativos</h2>
                Permite Habilitar/deshabilitar y cambiar el número de correlativos de los vouchers sólo para la impresora de tipo ticketera.
              </div>
            </div>
          </div>
          <div class="col-md-6"  style="top: 40px;">
            <div class="ibox float-e-margins">
              <div class="ibox-content bg-white correlatives">
                <div class="table-responsive">

                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0rem">
                    <div class="pull-left col-lg-3 col-md-3 col-sm-4 col-xs-6 ng-scope" ng-if="!state_new" style="padding-left: 0rem">
                      <button type="button" class="btn btn-success ng-hide" id="btn_new" onclick="set()" ng-show="vouchersadd.length > 0"><i class="fa fa-plus"></i>
                        Nueva Serie
                      </button>
                    </div>
                  </div> 
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6"  style="">

          </div>
          <div class="col-md-6"  style="">
            <table class="table display product-overview mb-30" id=" ">
             <thead>
              <tr>
                <th width="30%">#</th>
                <th width="20%">Serie </th>
                <th width="20%">Correlativo</th>
                <th width="20%">Activar</th>  
                <th width="10%">Eliminar</th>
                <th width="10%">Vin/Des</th>  
              </tr>
            </thead>
            <?php if (!isset($data["estado"])){   
              $activadorx = 'disabled';
            }else{
             $activadorx = 'readonly';
           } ?> 
           <tbody id="cuerpo">
            <?php $contar = 1; ?>
            <?php foreach ($data["correlativos"] as $key => $value) {  ?> 
              <tr id="contenedor_comprobante<?php echo $value["id_documento"]; ?>" > 
                <td>
                  <select  id="tipodedocumento<?php echo $contar ?>" onchange="llamarvalidacion(<?php echo $contar ?>)" name="tipodedocumento[]" class="form-control" <?php echo  $activadorx  ?>>
                    <option value="<?php echo $value["id_tipodocumento"] ?>"><?php echo $value["tipodoc_descripcion"] ?></option>
                  </select>
                </td> 
                <td>
                  <input type="text" allow-only-numbers="" maxlength="4"  onkeyup="llamarvalidacion(<?php echo $contar ?>)" id="serie<?php echo $contar ?>" class="form-control ng-scope" name="series[]" ng-required="true"  value="<?php echo $value["doc_serie"] ?>"  ng-if="series.deleted_at == 0" required="required" <?php echo  $activadorx  ?>>
                </td> 
                <td>
                  <input type="text" allow-only-numbers=""  maxlength="6" id="correlative<?php echo $contar ?>" class="form-control ng-scope" name="correlatives[]"  ng-required="true" value="<?php echo $value["doc_correlativo"] ?>"  ng-if="series.deleted_at == 0" required="required" <?php echo  $activadorx  ?> >
                </td> 

                <?php
		$estado = '';
		$activador = '';
		 foreach ($data["chek"] as $key => $valores) {
                 if ($value["id_documento"] == $valores["detalle_id_documento"]) {
                    $estado = $valores["estado"];
                    $activador = 'onclick="return false;"';
                    break;
                  }else{
                    $estado = '';
                    $activador = '';
                  }
                } ?>
                <input  type="hidden" value="<?php echo $value["id_documento"] ?>" id="iddocumento"  name="iddocumento[]">  
                <td>
                  <div class="input-group" >
                    <ul class="icheck-list">
                      <li>
                        <input type="checkbox" class="check" name="voucherid[]"  id="doc<?php echo $contar ?>" onchange="validacion(<?php echo $contar ?>);" value="<?php echo $value["id_documento"] ?>" <?php echo  $activador.' '.$estado  ?> >
                        <label for="doc<?php echo $contar ?>"></label>
                      </li>
                    </ul>
                  </div> 

                </td>


                <td >
                 <a href="#" onclick="eliminar_comprobante(<?php echo $value["id_documento"] ?>)">
                   <i class="fa fa-trash"></i>
                 </a>
               </td>
               <td >
                <a href="#" onclick="desvincular_codigo(<?php echo $value["id_documento"].','.$contar ?>)">
                 <i class="fa fa-link"></i>
               </a>
             </td>
           </tr> 
           <?php  $contar++; } ?> 
         </tbody>


       </table>

       <input type="hidden" value="<?php echo $contar ?>" id="contador"  name="contador">
     </div>
   </div>
   <div class="ibox-content bg-white no_correlatives" style="display:none;">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-left: 0rem">
      <h1 style="text-align: center;color: #A30000;">Numeración para emisión de comprobantes
      deshabilitadas</h1>
    </div>
  </div>
  <div class="hr-line-dashed col-lg-12 col-md-12 col-sm-12 col-xs-12 black-bg ng-scope" ng-if="series_document.length > 0" style=""></div><!-- end ngIf: series_document.length > 0 -->

  <?php if (!isset($data["estado"])){ ?>  
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 20px">
      <div class="pull-right">
        <button id="botonguardar" type="button" class="btn btn-info" onclick="edit()"><i class="fa fa-edit"></i>
          <sp>Guardar</sp>
        </button>
      </div>
    </div>
  <?php }else{ ?>   
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 20px">
      <div class="pull-right">
        <button type="button" class="btn btn-info" onclick="actualizar()"><i class="fa fa-edit"></i>
          <sp>Actualizar</sp>
        </button>
      </div>
    </div>
  <?php } ?>
</form>
</div>
</div>

</div>
</div>
</div>
</div>

<script type="text/javascript">
  function eliminar_comprobante(id) {
    Swal.fire({
      title: "¿ESTAS SEGURO QUE DESEA ELIMINAR?",
      text: "UNA VEZ ELIMINADA EL COMPROBANTE NO SE PODRA RECUPERAR",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si,deseo eliminarlo!',
      cancelButtonText: "No, deseo hacerlo",
    }).then((result) => {
      if (result.value) {
       $.post(base_url+"Registro_comprobante/eliminar_comprobante",{"id":id},function(data){

        if(data.estado=="1"){
          Swal.fire("ELIMINADO",data.mensaje, "success");
          $("#contenedor_comprobante"+id).remove();
        }else{
          Swal.fire("ERROR", data.mensaje, "error");
        }
      },"json");
     }
   })
  }
  function desvincular_codigo(id,con){
    Swal.fire({
      title: "¿ESTAS SEGURO QUE REALIZAR EL PROCESO?",
      text: "UNA VEZ ELIMINADO YA NO APARECERÁ EN EL PROCESO DE COMPRAS",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si,deseo hacerlo!',
      cancelButtonText: "No, deseo hacerlo",
    }).then((result) => {
      if (result.value) {
       $.post(base_url+"Registro_comprobante/vincular_desvincular",{"id":id},function(data){

        if(data.estado=="1"){
          Swal.fire("ELIMINADO",data.mensaje, "success"); 
          $("#tipodedocumento"+con).prop( "disabled", false );
          $("#serie"+con).prop( "disabled", false );
          $("#correlative"+con).prop( "disabled", false );
          $("#doc"+con).prop( "disabled", false );
          $("#doc"+con).prop('checked', false);
        }else{
          $("#tipodedocumento"+con).prop( "disabled", true  );
          $("#serie"+con).prop( "disabled", true  );
          $("#correlative"+con).prop( "disabled", true  );
          $("#doc"+con).prop( "disabled", false );
          $("#doc"+con).prop('checked', true);
          Swal.fire("ERROR", data.mensaje, "error");
        }
      },"json");
     }
   })


  }


  $("#guardar_parametro").click(function(){
    $.post(base_url+"Registro_comprobante/guardar_parametro",$("#formulario_parametro").serialize(),function(data){
     if(parseInt(data)==1){
      generar_notificacion("Se guardo correctamente","Se inserto correctamente los parametros","success","");
    }else{
     generar_notificacion("ERROR","se genero errores","error","");
   }
 });
  });

  $("#guardarrecontable").click(function(){
    count = $('#cuentasparametro option:selected').length;
    if (count == 0) {generar_notificacion("ERROR","Debe Seleccionar al menos una cuenta","error",""); return 0;}
    if ($("#tipoparametro").val() != '' && $("#parametroselect").val() != '') {
      $.post(base_url+"Registro_comprobante/guardarrecontable",$("#formulario_confrecontable").serialize(),function(data){
        if(parseInt(data)==1){
          generar_notificacion("Se guardo correctamente","Se inserto correctamente los parametros","success","");
        }else{
         generar_notificacion("ERROR","se genero errores","error","");
       }
     },'json');
    }

  });
  $("#configconta_tab_7").click(function(){
   $.post(base_url+"Registro_comprobante/traercreditofiscal",function(data){
    if (data == 1) {
      document.getElementById("creditofiscal").checked = true;
    }
  },'json');
 });

  $("#guardarcreditofiscal").click(function(){
    $.post(base_url+"Registro_comprobante/guardarcreditofiscal",$("#formulario_creditof").serialize(),function(data){
      if(parseInt(data)==1){
        generar_notificacion("Se guardo correctamente","Se inserto correctamente los parametros","success","");
      }else{
       generar_notificacion("ERROR","se genero errores","error","");
     }
   },'json');
    

  });

  function traercuenta(valor,nombre){
    if (valor.length > 3) {
      $.post(base_url+"Calculos_auto/traercuenta",{"id" : valor},function(data){
        if (data["cuenta"].length == 0) {
          $("#nombre"+nombre).val('');return 0;
        }
        $("#nombre"+nombre).val(data["cuenta"][0]["plan_contable_analitica_descripcion"]);
      },'json');
    }else{
      $("#nombre"+nombre).val('');
    }
  }





  $(function(){ 





    if (typeof refreshIntervalId != "undefined"){
      clearInterval(refreshIntervalId);
    }

    $.post(base_url+"Registro_comprobante/datos_empresa",function(data){
     // alert(data[0]["empresa_razon_social"]);
      $("#razon_social").val(data[0]["empresa_razon_social"]);
      $("#empresa_direccion").val(data[0]["empresa_direccion"]);
      $("#empresa_telefono").val(data[0]["empresa_telefono"]);
      $("#empresa_correo").val(data[0]["empresa_correo"]);
      $("#empresa_abreviatura").val(data[0]["empresa_abreviatura"]);
      $("#empresa_nombre_comercial").val(data[0]["empresa_nombre_comercial"]);
      $("#empresa_token_facturacion").val(data[0]["empresa_token_facturacion"]);
      $("#empresa_icono").val(data[0]["empresa_icono"]);
      $("#empresa_fondo").val(data[0]["empresa_fondo"]);
      $("#empresa_color").val(data[0]["empresa_color"]);
      
      
      //empresa_color

  },"json");

  });



  $("#firma_electronica").change(function(){
    var formData= new FormData();
    formData.append('firma', $('input[name=firma_electronica]')[0].files[0]); 


    ruta="<?php echo base_url(); ?>Registro_comprobante/subir_firma";

    $.ajax({
      url: ruta,
      type: "POST",
      data:  formData,
      contentType: false,
      processData: false,
      success: function(datos)
      {
       if(parseFloat(datos)==1)
       {
        generar_notificacion('Se Subio Correctamente','Se sunio la firma Electronica Correctamente','success');  
      }
      else
      {
        alert("error");
      }



    }
  });
  });

  var totalcomprobantes = 0;
  var contar = $("#contador").val();


  function edit(){

    var datastring = $("#correlati").serialize();
    $.post(base_url+"Registro_comprobante/guardarseco",datastring,function(data){
      if (data == 1) {
       generar_notificacion('Se Actualizo Correctamente','Se ha ingresado correctamente los comprobantes','success');
       window.location.href = base_url+'Registro_comprobante'; 
     }else{
      generar_notificacion('Error al Actualizar','Consulte con su proveedor','danger'); 
    }
  },"json");
  }

  function actualizar(){

    var datastring = $("#correlati").serialize();
    $.post(base_url+"Registro_comprobante/comprobantesact",datastring,function(data){
      if (data == 1) {
       generar_notificacion('Se Actualizo Correctamente','Se ha ingresado correctamente los comprobantes','success'); 
     }else{
      generar_notificacion('Error al Actualizar','Consulte con su proveedor','danger'); 
    }

  },"json");
  }

  function set(){
    var html='';
    $.post(base_url+"Registro_comprobante/traercomprobantes",function(data){
      html+='<tr  >';
      html+='<th >';
      html+='<select id="tipodedocumento'+contar+'" onchange="llamarvalidacion('+contar+')" name="tipodedocumento[]" class="form-control">';
      html+=data["seleccionar"];
      html+='</select>';
      html+='</th>';
      html+='<td >';
      html+='<input type="text" allow-only-numbers="" maxlength="4" id="serie'+contar+'" onkeyup="llamarvalidacion('+contar+')" class="form-control ng-scope" name="series[]" ng-required="true" value=""  ng-if="series.deleted_at == 0" required="required">';
      html+='</td>';
      html+='<td >';
      html+='<input type="text" allow-only-numbers="" maxlength="6"  id="correlative'+contar+'" class="form-control ng-scope" name="correlatives[]" ng-required="true" value=""  ng-if="series.deleted_at == 0" required="required">';
      html+='</td>';
      html+='<td></td>';
      html+='<td></td>';
      html+='</tr>';
      contar++;
      $("#cuerpo").prepend(html);
    },"json");

  }

  function validacion(cont) { 
    variable = $("#doc"+cont).val();
    seleccion = $("#tipodedocumento"+cont).val();
    if( $("#doc"+cont).prop('checked') ) {
      $('select[name="tipodedocumento[]"]').map(function(n,i){
        id = ($(this).prop('id')).substr(15);
        idseleccion = $("#tipodedocumento"+id).val();
        vardoc = $("#doc"+id).val();
        if ( $("#doc"+id).prop('checked')) {
          if ( seleccion == idseleccion) { 
            if (cont != id && variable != vardoc) {
              $("#doc"+cont+":checkbox").prop('checked', false); 
              generar_notificacion('Error','Al parecer está intentado seleccionar un Tipo de comprobante que ya está configurado','danger');
            }

              //alert('x'+$("#doc"+idseleccion).prop('checked') +' - '+ variable +'=='+ vardoc +' - '+ seleccion +'=='+ idseleccion+'-'+cont +'!='+ id);
            }

          }else{
           // alert('y'+$("#doc"+idseleccion).prop('checked') +' - '+ variable +'=='+ vardoc +' - '+ seleccion +'=='+ idseleccion+'-'+cont +'!='+ id);
         }

       }).get();
    }else{
    //alert('quitado');
  } 
} 
function llamarvalidacion(id){
  tipo = $("#tipodedocumento"+id).val();
  contador = 0;
  tipodedocumentos=[];
  serie = [];
  $('select[name="tipodedocumento[]"]').map(function ( n1, i1){
    tipodedocumentos[contador]= $(this).val();
    contador++;
  }).get();
  contador = 0;
  $('input[name="series[]"]').map(function ( n1, i1){
    serie[contador] = $(this).val();
    contador++;
  }).get();
  tipodoc = tipodedocumentos[(contador-1)];
  seriecc = serie[(contador-1)] ;
  if (tipodedocumentos[(contador-1)] != '' && serie[(contador-1)] != '') {
    for (var i = 0; i < (contador-1); i++) {
      if (tipodedocumentos[i] == tipodoc &&  serie[i] == seriecc) {
       $("#btn_new").attr("disabled", true);
       $("#botonguardar").attr("disabled", true);
       return 0;
     }else{
      $("#btn_new").removeAttr("disabled");
      $("#botonguardar").removeAttr("disabled");
    }
  }
}else{
  return 0;
}
}
function validar(valor,opcionid){


}

$("#guardar_informacion").click(function(){
  $.post(base_url+"Registro_comprobante/editar_empresa",$("#formulario_empresa").serialize(),function(data){
    if(parseFloat(data)==1){
      generar_notificacion('Se Actualizo Correctamente','Se ha ingresado correctamente los datos','primary'); 
    }else{
      generar_notificacion('Error al Actualizar','Consulte con su proveedor','danger'); 
    }
  });
});

$("#guardar_confparametro").click(function(){
  $.post(base_url+"Registro_comprobante/actualizarparametro",$("#formulario_confparametro").serialize(),function(data){
    if(parseFloat(data)==1){
      generar_notificacion('Se Actualizo Correctamente','Se ha ingresado correctamente los datos','primary'); 
    }else{
      generar_notificacion('Error al Actualizar','Consulte con su proveedor','danger'); 
    }
  },'json');
});
</script>
 
