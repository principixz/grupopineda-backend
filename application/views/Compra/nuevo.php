<link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/jquery-ui.css">

  <style type="text/css">
    
  .form-control {
    height: 20px !important;
  } 
  .form-group{
    padding: 0px !important;
  }
  input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}

input[type=number] { -moz-appearance:textfield; }


#cuerpo::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
  opacity: 0.5;
}

#cuerpo::-webkit-scrollbar
{
  width: 6px;
  background-color: #F5F5F5;
  opacity: 0.5;
}

#cuerpo::-webkit-scrollbar-thumb
{
  background-color: #000000;
  opacity: 0.5;
}
</style>

  <form id="formulario_compra" onsubmit="return generar_compra()" name="formulario_compra" >
<input type="hidden" id="igv" name="igv" value="">
<div class="row">
     <div class="col-md-6">
  <div class="panel panel-border panel-success">
    <div class="panel-heading">
     <h3 class="panel-title">DATOS DEL COMPROBANTE</h3>
   </div>
   <div class="panel-body"   style="">
  <div class="row" style="padding: 0px !important;margin: 0px !important;">
      <div class="col-md-6">
        <div class="form-group">
          <label>TIPO DE COMPROBANTE</label>
          <select onchange="traer_comprobante()" class="form-control" id="tipo_comprobante" name="tipo_comprobante">
            <?php
            foreach ($data["tipo_documento"] as $key => $value) {
                                     
              echo "<option value='".$value["tipodoc_id"]."' >".$value["tipodoc_descripcion"]."</option>";
            }
            ?>
          </select>
        </div>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <label>SERIE</label>
          <input type="text" autocomplete="off"   class="form-control" name="serie" id="serie">
        </div>
      </div>
      <div class="col-md-3">
        <div class="form-group">
          <label>CORRELATIVO</label>
          <input type="text" class="form-control" autocomplete="off"   name="correlativo" id="correlativo">
        </div>
      </div>
   

      <div class="col-md-6">
        <div class="form-group">
          <label>FECHA DE COMPRA</label>
          <input type="date"  value="<?php echo date("Y-m-d"); ?>" required="true" class="form-control" name="fecha_compra" id="fecha_compra">
        </div>

      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label>ALMACEN</label>
          <select class="form-control" id="almacen_id" name="almacen_id">
            <?php
            foreach ( $data["almacen"] as $key => $value) {
              echo "<option value='".$value["almacen_id"]."'>".$value["almacen_descripcion"]."</option>";
            }
            ?>
          </select>
        </div>
      </div>
    </div>
  
  </div>
