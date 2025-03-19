<script src="https://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript">

</script>
<div class="row">
  <div class="col-md-8">
    <div class="row">
      <div class="col-md-2">
        <button   onclick="consultartipo()" class="btn  btn-warning btn-block" >Arqueo</button>
      </div>
      <?php if ($data["estadosesioncaja"]==3 || $data["estadosesioncaja"]==2) { ?>
      <div class="col-md-10">
        <h4 class="lead">Usted no tiene permiso de abrir caja</h4>
      </div>
      <?php }else{ if ($data["estado_caja"]==2) { ?>
      <div class="col-md-2"><button id="boton_abrir_caja" class="btn  btn-success btn-block" >Abrir Caja</button></div>
      <?php } if ($data["estado_caja"]==3) { ?>
      <div class="col-md-2"><button id="boton_cerrar_caja" class="btn  btn-danger btn-block" >Cerrar Caja</button></div>
      <?php } if ($data["estado_caja"]==4) { ?>
      <div class="col-md-2">
        <h6 class="lead">Usted podra abrir mañana la caja</h6>
      </div>
      <?php }} ?>    
    </div>

    <br>
    <div class="row">
      <div class="col-md-6">
       <div class="panel card-view panel-primary">
        <div class="panel-heading">
          <div class="pull-left">
           <h6 class="panel-title ">Caja Fisica al día <?php echo "S/. ".$data["fecha_dia"]; ?> </h6>
         </div>
         <div class="clearfix"></div>
       </div>
       <div class="panel-wrapper  collapse in">
        <div class="panel-body">
         <center><h3><?php $totalfisico=($data["ingresosf"] + $data["saldoinicialf"])-$data["egresosf"];
         echo "S/. ".number_format($totalfisico,2, '.', ',');  ?></h3></center>
         <input type="hidden" name="ingresosf" id="ingresosf" value="<?php echo $data["saldoinicialf"]; ?>">
         <input type="hidden" name="cajafisica" id="cajafisica" value="<?php echo $data["caja2"]; ?>">
         <input type="hidden" name="cajavirtual" id="cajavirtual" value="<?php echo $data["caja1"]; ?>">
         <div class="row">
          <div class="col-md-6">
            <?php $ingresosf = $data["ingresosf"] + $data["saldoinicialf"]; ?>
            Ingresos: <label><?php echo "S/. ".number_format($ingresosf,2, '.', ','); ?></label>
          </div>
          <div class="col-md-6">
            Egresos: <label><?php echo "S/. ".number_format($data["egresosf"],2, '.', ','); ?></label>
          </div>


        </div>
      </div>

    </div>
    <div class="panel-heading">
      <div class="pull-left">
        <h6 class="panel-title "><?php echo $data["movif"]?> Transacciones</h6>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<div class="col-md-6">
 <div class="panel card-view panel-success">
  <div class="panel-heading">
    <div class="pull-left">
     <h6 class="panel-title ">Caja Virtual al día <?php echo $data["fecha_dia"]; ?> </h6>
   </div>
   <div class="clearfix"></div>
 </div>
 <div class="panel-wrapper  collapse in">
  <div class="panel-body">
   <center><h3><?php $totalvirtual=($data["ingresosv"] + $data["saldoinicialv"])-$data["egresosv"];
   echo "S/. ".number_format($totalvirtual,2, '.', ',');  ?></h3></center>
   <input type="hidden" name="ingresosv" id="ingresosv" value="<?php echo $data["saldoinicialv"]; ?>">
   <div class="row">
    <div class="col-md-6">
      <?php $ingresosv = $data["ingresosv"] + $data["saldoinicialv"]; ?>
      Ingresos: <label><?php  echo "S/. ".number_format($ingresosv,2, '.', ',');  ?></label>
    </div>
    <div class="col-md-6">
      Egresos: <label><?php  echo "S/. ".number_format($data["egresosv"],2, '.', ',');  ?></label>
    </div>


  </div>
</div>
</div>
<div class="panel-heading">
  <div class="pull-left">
   <h6 class="panel-title "><?php echo $data["moviv"]; ?> Transacciones</h6>
 </div>
 <div class="clearfix"></div>
</div>
</div>
</div>
<div class="col-md-12">
  <div class="row">
  <div class="col-md-12">
    <div class="table-responsive">
      <table class="table mb-0">
        <thead>
          <tr>
            <th>Formas de Pago</th>
            <th>Transacciones</th>

            <th>Ingreso(0)</th>
            <th>Egreso(0)</th>
            <th>Total</th>

          </tr>
        </thead>
        <tbody>
          <?php
          $suma_total=0;
          if (isset($data["array_formapago"])) {     
          foreach($data["array_formapago"] as $val){

            echo "<tr>";
            echo "<td>".$val["descripcion"]."</td>";
            echo "<td>".$val["transacciones"]."</td>";
            echo "<td>".$val["ingreso"]."</td>";
            echo "<td>".$val["egreso"]."</td>";
            echo "<td>".$val["total"]."</td>";
            $suma_total+=$val["total"];

            echo "</tr>";
          } }?>
          <tr>
            <td colspan="4">Total Neto</td>
            <td><center><b style="font-weight: bold;font-size: 15px;"><?php echo "S/. ".number_format($suma_total,2, '.', ','); ?></b></center></td>
          </tr>
        </tbody>

      </table>
    </div>
  </div>