</div>
</div>


  
      <div class="col-md-6">
        <div class="panel panel-border panel-primary">
          <div class="panel-heading">
           <h3 class="panel-title">DATOS DE PAGO</h3>
         </div>
         <div  style="padding-bottom: 0px !important;" class="panel-body">
          <div class="row">
            
            <div class="col-md-12">
              <div class="form-groupm">
             <label>PROVEEDOR <a href="<?php echo base_url() ?>Proveedor/nuevo" target="_blank"><button type="button"  onclick="" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                                     <i class="ti-plus text" aria-hidden="true"></i>
                                                    </button></a></label>
              <input type="hidden" id="cliente_id" value="" name="cliente_id">

              <input type="text"  name="razon_social" ondblclick="$('#razon_social' ).attr('readonly',false);$('#razon_social' ).val('');$('#cliente_id').val('');"    id="razon_social" class="form-control" autocomplete="off">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6" style="display: none">
            <div class="form-group">
              <label>FORMA PAGO</label>
              <select class="form-control" id="forma_pago_id" name="forma_pago_id">
                <?php
                foreach ($forma_pago as $key => $value) {
                  echo "<option value='".$value["for_id"]."'>".$value["for_descripcion"]."</option>";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <label>MONEDA</label>
              <select class="form-control" onchange="" id="moneda_id" name="moneda_id">
                <?php
                foreach ($data["moneda"] as $key => $value) {
                  echo "<option value='".$value["moneda_id"]."'>".$value["moneda_simbolo"]."</option>";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <label>Cambio</label>
              <input type="number" id="cambio" name="cambio" value="1.0" class="form-control">
            </div>
          </div>
       
     
    </div>
  </div>
</div>
</div>



</div>

<div class="col-md-12">
  <button class="btn btn-success" type="button" id="boton_agregar_producto">Agregar Producto</button>
</div>
<div class="col-sm-12">
<br>
 <div class="row">
   <div class="col-sm-12">
    <div class="panel panel-border panel-info">
      <div class="panel-heading">
        <div class="row">
          <div class="col-sm-10"><h3 class="panel-title">DETALLE DE LA VENTA</h3></div>
          
        </div>
      </div>
      <div class="panel-body" style="padding-bottom: 0px !important;">
        <table class="table table-bordered m-0">

          <thead>
            <tr>
              <th width="5%">#</th>
           
              <th width="20%">PRODUCTO</th>
              <th width="10%">U/M</th>
              <th width="10%">TIPO IGV</th>
              <th width="5%">CANTIDAD</th>
              <th width="5%">PRECIO</th>
              <th width="5%">IGV</th>
              <th width="5%">SUBTOTAL</th>

              <th width="5%">AC.</th>
            </tr>
          </thead>

        </table>
        <div id="cuerpo" class="ps--active-y" style=" height: 150px !important;
        overflow: auto !important;
        overflow-x:hidden!important;">

          <table class="table table-striped table-condensed table-hover list-table"  style="margin:0px;" data-height="100">

            <tbody id="cuerpo_venta"> 


            </tbody>

          </table>
    
      </div>
    </div>
  </div>
</div>  
</div>
</div>


<div class="col-sm-12">

 
      <div class="row">
    <div class="col-sm-2">

      <div class="form-group">
        <label style="margin-top: 5px;">ITEM</label>
        <input type="text" class="form-control" value="0" readonly="true" name="total_item" id="total_item">
      </div>
    </div>
    <div class="col-sm-2">

      <div class="form-group">
        <label style="margin-top: 5px;">CANT.</label>
        <input type="text" class="form-control" value="0.00" readonly="true" name="cantidad_total" id="cantidad_total">
      </div>
    </div>
    <div class="col-sm-2">
      <div class="form-group">

        <div style="margin-top: 0px !important;" class="checkbox checkbox-primary">
      
          <label for="igv">
           IGV
         </label>
       </div>
       <input type="text" class="form-control" value="0.00" readonly="true" name="igv_total" id="igv_totaltotal">
     </div>
   </div>
   <div class="col-sm-2">
    <div class="form-group">

      <div style="margin-top: 3px !important;" class=""> 
        <label for="subtotal">
         SUBTOTAL
       </label>
     </div>
     <input type="hidden" class="form-control"  readonly="true" name="subtotalcompra" id="subtotalcompra">
     <input type="text" class="form-control" value="0.00" readonly="true" name="subtotal" id="subtotal">
   </div>
 </div>
 <div class="col-sm-2">

  <div class="form-group">
    <label style="margin-top: 5px;">TOTAL</label>
    <input type="hidden" class="form-control"  readonly="true" name="totalcompra" id="totalcompra">
    <input type="text" class="form-control" value="0.00" readonly="true" name="total" id="total">
  </div>
</div>
<div class="col-sm-2">
  <br>
 <button class="btn btn-danger btn-xs" type="button">LIMPIAR</button>
 <button class="btn btn-primary btn-xs" type="submit">GUARDAR</button>
</div>
</div>


</div>


</form>










<div id="modal_agregar_producto" class="modal fade bs-example-modal-lg"  role="dialog" aria-labelledby="myLargeModalLabel"  aria-modal="true">
                                    <div class="modal-dialog modal-lg">
                                       <form id="formulario_agregar_compra" onsubmit="return agregar_compra()">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myLargeModalLabel">Agregar Producto</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                               
                                            <div class="modal-body">
                                               <div class="col-md-12">
                                                 <div class="row">
                                                   <div class="col-md-6">
                                                    <div class="form-group">
                                                      <label>Producto <a href="<?php echo base_url() ?>R_producto/nuevo" target="_blank"><button type="button" onclick="" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;"><i class="ti-plus text" aria-hidden="true"></i></button></a>
                                                     
                                                    </button></label>
                                                       <select required="true" class="form-control" onchange="traer_unidad()" style="width: 100%" id="ajax" name="ajax" >
                                                         <option value="">Seleccionar Producto</option>
                                                       </select>
                                                    </div>
                                                   </div>
                                                   <div class="col-md-6">
                                                    <center style="display: none;" id="cargando"> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>
                                                     <div class="form-group">
                                                       <label>Unidad Medida</label>
                                                       <select required="true" class="form-control" id="unidad_medida_modal" name="unidad_medida_modal">
                                                         <option value="">Selecionar Producto</option>
                                                       </select>
                                                     </div>
                                                   </div>
                                                 </div>
                                                 <div class="row">
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>Cantidad</label>
                                                       <input required="true" step="0.01" onchange="actualizar_precio_agregar()" onkeyup="actualizar_precio_agregar()" type="number" class="form-control" min="1" id="cantidad_modal" name="cantidad_modal" >
                                                     </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>Precio</label>
                                                       <input required="true" step="0.01" onchange="actualizar_precio_agregar()" onkeyup="actualizar_precio_agregar()" type="number" class="form-control" min="1" id="precio_modal" name="precio_modal" >
                                                     </div>
                                                   </div>
                                                    <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>Tipo de IGV</label>
                                                       <select class="form-control"  onchange="actualizar_precio_agregar()"  id="tipo_igv" name="tipo_igv">
                                                         
                                                       </select>
                                                     </div>
                                                   </div>

                                                 </div>
                                                 <div class="row">
                                                    <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>Sub.Total S/</label>
                                                       <input required="true" step="0.01" value="0.00" readonly="true" type="number" class="form-control" min="1" id="sub_total_modal" name="sub_total_modal" >
                                                     </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>IGV (<label id="mostrar_igv"></label>%) S/</label>
                                                       <input required="true" step="0.01" value="0.00" readonly="true" type="number" class="form-control" min="1" id="igv_modal" name="igv_modal" >
                                                     </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label>Total S/</label>
                                                       <input required="true" step="0.01" value="0.00" readonly="true" type="number" class="form-control" min="1" id="total_modal" name="total_modal" >
                                                     </div>
                                                   </div>
                                                 </div>
                                               </div>
                                            </div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Cerrar</button> 
                      <button type="submit" class="btn btn-success">Agregar</button>
               </div>
           
          </div>
            </form>
     </div>
</div>













<div id="modal_pagar_compra" class="modal fade bs-example-modal-lg "  role="dialog" aria-labelledby="myLargeModalLabel"  aria-modal="true">
                                    <div class="modal-dialog modal-lg"    >
                                        <form id="formulario_pago" onsubmit="return pagar_compra()">
                                        <div class="modal-content">
                                            <div class="modal-header" style="background-color: #509d44!important;">
                                                <h4 class="modal-title" id="myLargeModalLabel" style="color: #fff!important;">Pagar Compra</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                              
                                            <div class="modal-body " style="background-color: #509d44!important;">
                                               <div class="col-md-12">
                                                  <div class="row">
                                                    <div class="col-md-12">
                                                        <table class="table table-bordered table-condensed" style="margin-bottom: 0;">
                                                            <tbody>
                                                              <tr>
                                                                <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;">Articulos totales</td>
                                                                <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;" class="text-right">


                                                                  <span id="item_count" style="color: black;">1(1)</span>


                                                                </td>
                                                                <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Total a Pagar</td>
                                                                <td width="25%" class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;">

                                                                  <span id="total_pagar_modal" style="color: black;">12.00</span>


                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Dinero Entrego</td>
                                                                <td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;">
                                                                
                                                                  <span id="total_paying" style="color: black;">12.00</span>
                                                                

                                                                </td>
                                                                <td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Vuelto</td>
                                                                <td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;">

                                                                  <span id="balance" style="color: black;font-weight: bold;">0.00</span>

                                                                </td>
                                                              </tr>
                                                            </tbody>
                                                          </table>
                                                  </div>
                                                </div>
                                                <div class="row">
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label style="color:#fff;">Monto de dinero</label>
                                                       <input type="number" required="true" step="0.01" autocomplete="off" id="monto_dato" class="form-control" name="monto">
                                                     </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                       <div class="form-group">
                                                          <label style="color:#fff;">Tipo de pago</label>
                                                          <select onchange="validar_tipo_pago()" class="form-control" id="tipo_pago" name="tipo_pago">
                                                            <option value="1">Contado</option>
                                                            <option value="2">Credito</option>
                                                          </select>
                                                       </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                     <div class="form-group">
                                                       <label style="color:#fff;">Forma de Pago</label>
                                                       <select id="forma_pago" name="forma_pago" class="form-control">

                                                        </select>
                                                     </div>
                                                   </div>
                                                </div>
                                                 
                                                 <div id="cuerpo_credito" style="display: none">
                                                  <div  class="row">
                                                     <div class="col-md-6">
                                                      <div class="form-group">
                                                        <label style="color:white;">Cuotas</label>
                                                        <input type="number" id="cuotas" onkeyup="crear_cronograma()" value="1" name="cuotas" class="form-control">
                                                      </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                      <div class="form-group">
                                                        <label style="color:white;">Tiempo</label>
                                                        <select class="form-control" onchange="crear_cronograma()" id="intervalo" name="intervalo">
                                                          <option value="">Seleccionar</option>
                                                          <option value="1">Diario</option>
                                                          <option value="2">Semanal</option>
                                                          <option value="3">Quincenal</option>
                                                          <option value="4" >Mensual</option>

                                                        </select>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  <div class="row">
                                                    <div class="col-md-12">
                                                      <div id="cronograma">
                                                        
                                                      </div>
                                                    </div>
                                                  </div>

                                                </div>

                                               </div>
                                            </div>
                                            <div class="modal-footer" style="background-color: #509d44!important;">
                                                  <button type="button" class="btn btn-danger waves-effect text-left" data-dismiss="modal">Cerrar</button> 
                                                  <button type="submit" id="submit-sale" class="btn btn-primary">Pagar</button>
                                           </div>
                                  
                                    </div>
                             </form>
                       </div>
</div>






















 <script src="<?php echo base_url();?>public/assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>

  <script type="text/javascript">
function pagar_compra() {
     datos_matriz={};
      datos_matriz["compra"]=$("#formulario_compra").serialize();
datos_matriz["pago"] = $("#formulario_pago").serialize();
//alert(datos_matriz["pago"]);
$("#submit-sale").text("Procesando...");
$("#submit-sale").attr("disabled",true);
$.post(base_url+"Compra/procesar_compra",JSON.stringify(datos_matriz),function(data){

 if(parseInt(data)==1){
         // window.location.href = base_url+'ComprasController';
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false); 
          $("#modal_pagar_compra").modal("hide");
          swal("SE GENERO LA TRANSACCION EXITOSA", "COBRO EXITOSA ", "success"); 
          //location.reload(true);
          setTimeout(function(){ 
            location.href =base_url+"Compra";

          }, 1500);
        }else if (parseInt(data)==2) {
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false);
          swal("SE GENERO UN ERROR EN CAJA POR FAVOR REVISE SI CAJA ESTE ABIERTO", "ERROR ", "error");  
        }else if(parseInt(data)==99){
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false);
          swal("ERROR MONTO EN CAJA INSUFICIENTE", "ERROR ", "error");   
        }else{
         $("#submit-sale").text("Pagar");
         $("#submit-sale").attr("disabled",false);
         swal("ERROR SE GENERO UN ERROR EN LA TRANSACCION", "ERROR ", "error"); 
       }

}).fail(function() {
 $("#submit-sale").text("Pagar");
 $("#submit-sale").attr("disabled",false);
 alert("ERROR SE GENERO UN ERROR EN LA TRANSACCION");
});

      return false;
}

function validar_vuelto() {
  var monto_entregado=parseFloat($("#monto_dato").val());
  var monto_total=parseFloat($("#total").val());


}

function crear_cronograma()
{
  if($("#intervalo").val()!="" && $("#cuotas").val()!=""){
    $("#cronograma").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
    $.post(base_url+"Compra/cronograma_prestamo",
    {
      "fecha_compra":$("#fecha_compra").val(),
      "cuotas":$("#cuotas").val(),
      "monto":$("#total").val(),
      "intervalo":$("#intervalo").val()
    },
    function(data){

      $("#cronograma").empty().html(data);

    });
  }else{
    $("#cronograma").empty();
  }
}

function  validar_tipo_pago()
{
  var id_tipo_pago=$("#tipo_pago").val();
  if(parseFloat(id_tipo_pago)==1)
   {
     $("#cuerpo_credito").hide();
     $("#forma_pago").attr("disabled",false);
   }else{
   $("#cuerpo_credito").show();
     $("#forma_pago").attr("disabled",true);
     $("#cronograma").empty();
     $("#cuotas").val(1);
     $("#intervalo").val("");



   }
}
function generar_compra(){

  estado=0;
   $('input[name="producto_id[]"]').map(function () {
  estado=1;
 }).get();
if (estado==0) {

alert("ERROR AL MENOS DEBES TENER UN PRODUCTO PARA PODER REALIZAR LA COMPRA","error #fec107");
  return false;
}else{
actualizar_precio();
$("#tipo_pago").val("1");
validar_tipo_pago()
  var monto_total=$("#total").val();
 var item_count=$("#total_item").val()+"("+$("#cantidad_total").val()+")";
total_pagar_modal=$("#total").val()
total_paying=$("#total").val();
balance="0,00";
 // alert(monto_total);
  /*var datos=parseFloat(monto_total);
  */$("#monto_dato").val(monto_total);
    $("#item_count").text(item_count);
    $("#total_pagar_modal").text(total_pagar_modal);
    $("#total_paying").text(total_paying);
    $("#balance").text(balance);


  $("#modal_pagar_compra").modal();

  return false;
}


/* total_pagar=parseFloat($("#totalcompra").val());  
 if(total_pagar>0){

  if($("#cliente_id").val()!=""){
    $("#pagar").modal({"backdrop":"static","keyboard":false});

    $("#dinero_entregado").val(total_pagar.toFixed(2));
     //$("#boton_monto_dinero").val(total_pagar.toFixed(2));
     //$("#boton_monto_dinero").text(total_pagar.toFixed(2));
     $("#total_paying").text(total_pagar.toFixed(2));
     $("#total_pagar_modal").text(total_pagar.toFixed(2));
     total_compra();
     setTimeout(function(){
       $("#dinero_entregado").focus();
       $("#dinero_entregado").select();

     }, 500);


   }else{
     alert("SELECCIONE UN PROVEEDOR POR FAVOR ")
   }



 }else{
  alert("ERROR AL MENOS DEBES TENER UN PRODUCTO PARA PODER REALIZAR LA COMPRA","error #fec107")
}*/

}









    function actualizar_precio(){
      $('input[name="producto_id[]"]').map(function () {
        var id_producto=$(this).val();
        var cantidad=$("#cantidad_formulario_"+id_producto).val();
        var precio=$("#precio_formulario_"+id_producto).val();
        var tipo_igv=$("#tipo_igv_formulario_"+id_producto).val();
        var estado=tipo_igv.split("/");
        var estado_tipo_igv=estado[1];
        

         var procentaje_igv=$("#igv").val();
         var igv=0;
        var subtotal=0;
        var total=0;
        total=parseFloat(cantidad)*parseFloat(precio);
        //alert(arraytipo_igv[1]);
            if(parseFloat(estado_tipo_igv)==1)
            {
              subtotal=total/(parseFloat(procentaje_igv)+1);
              igv=total-subtotal;
              //igv=total*parseFloat(procentaje_igv);
              //subtotal=total*;
            }else
            {
              igv=0;
              subtotal=total;
            }

        $("#subtotal_formulario_"+id_producto).val(subtotal.toFixed(2));
        $("#igv_formulario_"+id_producto).val(igv.toFixed(2));
      //  $("#total_modal").val(total.toFixed(2));

       
        }).get();
      calcular_totales_venta();
    }
    function agregar_compra()
  {
 //datos_compra_producto(1,"arroz",1,"unidad","1","IGV",15,1,1,1);
    var id_producto=$("#ajax").val();
    estado=0;
    $('input[name="producto_id[]"]').map(function () {
      var id=$(this).val();
      if(id_producto==id){
            estado=1;

      }
   }).get();


   if(estado==1)
   {
      $("#modal_agregar_producto").modal("hide");
     swal ( "Error" ,  "No se Puedo ingresar el mismo producto 2 veces" ,  "error" );
     //setTimeout(function(){ $("#modal_agregar_producto").modal(); }, 500);
     return false;
   }











    var producto_nombre=$("#ajax :selected").text();
    //alert(producto_nombre);
    var unidad_medida_id=$("#unidad_medida_modal :selected").val();
    var unidad_medida_descripcion=$("#unidad_medida_modal :selected").text();
    var tipo_igv_id=$("#tipo_igv :selected").val();
    var tipo_igv_descripcion=$("#tipo_igv :selected").text();
    var precio=$("#precio_modal").val();
    var cantidad=$("#cantidad_modal").val();
    var igv=$("#igv_modal").val();
    var subtotal=$("#sub_total_modal").val();
   datos_compra_producto(id_producto,producto_nombre,unidad_medida_id,unidad_medida_descripcion,tipo_igv_id,tipo_igv_descripcion,precio,cantidad,igv,subtotal);

   $("#modal_agregar_producto").modal("hide");
   $("#unidad_medida_modal").empty();
   $("#precio_modal").val("");
   $("#cantidad_modal").val("");
   $("#igv_modal").val(0.00);
   $("#sub_total_modal").val(0.00);
   $("#total_modal").val(0.00);





    return false;
  }