</div> 
</div>
</div>
</div> 
<div class="col-md-4">
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel panel-default card-view panel-refresh">
        <div class="refresh-container">
          <div class="la-anim-1"></div>
        </div>
        <div class="panel-heading">
          <div class="pull-left">
            <h6 class="panel-title txt-dark">Caja Física</h6>
          </div>
          <div class="clearfix"></div>
        </div>

        <div class="panel-wrapper collapse in">
         <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="col-md-4">
  <div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <div class="panel panel-default card-view panel-refresh">
        <div class="refresh-container">
          <div class="la-anim-1"></div>
        </div>
        <div class="panel-heading">
          <div class="pull-left">
            <h6 class="panel-title txt-dark">Caja Virtual</h6>
          </div>
          <div class="clearfix"></div>
        </div>
        
        <div class="panel-wrapper collapse in">
          <div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<script type="text/javascript">
  $("#boton_abrir_caja").click(function(){
    $("#abrir_caja_modal").modal();
  });
  $("#boton_cerrar_caja").click(function(){
    $("#cerrar_caja_modal").modal();
  });


  function arqueo(){
    window.open(base_url+"Sesion_caja/cargar_detalle_pagos");
    return 0;
  }
  function traerarqueo(){
		window.open(base_url+"Sesion_caja/llamarfuncion/1");
		return 0; 
  }
  function pdfarqueo(){
  	window.open(base_url+"Sesion_caja/llamarfuncion/2");
  	return 0;
  }
   function excelfunction(){
  	window.open(base_url+"Sesion_caja/llamarfuncion/3");
  	return 0;
  }
  function consultartipo(){

        $.confirm({
            title: 'Qué desea hacer?',
            content: 'Por favor seleccione una opción!',
            buttons: {   
                Arqueo: {
                    text: 'Arqueo',
                    btnClass: 'btn-primary',
                    action: function(){
                     arqueo();
                 }
             },             
             pdf: {
                    text: 'PDF',
                    btnClass: 'btn-danger',
                    action: function(){
                     pdfarqueo();
                 }
             },
             imprimir: {
                    text: 'IMPRIMIR',
                    btnClass: 'btn-warning',
                    action: function(){
                     traerarqueo();
                 	}
             },
             cancelar: {
                text: 'Cancelar',
                btnClass: 'btn-red',
                action: function(){

                }
            }
            }
        });

    

    }
        
    
  
</script>
<div id="abrir_caja_modal" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h5 class="modal-title" id="myModalLabel">Abrir Caja</h5>
      </div>
      <div class="modal-body">
        <div class="row">
          <form id="formulario_caja">
            <div class="col-md-12">
              <div class="form-group">
                <label>Inicio caja fisica</label>
                <input type="number" value="0" id="inicio_caja_fisica" name="inicio_caja[]" class="form-control">
              </div>
            </div>
            <div class="col-md-12">
              <div class="form-group">
                <label>Inicio caja virtual</label>
                <input type="number" value="0"  id="inicio_caja_virtual" name="inicio_caja[]" class="form-control">
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="abrir_caja">Abrir caja</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>




<div id="cerrar_caja_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <h4 class="modal-title" style="font-weight: bold;">
          <i class="fa fa-comments-o"></i> !Confirmar cierre de caja¡ 
        </h4>
      </div>
      <div class="modal-body" align="center">
        <div class="alert alert-success">
          <strong class="default"> ATENCION ADMINISTRADOR DE CAJA:</strong> 
          Compruebe que los montos de cada empleado fueron entregados correctamente <br>
          <strong class="default">DEBE DEJAR TODO EN ORDEN PARA EL PROXIMO CAJERO</strong>
        </div>
        <h4>
          <b>Seguro desea cerrar caja?</b>
        </h4> <br>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btn_cierrecaja" onclick="cerrarcaja()">
          Si, Cerrar caja ahora
        </button>
      </div>
    </div>
  </div>
</div>

<div id="modal_arqueo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <h4 class="modal-title" style="font-weight: bold;">
          <i class="fa fa-comments-o"></i> !Arqueo de caja¡ 
        </h4>
      </div>
      <div class="modal-body" align="center">
          <div id="detalle_arqueo">
            
          </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="<?php echo base_url();?>public/modulos/graficoscaja.js"></script>
<script type="text/javascript">

</script>