function datos_compra_producto(id_producto,producto_nombre,unidad_medida_id,unidad_medida_descripcion,tipo_igv_id,tipo_igv_descripcion,precio,cantidad,igv,subtotal)
{
  

   var html="";
   html+="<tr id='cuerpo_producto_"+id_producto+"'>"
   html+='<td width="5%"><input type="hidden" name="producto_id[]" value="'+id_producto+'" id="producto_id_"'+id_producto+'" /> <label id="numero'+id_producto+'"></label></td>';
   html+='<td width="16%"><label>'+producto_nombre+'</label></td>';
   html+='<td width="10%"><input class="form-control" type="hidden" value="'+unidad_medida_id+'" name="unidad_medida_formulario[]" id="unidad_medida_formulario_'+id_producto+'"><label>'+unidad_medida_descripcion+'</label></td>';
   html+='<td width="9%"><input type="hidden" value="'+tipo_igv_id+'" name="tipo_igv_formulario[]" id="tipo_igv_formulario_'+id_producto+'"><label title="'+tipo_igv_descripcion+'" style=" width:100px;text-overflow:ellipsis;white-space:nowrap; overflow:hidden; ">'+tipo_igv_descripcion+'</label></td>';
   html+='<td width="6%"><input required="true" class="form-control" min="1" onchange="actualizar_precio()"  onkeyup="actualizar_precio()"   value="'+cantidad+'" type="number" id="cantidad_formulario_'+id_producto+'" name="cantidad_formulario[]"></td>';
   html+='<td width="6%"><input required="true" class="form-control" type="number" min="0" step="0.01"  onkeyup="actualizar_precio()"   onchange="actualizar_precio()"   value="'+precio+'" id="precio_formulario_'+id_producto+'" name="precio_formulario[]"  ></td>';
   html+='<td width="6%"><input class="form-control" readonly="true" type="text"  value="'+igv+'" id="igv_formulario_'+id_producto+'" name="igv_formulario[]"  ></td>';
   html+='<td width="6%"><input class="form-control" readonly="true" type="text"   value="'+subtotal+'" id="subtotal_formulario_'+id_producto+'" name="subtotal_formulario[]"  ></td>';
   html+='<td width="5%"><button onclick="eliminar_producto('+id_producto+')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></td>';
  

   html+="</tr>";

  $("#cuerpo_venta").prepend(html);
  calcular_totales_venta();
}

function eliminar_producto(id_producto) {
  var confirmar=confirm("¿Estas seguro que seas eliminar este producto?");
  if(confirmar){
       $("#cuerpo_producto_"+id_producto).remove();
  }
}


 function calcular_totales_venta()
 {
      var estado=0;
      var con=1;

      var subtotal=0;
      var total=0;
      var igv=0;
  var cantidad_total=0;

        $('input[name="producto_id[]"]').map(function () {
          /*if($(this).val()==id)
          {
            estado=1;
          }*/
         
        id_producto=$(this).val();
        $("#numero"+id_producto).text(con)
        con++;
        subtotal+=parseFloat($("#subtotal_formulario_"+id_producto).val());
        igv+=parseFloat($("#igv_formulario_"+id_producto).val());



        total+=parseFloat($("#subtotal_formulario_"+id_producto).val())+parseFloat($("#igv_formulario_"+id_producto).val());
        cantidad_total+=parseFloat($("#cantidad_formulario_"+id_producto).val());
        }).get();

        $("#igv_totaltotal").val(igv.toFixed(2));
        $("#subtotal").val(subtotal.toFixed(2));
        $("#total").val(total.toFixed(2));
        $("#total_item").val(con-1);
        $("#cantidad_total").val(cantidad_total);

 }

function actualizar_precio_agregar()
{
  var producto_id=$("#ajax").val();
  var unidad_medida=$("#unidad_medida_modal").val();
  var cantidad_modal=$("#cantidad_modal").val();
  var precio_modal=$("#precio_modal").val();
  var tipo_igv=$("#tipo_igv").val();
  var procentaje_igv=$("#igv").val();
  if(precio_modal=="")
  {
      return false;
  }
  if(cantidad_modal==""){
     return false;
  }
  if(producto_id=="")
  {
  return false;
  }

  var arraytipo_igv=tipo_igv.split("/");
  var igv=0;
  var subtotal=0;
  var total=0;
  total=parseFloat(precio_modal)*parseFloat(cantidad_modal);
  //alert(arraytipo_igv[1]);
  if(parseFloat(arraytipo_igv[1])==1)
  {
    subtotal=total/(parseFloat(procentaje_igv)+1);
    igv=total-subtotal;
    //igv=total*parseFloat(procentaje_igv);
    //subtotal=total*;
  }else
  {
    igv=0;
    subtotal=total;
  }

  $("#sub_total_modal").val(subtotal.toFixed(2));
  $("#igv_modal").val(igv.toFixed(2));
  $("#total_modal").val(total.toFixed(2));

}









function mostrar_forma_pago()
    {
      $.post(base_url+"Compra/mostrar_forma_pago",function(data){
         var html="";
               for(var i=0;i<data.length;i++){
                html+="<option value='"+data[i]["for_id"]+"'>"+data[i]["for_descripcion"]+"</option>";
               }
              $("#forma_pago").empty().append(html);
      },"json");
    }





  $(function()
    {
      mostrar_forma_pago();
mostrar_tipo_igv();
mostrar_igv();
      //validar_caja_compra() ;
    });
  function mostrar_igv()
   {

    $.post(base_url+"Compra/mostrar_igv",function(data){
       $("#igv").val(data["variable_igv"]);
       var total=data["variable_igv"]*100;
       $("#mostrar_igv").text(total);
    },"json");
   }
    function mostrar_tipo_igv()
    {
      $.post(base_url+"Compra/mostrar_tipo_igv",function(data){
         var html="";
               for(var i=0;i<data.length;i++){
                html+="<option value='"+data[i]["tipo_igv_id"]+"/"+data[i]["tipo_igv"]+"'>"+data[i]["tipo_igv_descripcion"]+"</option>";
               }
              $("#tipo_igv").empty().append(html);
      },"json");
    }
  
function traer_unidad()
{

  var id=$("#ajax").val();
  $("#cargando").show();
  $("#unidad_medida_modal").hide();


  $.post(base_url+"Compra/mostrar_unidad_medida",{"id":id},function(data){
    var html="";
      for(var i=0;i<data.length;i++)
      {
        $texto="";
        if(data[i]["detalle_unidad_producto_factor"]==1)
        {
          $texto=data[i]["unidad_medida_descripcion"];
        }else{
          $texto=data[i]["unidad_medida_descripcion"]+"X"+data[i]["detalle_unidad_producto_factor"];

        }
        html+="<option value='"+data[i]["detalle_unidad_producto_id"]+"'>"+$texto+"</option>";

      }

      $("#unidad_medida_modal").empty().append(html);
        $("#cargando").hide();
  $("#unidad_medida_modal").show();
  },"json");
  actualizar_precio_agregar();
}

 $('#ajax').select2({
   dropdownParent: $('#modal_agregar_producto'),
  ajax: {
    url: base_url+'Compra/buscar_producto',
    dataType: 'json',
    placeholder: 'Buscar Producto',
    maximumSelectionLength: 10
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
  },
  language: {
    noResults: function() {
      return "No hay resultado";        
    },
    searching: function() {
      return "Buscando..";
    }

  }

});








       $("#boton_agregar_producto").click(function(){
  
      $("#modal_agregar_producto").modal({
         keyboard: false,
         backdrop:'static',

      });
     

                    $("#tipo_igv").val("8/0");

             var select=$('#ajax');

            var option = new Option("Seleccionar Producto","", true, true);
            select.append(option).trigger('change');

              // manually trigger the `select2:select` event
              select.trigger({
                type: 'select2:select'
              });
  });
    $(function(){
    // $("#razon_social").focus();
      $( "#razon_social" ).autocomplete({

        source:function (request, response)
        {
          $.ajax(
          {
            url:base_url+"Compra/buscar_proveedor" ,
            dataType: "json",
            data:
            {
              term: request.term,
              comprobante_id:$("#tipo_comprobante").val()
            },
            success: function (data)
            {
              response(data);

            }
          });
        } ,
        minLength: 0,

        select: function( event, ui ) {
        //log( "Selected: " + ui.item.value + " aka " + ui.item.id );
        $("#cliente_id").val(ui.item.id);
        $( "#razon_social" ).attr("readonly",true);
      }
    }).data("ui-autocomplete")._renderItem = function (ul, item) {
       return $("<li></li>")
       .data("item.autocomplete", item)
       .append("<div><h4>" + item.label + "</h4><label>"+ item.codigo+"</aria-labelledby></div>")
       .appendTo(ul);
     };


   });

    function cerrar(){
      $('#modal_agregar_producto').modal('hide');
    }

    function agregar_proveedor_guardar() {
      $("#boton_agregar_proveedor").text("Guardando...");
      $("#boton_agregar_proveedor").attr("disabled",true);

      $.post(base_url+"Proveedor/guardar_proveedor",$("#formulario_agregar_cliente").serialize(),function(data){
        if(parseFloat(data)==1)
        {


          toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
          }
          toastr["success"]("se guardo correctamente", "excelente");
          $("#boton_agregar_proveedor").text("AGREGAR");
          $("#boton_agregar_proveedor").attr("disabled",false);
          $("#modal_agregar_cliente").modal("hide");
          $("#formulario_agregar_cliente")[0].reset();

        }else{
          alert("error al guardar");
        }
      });
      return false;
    }


    function cambio(id){
      if (id != 1) {
        document.getElementById('dolarprecio').style.display = 'block';
      }else{

      }
    }

    function agregar_cliente()
    {
     $("#formulario_agregar_cliente")[0].reset();

     $("#modal_agregar_cliente").modal();
   }
   $("#buscar_producto").keyup(function(){

    str=$(this).val();
    var n = str.length;
    if(n>3){
     $.post(base_url+"ComprasController/buscar_producto",{"buscar":$(this).val()},function(data){
       html="";
       for (var i = 0; i < data.length; i++) {
         var imagen="";
         if(  data[i]["imagen_producto"]=="")
         {
          imagen="default.jpg";
        }else{
          imagen= data[i]["imagen_producto"];
        }

        var a=data[i]["producto_id"]+",'"+data[i]["codigo_producto"]+"','"+data[i]["descripcion_producto"]+"',"+data[i]["precio_unitario"]+","+data[i]["stock_precio"]+",'"+data[i]["marca_producto"]+"'";
        html+='<div class="col-sm-3">';
        html+='<div class="card-box widget-box-two" onclick="agregar_producto('+a+')" >';
        html+=' <div class="wigdet-two-content">';
        html+='<p style="margin-bottom: 2px;" class="m-0 text-uppercase font-600 font-secondary text-overflow" title="Statistics">'+data[i]["descripcion_producto"]+'</p>';
        html+=' <h6 style="margin: 1px!important;" class=""><b>CODIGO:</b> '+data[i]["codigo_producto"]+'</h6>';
        html+=' <h6 style="margin: 1px!important;"  class=""><b>MARCA &nbsp;:</b> '+data[i]["marca_producto"]+'</h6>';
        html+='<h6 style="margin: 1px!important;"  class=""><b>FAMILIA &nbsp;&nbsp;:</b> '+data[i]["familiaproducto"]+'</h6>';
        html+='<h6 style="margin: 1px!important;"  class=""><b>PRECIO &nbsp;&nbsp;:</b> '+data[i]["precio_unitario"]+'</h6>';
        html+='  </div>';
        html+=' </div>';
        html+=' </div>';
      }

      $("#cuerpo_producto").empty().append(html);

    },"json");
   }
   else
   {
    $("#cuerpo_producto").empty();
  }
});


   function agregar_producto(id,codigo,descripcion,precio,stock,marca){ 
    $("#marca_producto").val(marca);
    $("#producto_id").val(id);
    $("#codigo_producto").val(codigo);
    $("#descripcion_producto").val(descripcion);
    $("#precio_unitario").val(precio);
    $("#producto_stock").val(stock);
    $("#cantidad_producto").focus();

  }
  function agregar_producto_cantidad(){      
    var id=$("#producto_id").val(); 
    var codigo= $("#codigo_producto").val();
    var descripcion= $("#descripcion_producto").val();
    var cantidad= $("#cantidad_producto").val();
    var precio_unitario= $("#precio_unitario").val();
    var marca_producto= $("#marca_producto").val();
    float_precio_unitario=parseFloat(precio_unitario);
    float_precio_cantidad=parseFloat(cantidad);

    var precio_total= float_precio_unitario*float_precio_cantidad;

               // var precio_uni=precio_unitario.toFixed(2);
               var precio_tot=precio_total.toFixed(2);

        //  alert(precio_tot);
        var estado=0;
        $('input[name="producto_id[]"]').map(function () {
          if($(this).val()==id)
          {
            estado=1;
          }
        }).get();
        if(estado==0){
          var html="";
          html+='<tr id="detalle_compra'+id+'">';
          html+='<input type="hidden" id="producto_id'+id+'" name="producto_id[]" value="'+id+'">';
          html+=' <th width="6%"><label id="numero'+id+'"></label></th>';
          html+='<th width="6%">'+codigo+'</th>';
          html+='<th width="2%">'+marca_producto+'</th>';
          html+='<th width="23%">'+descripcion+'</th>';
          html+='<th width="6%">UND</th>';
          html+='<th width="11%"><input type="number" class="entrada_texto" onchange="actualizar_datos()" onkeyup="actualizar_datos()" value="'+cantidad+'" name="producto_cantidad[]" style="width=30px !important;"  id="producto_cantidad'+id+'"></th>';
          html+='<th width="10%"><input type="number" onchange="actualizar_datos()" onkeyup="actualizar_datos()" value="'+precio_unitario+'" name="precio_unitario[]" class="entrada_texto"  id="precio_unitario'+id+'"></th>';
          html+='<th width="5%"><label  id="subtotal'+id+'">'+precio_tot+'</th>';
          html+='<th width="5%"><a href="#" onclick="eliminar_pedido('+id+')" class="on-default remove-row"><i class="fa fa-trash-o"></i></a></th>';
          html+='</tr>';

          $("#cuerpo_venta").prepend(html);
        }
        else{

          var cantidad_a=$("#producto_cantidad"+id).val();
          var cantidad1=parseFloat(cantidad_a);
          var cantidad_total=float_precio_cantidad+cantidad1;

          $("#producto_cantidad"+id).val(cantidad_total);
        }

        $("#producto_id").val("");
        $("#codigo_producto").val("");
        $("#descripcion_producto").val("");
        $("#producto_precio").val("");
        $("#producto_stock").val("");
        $("#cantidad_producto").val("");
        $("#buscar_producto").val(""); 
        $("#buscar_producto").focus();

        $("#cuerpo_producto").empty();

        actualizar_datos();
        return false;
      }


function eliminar_pedido(id)
{

swal({
                title: "¿EStas seguro que desea eliminar?",
                text: "",
                type: "success",
                showCancelButton: true,
                cancelButtonClass: 'btn-default btn-md waves-effect',
                confirmButtonClass: 'btn-success btn-md waves-effect waves-light',
                confirmButtonText: 'Aceptar'
            },function(){

                $("#detalle_compra"+id).remove();
                actualizar_datos();
             
        });



}



      function actualizar_datos()
      {

        var total=0;
        $('input[name="producto_id[]"]').map(function () {
          var val=$(this).val();
          var cant=$("#producto_cantidad"+val).val();
          var pre=$("#precio_unitario"+val).val();
          var precio=parseFloat(pre);
          var cantidad=parseFloat(cant);
          total=precio*cantidad;

          $("#subtotal"+val).text(total.toFixed(2));

        }).get();
        generar_total();
      }


      function generar_total()
      {


       var total=0;
       consecutivo=1;
       cantidad_total=0;
       $('input[name="producto_id[]"]').map(function () {
        var val=$(this).val();
        var cant=$("#producto_cantidad"+val).val();
        var pre=$("#precio_unitario"+val).val();
        var precio=parseFloat(pre);
        var cantidad=parseFloat(cant);
        total+=precio*cantidad;
        $("#numero"+val).text(consecutivo);
        cantidad_total+=cantidad;
        consecutivo++;
      }).get(); 
       $("#totalcompra").val(total.toFixed(2));
       $("#total").val(total.toFixed(2));
       $("#subtotalcompra").val(total.toFixed(2));
       $("#subtotal").val(total.toFixed(2));
       $("#cantidad_total").val(cantidad_total);
       $("#total_item").val(consecutivo);
       if($("#igv").prop("checked"))
       {
   // alert();
   var igv=(total*1)/1.18;
   var subtotal=total-igv;     
   $("#igv_totaltotal").val(subtotal.toFixed(2)); 
   $("#subtotalcompra").val(igv.toFixed(2));
   $("#subtotal").val(igv.toFixed(2));
 }else{
   $("#igv_totaltotal").val(0.00);     
 }
}
function traer_comprobante()
{

  var id=$("#tipo_comprobante").val();
  //$("#razon_social").val("");
  $("#razon_social").attr("disabled",false);


 // $("#cliente_id").val("");
 
}
$("#tipo_pago").change(function(){
    //if($(this).val()=="1")
    //  {
    //            $("#credito").hide();
   //              $("#cuotas").val("");
    //            $("#intervalo").val("");
    //           $("#cronograma").empty();
   //       $("#dinero_entregado").attr("readonly",false);
   //   }else{
  //        $("#dinero_entregado").attr("readonly",true);
   //           $("#credito").show();   
   //   }
 });




function total_compra(){
  total=0;
  cantidad_producto=0;
  suma_producto=0;
  impuesto=0;
  total_pagar=0;
  $('input[name="producto_id[]"]').map(function(n,i){
   id=$(this).val();
   cantidad_producto++;
   cantidad=parseFloat($("#producto_cantidad"+id).val());
   precio=parseFloat($("#precio_unitario"+id).val());
   $("#subtotal"+id).text((cantidad*precio).toFixed(2));
   total+=cantidad*precio;
   suma_producto+=cantidad;
 }).get();
  total_pagar=total;
  $("#total_pagar").text(total_pagar.toFixed(2));
  if( $('#igv').prop('checked')){
   impuesto= parseFloat($("#igv").val());
   subtotal=100+impuesto*100;
   $("#total").text((total_pagar*100/subtotal).toFixed(2));
   $("#impuesto").text(((total_pagar*100/subtotal)*impuesto).toFixed(2));
 }
 else{
  $("#total").text(total_pagar.toFixed(2));
  $("#impuesto").text("0.00");
}
$("#count").text(cantidad_producto+"("+suma_producto+")");
$("#item_count").text(cantidad_producto+"("+suma_producto+")");
}

function generar_vuelto()
{
  monto_pagar=parseFloat($("#total_pagar_modal").text());
  dinero=parseFloat($("#dinero_entregado").val());
  vuelto=dinero-monto_pagar;
  $("#total_paying").text(dinero.toFixed(2));
  $("#balance").text(vuelto.toFixed(2));
}

function transporte()
{
  $ver=$("#transporte_factura").prop("checked");
  if($ver)
  {
    $("#transporte_factura_datos").show();
  }
  else{
    $("#factura_transporte").val("");
    $("#guia_transporte").val("");
    $("#fecha_transporte").val("");

    $("#monto_transporte").val("0");




    $("#transporte_factura_datos").hide();
  }
}

function pagar(){
 datos_matriz={};
 if($("#serie").val()==""){
  $("#serie").focus(); return 0;
}
if($("#dinero_entregado").val()==""){
  $("#dinero_entregado").focus(); return 0;
}
if($("#correlativo").val()==""){
  $("#correlativo").focus(); return 0;
}
if($("#tipo_pago").val()=="2"){
 if($("#cuotas").val()==""){
   // $("#cuotas").focus(); return 0;
 }
 if($("#intervalo").val()==""){
   // $("#intervalo").focus(); return 0;
 }

} 
datos_matriz["compra_pago"]=$("#formulario_pago").serialize();
datos_matriz["boleta"] = $("#formulario_boleta").serialize();
datos_matriz["detalle"] = $("#formulario_detalle").serialize();
datos_matriz["detallec"] = $("#formulario_detallec").serialize();
$("#submit-sale").text("Procesando...");
$("#submit-sale").attr("disabled",true);
$.post(base_url+"ComprasController/procesar_compra",JSON.stringify(datos_matriz),function(data){
 if(parseInt(data)==1){
          window.location.href = base_url+'ComprasController';
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false); 
          swal("SE GENERO LA TRANSACCION EXITOSA", "COBRO EXITOSA ", "success"); 
          location.reload(true);
        }else if (parseInt(data)==2) {
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false);
          swal("SE GENERO UN ERROR EN CAJA POR FAVOR REVISE SI CAJA ESTE ABIERTO", "ERROR ", "error");  
        }else if(parseInt(data)==99){
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false);
          swal("ERROR MONTO EN CAJA INSUFICIENTE", "ERROR ", "error");   
        }else{
         $("#submit-sale").text("Pagar");
         $("#submit-sale").attr("disabled",false);
         swal("ERROR SE GENERO UN ERROR EN LA TRANSACCION", "ERROR ", "error"); 
       }
}) .fail(function() {
 $("#submit-sale").text("Pagar");
 $("#submit-sale").attr("disabled",false);
 alert("ERROR SE GENERO UN ERROR EN LA TRANSACCION");
});
}




</script>