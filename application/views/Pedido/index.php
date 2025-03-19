<script type="text/javascript" src="<?php echo base_url(); ?>public1/lib/bower_components/bootstrap-switch/dist/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>public1/js/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public1/lib/bower_components/switchery/dist/switchery.min.css">
<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>public1/lib/bower_components/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css">
<script type="text/javascript" src="<?php echo base_url(); ?>public/modulos/pedido.js"></script>


<style type="text/css">

.ui-autocomplete-input-has-clear {
  padding-right: 24px;
}

.ui-autocomplete-input-has-clear::-ms-clear {
  display: none;
}

.ui-autocomplete-clear {
  display: inline-block;
  width: 16px;
  height: 16px;
  text-align: center;
  cursor: pointer;
}

	.ui-autocomplete-loading {
    background: white url("public/ui-anim_basic_16x16.gif") right center no-repeat;
  }
.ui-autocomplete {
    z-index: 5000;
   /* background-color: white !important*/
    /*width:100% !important;*/
}
    @media screen and (min-width: 2000px) and (max-width: 2048px){
		#dropid {
		    left: 1485px !important;
		}
    }

    @media screen and (min-width: 1800px) and (max-width: 2000px){
		#dropid {
		    left: 1370px !important;
		}
    }
    @media screen and (min-width: 1600px) and (max-width: 1800px){
		#dropid {
		    left: 1200px !important;
		}
    }
    @media screen and (min-width: 1430px) and (max-width: 1559px){
		#dropid {
		    left: 1051px !important;
		}
    }
    @media screen and (min-width: 1300px) and (max-width: 1400px){
		#dropid {
		    left: 945px !important;
		}
    }
    @media screen and (min-width: 1200px) and (max-width: 1380px){
		#dropid {
		    left: 785px !important;
		}
    }

.table > tbody > tr > td{
	padding: 3px !important;
}
#scroll_div{
	height: 450px;
	overflow: auto;
	overflow-x:hidden!important;
}


.scroll::-webkit-scrollbar {
	width: 10px;
}

.scroll::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
	border-radius: 5px;
}

.scroll::-webkit-scrollbar-thumb {
	border-radius: 5px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}




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
.col-xs-6 {
    width: 50% !important;
}
.col-xs-1 {
 
    width: 8.33333333% !important;
}
.col-xs-4 {
    width: 33.33333333% !important;
}
.col-xs-12 {
    width: 100% !important;
}
.modal-dialog .modal-content {
    border-radius: 2px;
    border: none;
}
@media (min-width: 768px)
.modal-content {
    -webkit-box-shadow: 0 5px 15px rgba(0,0,0,.5);
    box-shadow: 0 5px 15px rgba(0,0,0,.5);
}
.modal-content {
    position: relative;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #999;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: 6px;
    outline: 0;
    -webkit-box-shadow: 0 3px 9px rgba(0,0,0,.5);
    box-shadow: 0 3px 9px rgba(0,0,0,.5);
}
.modal-open .modal {
    overflow-x: hidden !important;
    overflow-y: auto !important;
}
.fade.in {
    opacity: 1 !important;
}
.modal {
    position: fixed !important;
    top: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    left: 0 !important;
    z-index: 1050 !important;
    overflow: hidden !important;
    -webkit-overflow-scrolling: touch !important;
    outline: 0;
}
.fade {
    opacity: 0;
    -webkit-transition: opacity .15s linear !important;
    -o-transition: opacity .15s linear !important;
    transition: opacity .15s linear !important;
}
.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
    float: left !important;
}
.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
	    position: relative !important;
    min-height: 1px !important;
    padding-right: 15px !important;
    padding-left: 15px !important;
}
.select2-container--default {
    width: 100% !important;
}
/*
 *  STYLE 4
 */

 ​
</style>
<div class="row">
	<div class="col-md-6">
		<input type="date" value="<?php echo date('Y-m-d'); ?>" name="fecha_venta" id="fecha_venta" style="display: none;">
		<div class="input-group mb-15">

			<input type="text" id="buscar" name="buscar" class="form-control" placeholder="Buscar Mesa">
			<span class="input-group-btn">
				<button type="button" class="btn  btn-success"><i class="fa fa-search"></i></button>
			</span>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
						<table  class="table  display table-hover border-none">
							<thead>
								<tr>
									<th width="10%" >Mesa</th>
									<th width="30%">Descripcion</th>
									<th width="10%">Tiempo</th>
									<th width="20%">Precio</th>
									<th width="10%">Pago</th>					
								</tr>
							</thead>
						</table>	
				<div class="panel-group accordion-struct" id="acordion_venta" role="tablist" aria-multiselectable="true">
				</div>	 


	</div>
</div>
<div id="no_pedido">
	
</div>
<div id="modal_canje" class="modal fade bs-example-modal-sm in" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="mySmallModalLabel">Vale de Consumo</h5>
			</div>
			<form id="formulario_editarcanje" onsubmit="return editar_canje_producto();">
				<input type="hidden" name="id_detalle_canje" id="id_detalle_canje_actualizar">
				<div class="modal-body"> 
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-4">
								<div class="radio">
									<input type="radio" name="descuento" onchange="cambio(1)" id="radio3" value="1"  checked="checked">
									<label for="radio3">Des. Canje</label>
								</div>
							</div> 
							<div class="col-md-4">
								<div class="radio">
									<input type="radio" name="descuento" onchange="cambio(2)" id="radio5" value="2">
									<label for="radio5">Des. Soles</label>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<label>Producto</label>
								<input type="text" id="producto_canjeactualizar" required="true" class="form-control" disabled="">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Precio</label>
								<input type="text" id="precio_canjeproducto" name="precio_canjeproducto" required="true" class="form-control" >
								<input type="hidden" id="precio_canjeproducto_hidden" name="preciocanje">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Cantidad Total</label>
								<input type="hidden" name="estockcanje_productoi" id="estockcanje_productoi">
								<input type="text" id="estockcanje_producto" name="estockcanje_producto" required="true" class="form-control" readonly>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Cantidad Canje</label>
								<input type="number" name="cantidadcanje" min="1" value="1" id="cantidad_productocanje" onchange="actualizarcanje();" onkeyup="actualizarcanje();" required="true" class="form-control">
							</div>
						</div>
 						<div class="col-md-6">
							<div class="form-group">
								<label id="label_usuario">Usuario</label>
								<input type="text" name="usuariocanje" id="usuario_editarcanje" required="true" class="form-control" >
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label id="label_contrasena">Contraseña</label>
								<input type="password" name="contrasenacanje" id="contrasena_editarcanje" required="true" class="form-control" >
							</div>
						</div>  
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" id="guardar_actualizarcanje" >Guardar</button>

					<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->

</div>
<div id="modal_eliminar" class="modal fade bs-example-modal-sm in" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="mySmallModalLabel">Eliminar pedido</h5>
			</div>
			<form id="formulario_total" onsubmit="return guardar_eliminar_datos()">
				<div class="modal-body"> 
					<div class="row">
						<input type="hidden" name="id_detalle_venta_modal" id="id_detalle_venta_modal">
                    
             	<div class="col-md-12">
             		<div class="form-group">
             			<label>motivo</label>
             			<input type="text" id="motivo" name="motivo" required="true" class="form-control">
             			
             		</div>
             	</div>

             	<div class="col-md-6" id="eliminar_div_usuario">
             		<div class="form-group">
             			<label>Usuario</label>
             			<input type="text" name="eliminar_usuario" autocomplete="off" id="eliminar_usuario" class="form-control" required="true">
             		</div>
             	</div>
             	<div class="col-md-6" id="eliminar_div_contrasena">
             		<div class="form-group">
             			<label>Contraseña</label>
             			<input type="password" name="eliminar_contrasena" autocomplete="off" id="eliminar_contrasena" class="form-control" required="true">
             		</div>
             	</div>

             </div>

         </div>
         <div class="modal-footer">
         	<button type="submit" class="btn btn-success" id="guardar_eliminar" >Guardar</button>

         	<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
         </div>
     </form>
 </div>
 <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

</div>

<!--milton-->
<div id="modal_actualizar" class="modal fade bs-example-modal-sm in" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="mySmallModalLabel">Editar pedido</h5>
			</div>
			<form id="formulario_editar" onsubmit="return editar_datos_producto();">
				<input type="hidden" name="id_detalle_venta" id="id_detalle_venta_actualizar">
				<div class="modal-body"> 
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Producto</label>
								<input type="text" id="producto_actualizar" required="true" class="form-control" disabled="">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Precio</label>
								<input type="text" id="precio_producto" required="true" class="form-control" disabled="">
								<input type="hidden" id="precio_producto_hidden" name="precio">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Stock</label>
								<input type="text" id="estock_producto" required="true" class="form-control" disabled="">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label>Cantidad</label>
								<input type="number" name="cantidad" min="1" id="cantidad_producto" required="true" class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label id="label_usuario">Usuario</label>
								<input type="text" name="usuario" id="usuario_editar" required="true" class="form-control" >
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label id="label_contrasena">Contraseña</label>
								<input type="password" name="contrasena" id="contrasena_editar" required="true" class="form-control" >
							</div>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" id="guardar_actializar" >Guardar</button>

					<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->

</div>
<!--fin milton -->

<script type="text/javascript">
      function cargarventa(idventa,idvendedor,idsilla,opcion,nombremesas){
             
                           setTimeout(function(){
                          clearTimeout(time);
                            reload_urlp('Ventas/traerventas/'+idventa+'/'+idvendedor+'/'+idsilla+'/'+nombremesas);
                        },1000);
                       
          
                    return 0;

               
            }
	function eliminar_pedido(id){
		$.post("Pedido/preguntar_configuracion",function(permiso){
			if(parseInt(permiso) == 1){
				$("#eliminar_usuario").val("");
				$("#eliminar_contrasena").val("");
				$("#eliminar_usuario").removeAttr("disabled");
				$("#eliminar_contrasena").removeAttr("disabled");
				$("#eliminar_usuario").attr("type","text");
				$("#eliminar_div_usuario").removeAttr("hidden");
				$("#eliminar_div_contrasena").removeAttr("hidden");
				$("#eliminar_contrasena").removeAttr("hidden");
			}else{
				$("#eliminar_usuario").attr("disabled","disabled");
				$("#eliminar_contrasena").attr("disabled","disabled");
				$("#eliminar_usuario").attr("type","hidden");
				$("#eliminar_div_usuario").attr("hidden","hidden");
				$("#eliminar_div_contrasena").attr("hidden", "hidden");
				$("#eliminar_contrasena").attr("type","hidden");
			}
		});
		$("#formulario_total")[0].reset();
		$("#modal_eliminar").modal();
		$("#id_detalle_venta_modal").val(id);

	}

	function cambio(id) {
		if (id == 1) {
			$("#precio_canjeproducto").val(0);
			$("#precio_canjeproducto").attr('readonly', true);
		}
		if (id == 2) {
			$("#precio_canjeproducto").val($("#precio_canjeproducto_hidden").val());
			$("#precio_canjeproducto").removeAttr('readonly');
		}
		if ( id== 3) {
			$("#precio_canjeproducto").val($("#precio_canjeproducto_hidden").val());
		}
	}

	function actualizar_pedido(id,cantidad, precio,descripcion){
		$.post("Pedido/preguntar_configuracion",function(permiso){
			if(parseInt(permiso) == 1){
				$("#usuario_editar").val("");
				$("#contrasena_editar").val("");
				$("#usuario_editar").removeAttr("disabled");
				$("#contrasena_editar").removeAttr("disabled");
				$("#usuario_editar").attr("type","text");
				$("#label_usuario").removeAttr("hidden");
				$("#label_contrasena").removeAttr("hidden");
				$("#contrasena_editar").removeAttr("hidden");
			}else{
				$("#usuario_editar").attr("disabled","disabled");
				$("#contrasena_editar").attr("disabled","disabled");
				$("#usuario_editar").attr("type","hidden");
				$("#label_usuario").attr("hidden","hidden");
				$("#label_contrasena").attr("hidden", "hidden");
				$("#contrasena_editar").attr("type","hidden");
			}
			$.post("Pedido/estock_actualizar",{'id':id},function(data){
				$("#id_detalle_venta_actualizar").val(id);
				$("#estock_producto").val(data);
				$("#precio_producto").val(precio);
				$("#cantidad_producto").val(cantidad);
				$("#producto_actualizar").val(descripcion);
				$("#cantidad_producto").attr("onchange","validar_cantidad(99999999,this)");

				$("#modal_actualizar").modal();
			});
		})
	}

	function actualizarcanje(){
		if (parseFloat($("#cantidad_productocanje").val())  > parseFloat($("#estockcanje_productoi").val())) {
			$("#estockcanje_producto").val($("#estockcanje_productoi").val());
			$("#cantidad_productocanje").val(1);
			return 0;
		}


		if ($("#cantidad_productocanje").val() != '') { 
			cantidad = parseFloat($("#estockcanje_productoi").val()) - parseFloat($("#cantidad_productocanje").val());
			$("#estockcanje_producto").val(cantidad);
		}else{ 
			$("#estockcanje_producto").val($("#estockcanje_productoi").val());
		}
		
	}


	function particionarcanje(id,cantidad, precio,descripcion){
		$.post("Pedido/preguntar_configuracion",function(permiso){

				$("#precio_canjeproducto").val(0);
				$("#precio_canjeproducto_hidden").val(precio);
				$("#precio_canjeproducto").attr("readonly","readonly");
			document.getElementById("radio3").checked = true;
			$("#id_detalle_canje_actualizar").val(id);
			$("#estockcanje_producto").val(cantidad);
			$("#estockcanje_productoi").val(cantidad);
			$("#cantidad_productocanje").val(1);
			$("#producto_canjeactualizar").val(descripcion);
			actualizarcanje();
			//$("#cantidad_producto").attr("onchange","validar_cantidad("+data+",this)");
			$("#modal_canje").modal();
		});

	}

	function validar_cantidad(stock,t){
		cantidad=$(t).val();
		if(parseInt(cantidad)>stock){
			$(t).val(stock);
		}else if(parseInt(cantidad)<1){
			$(t).val("1");
		}
	}

	function editar_datos_producto(){
	  $("#guardar_actializar").attr("disabled",true);
	  $("#guardar_actializar").text("Editando...");
		$.post("Pedido/editar_datos",$("#formulario_editar").serialize(),function(data){
			if(data == 1){
				generar_notificacion("Se actualizo correctamente","EDITADO CORRECTAMENTE","success","");
			}else{
				generar_notificacion("ERROR","SE NECESITA PERMISO DE ADMINISTRADOR DE SEDE","error","");
			}
			$("#modal_actualizar").modal("hide");
			$("#guardar_actializar").attr("disabled",false);
	  $("#guardar_actializar").text("Guardar");

		});
		return false;
	}
	function editar_canje_producto() {
		$.post("Pedido/editar_canje_parte",$("#formulario_editarcanje").serialize(),function(data){
			if(data == 1){
				generar_notificacion("Se actualizo correctamente","EDITADO CORRECTAMENTE","success","");
			}else{
				generar_notificacion("ERROR","SE NECESITA PERMISO DE ADMINISTRADOR DE SEDE","error","");
			}
			$("#modal_canje").modal("hide");
		});
		return false;
	}
	function guardar_eliminar_datos()
	{

		$("#guardar_eliminar").attr("disabled",true);
		$("#guardar_eliminar").text("Eliminando...");

		$.post(base_url+"Pedido/eliminar_pedido_detalle",$("#formulario_total").serialize(),function(data){
			if(parseInt(data)==1){
				$("#modal_eliminar").modal("hide");
		$("#guardar_eliminar").attr("disabled",false);

				generar_notificacion("Se elimino correctamente","Se acepto la eliminacion del pedido","success","");
			}
			else
			{
		$("#guardar_eliminar").attr("disabled",false);

				generar_notificacion("error","El usuario que ingreso es incorrecto","error","");
			}

			$("#guardar_eliminar").text("Guardar");
		});

		return false;
	}



let time;
	$(function(){
		if(localStorage.getItem("ivg_venta")){
			if(localStorage.ivg_venta=="1")
			{
				$("#igv").prop('checked',true);
			}
		}

		var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
		$('.js-switch-1').each(function() {
			new Switchery($(this)[0], $(this).data());
		});

		time=setInterval(function(){ ver() 

		}, 1000);
	});

	function ver(){
		var html="";
		$.post(base_url+"Pedido/generar_ventas",{"buscar":$("#buscar").val()},function(data){
			if(data.length==0){
				$("#tabla_mostrar").hide();
				$("#no_pedido").empty().html('<center><img class="iderror" src="'+base_url+'/public/images/mesas/giphy.gif"" width="450">			<p style="margin: 0 0 0 0; font-size: 32px; font-weight: 700;">No sé encontraron Pedidos </p>			</center>');
			}else{
				$("#tabla_mostrar").show();
				$("#no_pedido").empty();

			}




			$('input[name="numero_venta[]"]').map(function () {
               //alert($(this).val());
               var id=$(this).val();
               valor=0;
               for (var i=0; i < data.length; i++) {

               	if(parseInt(id)==parseInt(data[i]["venta_idventas"])){

               		valor=1;
               	}
               }

               if(valor==0)
               {
               	$("#panel"+id).hide( "slow" );
               	$("#panel"+id).remove();
               }

           }).get();
			//$("#acordion_venta").empty();
			for (var i=0; i < data.length; i++) {

				var total=0;               
				for (var j=0; j < data[i]["lista"].length; j++) {
					total+=parseFloat(data[i]["lista"][j]["cantidad"]*data[i]["lista"][j]["precio"]);
				}

				var color="";
				var text_color="";
				if(parseFloat(data[i]["venta_estadococina"])==1){
					color=" rgba(33, 33, 33, 0.05)";
					text_color="#878787";
				}
				if(parseFloat(data[i]["venta_estadococina"])==2)
				{
					color="#28a745";
					text_color="#fff";
				}
				if( parseFloat(data[i]["venta_estado"])==3){
					color="#28a745";
					text_color="#fff";


				}	

				html='';	

				if($("#panel"+data[i]["venta_idventas"]).text()==""){										

					html+='	<div class="panel panel-default animated fadeInRight m-l-none m-r-none" id="panel'+data[i]["venta_idventas"]+'" >';
					html+='<input type="hidden" name="numero_venta[]" id="numero_venta[]" value="'+data[i]["venta_idventas"]+'">';
					html+='<div class="panel-heading "  id="color_'+data[i]["venta_idventas"]+'"  style="background: '+color+';font-color: #fff;" role="tab" id="heading_5">';
					html+='<a role="button" data-toggle="collapse" href="#collapse_'+data[i]["venta_idventas"]+'" aria-expanded="false" class="collapsed">';
					html+='<table width="100%">';
					html+='<tbody>';
					html+='<tr >';
					mesa_nombre="";
                   
					if(data[i]["mesa_id"]==1)
					{
						mesa_nombre="Delivery";
					}
					else{

						nombre_mesa="";
						if(data[i]["mesa_tipo"]=="0"){
							nombre_mesa="Mesa";
						}
							else{
								nombre_mesa="Llevar";
							}
						mesa_nombre=nombre_mesa+' '+data[i]["mesa_numero"]+data[i]["mesas_agrupas"];
								}
							html+='<th width="11%" style="color: #fff;"><button class="btn btn-danger btn-rounded btn-xs">'+mesa_nombre+'</button></th>';


							html+='<th width="32%" class="texto_ser'+data[i]["venta_idventas"]+'" style="color:'+text_color+'">Venta '+data[i]["venta_idventas"]+'['+data[i]["empleado_usuario"]+']-'+data[i]["cliente_nombres"]+'</th>';

							html+='<th width="11%"  class="texto_ser'+data[i]["venta_idventas"]+'" style="color: '+text_color+'" id="tiempo_total'+data[i]["venta_idventas"]+'"></th>';




							html+='<th width="21%" style=""><button id="mostrar_total'+data[i]["venta_idventas"]+'" class="btn btn-danger btn-rounded btn-xs">'+"s/ "+total.toFixed(2)+'</button></th>';
							html+='<th width="10%" id="lugar_boton'+data[i]["venta_idventas"]+'" style="color: '+text_color+'">';


							tipo='';


							//	html+='<button disabled="true" id="boton_cobro'+data[i]["venta_idventas"]+'" '+tipo+' class="btn btn-success" onclick="cobrar('+data[i]["venta_idventas"]+','+total.toFixed(2)+')">COBRAR</button></th>';

							html+='<div class="input-group-btn"><button type="button" class="btn btn-success" id="boton_pagar'+data[i]["venta_idventas"]+'" >Cobrar</button><button onclick="mostar_multi('+data[i]["venta_idventas"]+')" id="boton_multipagar'+data[i]["venta_idventas"]+'" type="button" class="btn  btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button><ul class="dropdown-menu" id="dropid">';
							if(parseInt(data[i]["venta_id_delivery"])==0){
								//html+='<li><a style="color:#000" onclick="multi_pagos('+data[i]["venta_idventas"]+')">Multifactura</a></li>';
							}
							html+='<li><a style="color:#000" onclick="eliminar_venta('+data[i]["venta_idventas"]+')">Eliminar</a></li>';
							html+='<li><a style="color:#000" onclick="valeconsumo('+data[i]["venta_idventas"]+')">Canjear Vales</a></li>';
//cargarventa(idventa,idvendedor,idsilla,opcion,nombremesas)
							let para=data[i]["venta_idventas"]+","+data[i]["mesa_empleado"]+",1,1,'Delivery'";
                          if(data[i]["mesa_id"]==1)
								{
							html+='<li><a style="color:#000" onclick="cargarventa('+para+')">Editar</a></li>';
								
								}

							html+='</ul></div>';



							html+='</tr>';
							html+='</tbody>';
							html+='</table>';
							html+='</a>'; 
							html+='</div>';

							html+='<div id="collapse_'+data[i]["venta_idventas"]+'" class="panel-collapse collapse " role="tabpanel" aria-expanded="false" style="height: 0px;">';

							html+='<div class="panel-body pa-15"> ';
							html+='<div class="row">';
							html+='<div class="col-md-1"></div>';
							html+='<div class="col-md-10">';

							if(parseFloat(data[i]["venta_monto_delivery"])>0){
								html+='<h6>monto por delivery:'+data[i]["venta_monto_delivery"]+'</h6>';
							}
							html+=' <table width="100%" style=" border: 1px solid black;">';
							html+='<thead >';
							html+='	<tr style=" border: 1px solid black;" >';
							html+='<th width="5%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">cant.</b></center></th>';
							html+='<th width="30%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">Producto</b></center></th>';
							html+='<th width="10%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">P.u</b></center></th>';
							html+='<th width="9%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">Total</b></center></th>';
							html+='<th width="10%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">Observaciones</b></center></th>';
							html+='<th width="25%" style=" border: 1px solid black;"><center><b style="font-weight: bold !important;">Opcion</b></center></th>';


							html+='</tr>';
							html+='</thead>';
							html+='<tbody id="tabla_datos'+data[i]["venta_idventas"]+'">';


							for (var j=0; j < data[i]["lista"].length; j++) {
								var tol=data[i]["lista"][j]["cantidad"]*data[i]["lista"][j]["precio"];
								html+=' <tr style=" border: 1px solid black;" >';
								html+='<td   style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["cantidad"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["producto_descripcion"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>s/ '+data[i]["lista"][j]["precio"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>s/ '+tol.toFixed(2)+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["descripcion"]+'</center></td>';
								//if (data[i]["lista"][j]["cantidad"] == 0 || data[i]["lista"][j]["descripcion"] == 'Canje') {
								//	datos='<button onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminarr</button> <button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button>';
								//}else{
									datos='<button onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminarr</button> ';
								//	'<button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button><button onclick="particionarcanje('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-info btn-xs">Canje</button>';
								//}
								
								if(data[i]["lista"][j]["detalle_estado_preparado"]==2)
								{
									datos='';
								}
								html+='<td  style=" border: 1px solid black;"><center>'+datos+'</center></td>';
								html+='</tr>';
							}
							html+='</tbody>';
							html+='</table>';
							html+='</div>';
							html+=' </div>';
							html+='</div>';
							html+='</div>';
							html+="</div>"; 
							$("#acordion_venta").append(html); 

						}else{
            	//alert("hola");
                 // console.log($("#color_"+data[i]["venta_idventas"]).css("background"));
                 $("#color_"+data[i]["venta_idventas"]).css("background",color);
                 $(".texto_ser"+data[i]["venta_idventas"]).css("color",text_color);
                 tiempo=data[i]["venta_pedidofecha"];
                //console.log(tiempo);
moment().locale('es');
                tiem= moment(tiempo, "YYYY-MM-DDTHH:mm:ss").fromNow();
                $("#tiempo_total"+data[i]["venta_idventas"]).text(tiem);

                boton="";
                total_monto=parseFloat(data[i]["venta_monto"]);
                if(parseFloat(data[i]["venta_estadococina"])==1)
                {

                	$("#boton_pagar"+data[i]["venta_idventas"]).attr("disabled",true);

                }

                else
                {
                	$("#boton_pagar"+data[i]["venta_idventas"]).attr("disabled",false);

                	if(parseFloat(data[i]["pago_multiple"])==1)
                	{
                		$("#boton_pagar"+data[i]["venta_idventas"]).attr("onclick","multi_pagos("+data[i]["venta_idventas"]+")");

                	}else{
                		var a="'"+data[i]["cliente_id"].toString()+"/"+data[i]["cliente_dni"].toString()+"/"+data[i]["cliente_nombres"]+"/1/-','"+data[i]["cliente_nombres"]+"',"+data[i]["ventas_idtipodocumento"]+","+parseInt(data[i]["venta_id_delivery"])+","+parseFloat(data[i]["venta_monto_delivery"]).toFixed(2)+","+data[i]["venta_estado_pagado"]+",'"+data[i]["cliente_direccion"]+"'";

									//function cobrar(id,monto,id_cliente,nombre,$tipo_comprabante,$id_delivery,$monto_delivery)



									$("#boton_pagar"+data[i]["venta_idventas"]).attr("onclick","cobrar("+data[i]["venta_idventas"]+','+total_monto.toFixed(2)+","+a+")");
								}
								
								
							}

							$("#mostrar_total"+data[i]["venta_idventas"]).text(total_monto.toFixed(2));
							for (var j=0; j < data[i]["lista"].length; j++) {
								var tol=data[i]["lista"][j]["cantidad"]*data[i]["lista"][j]["precio"];
								html+=' <tr style=" border: 1px solid black;" >';
								html+='<td   style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["cantidad"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["producto_descripcion"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>s/ '+data[i]["lista"][j]["precio"]+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>s/ '+tol.toFixed(2)+'</center></td>';
								html+='<td  style=" border: 1px solid black;"><center>'+data[i]["lista"][j]["descripcion"]+'</center></td>';
								if(data[i]["lista"][j]["detalle_estado_preparado"]==2)
								{
									if (data[i]["lista"][j]["cantidad"] == 0 || data[i]["lista"][j]["descripcion"] == 'Canje') {
										datos='<button  onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+' )" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminar</button> <button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button>';
									}else{
										datos='<button  onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+' )" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminar</button> <button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button><button onclick="particionarcanje('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-info btn-xs">Canje</button>';
									}
									
								}
								else{
									if (data[i]["lista"][j]["cantidad"] == 0 || data[i]["lista"][j]["descripcion"] == 'Canje') {
										datos='<button onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminar</button> <button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button>';
									}else{
										datos='<button onclick="eliminar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-danger btn-xs">eliminar</button> <button onclick="actualizar_pedido('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-primary btn-xs">editar</button><button onclick="particionarcanje('+data[i]["lista"][j]["id_detalle_venta"]+','+data[i]["lista"][j]["cantidad"]+','+data[i]["lista"][j]["precio"]+',\''+data[i]["lista"][j]["producto_descripcion"]+'\')" style="margin-top:10px;margin-bottom:10px;" class="btn btn-info btn-xs">Canje</button>';
									}

									

								}
								html+='<td  style=" border: 1px solid black;"><center>'+datos+'</center></td>';
								html+='</tr>';
							}

							$("#tabla_datos"+data[i]["venta_idventas"]).empty().append(html);


						}


					}   		
              //$("#acordion_venta").empty().append(html);         

          },"json");
}

function cobrar(id,monto,id_cliente,nombre,tipo_comprabante,id_delivery,monto_delivery,estado_pago,direccion){
	limpiar();
	actualizar_comprobante();
	mon = parseFloat(monto) - parseFloat(monto_delivery);
	$("#collapse_"+id).removeClass("in");   
	$("#cobrar_modal").modal();
	$("#total_pagar_modal").text(mon);
	$("#totalparapagar").val(mon);
	$("#total_paying").text("S/ "+mon);
	$("#dinero_entregado").val(mon);
	$("#balance").text("0.00");
	$("#boton_monto_dinero").text(mon);

	$("#id_modal_venta").val(id);
	if(parseInt(id_delivery)!=0){
		$("#mostrar_delivery").show();
		$("#monto_delivery").val(monto_delivery.toFixed(2));
		$("#tipo_comprabante").val(2);
		var dat=tipo_comprabante;
		$("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
		if(dat!=0)
		{

			$.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){

				if (data["estado"] == 1) {
					$("#comprobante").text("Nº "+data["correlativo"]);
					$("#submit-sale").attr("disabled",false);
					$("#submit-sale").text("Guardar"); 
				}else{
					generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
					$("#submit-sale").attr("disabled",true);
					$("#submit-sale").text("Guardar"); 
				}
      //$("#comprobante").text("Nº "+data);
  },'json');
		}else{
			$("#comprobante").text("Nº 001-1");
		}

		if(parseInt(estado_pago)==0)
		{
			$("#estado_pago").text("NO PAGADO");

		}else
		{
			$("#estado_pago").text("PAGADO");
			$("#forma_pago").val(2);
			$("#forma_pago option[value=1]").attr("disabled",true);
			$("#forma_pago option[value=3]").attr("disabled",true);
			$("#forma_pago option[value=4]").attr("disabled",true);
		} 

		$("#delivery_direccion").text(direccion);
		$("#tipo_pago option[value=2]").attr("disabled",true);
		$("#monto_delivery").attr("required",true);
		$("#id_delivery").attr("required",true);

	}
	deliverycosto();
	var select=$('#cliente');

	var option = new Option(nombre, id_cliente, true, true);
	select.append(option).trigger('change');

    // manually trigger the `select2:select` event
    select.trigger({
    	type: 'select2:select'
    });

}


</script>

<div class="modal fade" id="cobrar_modal"   role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg " >
		<form id="formulario_pago" onsubmit="return cobrar_venta()">
		<div class="modal-content"> 
			<div class="modal-header" style="    background-color: #4273a6!important;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
				<h4 class="modal-title" id="payModalLabel" style="color:white;">
				PAGAR VENTA </h4>
			</div>
			
				<div class="modal-body" style="background-color: #4273a6!important;">



					<input type="hidden" name="id_modal_venta" id="id_modal_venta" value="">
					<input type="hidden" name="monto_venta" id="monto_venta" value="">
					<div class="row">
						<div class="col-xs-4">
							<div class="form-group">
								<label for="note" style="color:white;">Tipo de Comprobante </label> 
								<select id="tipo_comprabante" name="tipo_comprabante" class="form-control " tabindex="-1" aria-hidden="true">
									<?php
									foreach ($data["tipo_documento"] as $key => $value) {
										echo "<option value='".$value["tipodoc_id"]."'>".$value["tipodoc_descripcion"]."</option>";
									} ?>
                                  
								</select>
							</div>
						</div>

						<div class="col-xs-4">
                             <div class="col-xs-4"><br> <label style="color:white;">IMPRESION POR CONSUMO</label></div>
								<div class="col-xs-4">
									<br>
									<input value="1" id="comprobante_detalle" name="comprobante_detalle" type="checkbox" data-size="small"  class="js-switch js-switch-1" data-color="#8BC34A"/>
								</div>
						</div>

						<div class="col-xs-4">
							<br>
							<h3 id="comprobante" style="color:#fff">Nº 001-1 </h3>
						</div>
					</div>








					<div class="row">
						<div class="col-xs-12">
							<div class="font16">
								<table class="table table-bordered table-condensed" style="margin-bottom: 0;">
									<tbody>
										<tr>
											<td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;">Articulos totales</td>
											<td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;" class="text-right"><span id="item_count" style="color: black;">1</span></td>
											<td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Total a Pagar</td>
											<input type="hidden" name="totalparapagar" id="totalparapagar" >
											<td width="25%" class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="total_pagar_modal" style="color: black;">0.00 </span></td>
										</tr>
										<tr>
											<td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Dinero Entrego</td>
											<td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="total_paying" style="color: black;">3,163.65</span></td>
											<td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Vuelto</td>
											<td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="balance" style="color: black;font-weight: bold;">0.00</span></td>
										</tr>
									</tbody>
								</table>

							</div>

							<div class="row">
								<div class="col-xs-4">
									<div class="form-group">
										<label for="amount" style="color:white;">Monto Entregado</label> <input  step="0.01" min="0" onchange="generar_vuelto()" onkeyup="generar_vuelto()" name="dinero_entregado" type="number" id="dinero_entregado" class="pa form-control kb-pad amount ui-keyboard-input ui-widget-content ui-corner-all" aria-haspopup="true" role="textbox">
									</div>
								</div>


								<div class="col-xs-4">
									<div class="form-group">
										<label for="paid_by" style="color:white;">Tipo de Pago</label>
										<select id="tipo_pago" name="tipo_pago" class="form-control " onchange="tipo_pago_mostrar()" tabindex="-1" aria-hidden="true">
											<?php foreach ($data["tipopago"] as $key => $value) {
												echo "<option value='".$value["tipo_pago_id"]."'>".$value["tipo_pago_descripcion"]."</option>";
											} ?>

										</select>
									</div>
								</div>
								<div class="col-xs-4">
									<div class="form-group">
										<label for="paid_by" style="color:white;">Forma de Pago</label>
										<select id="forma_pago" name="forma_pago" class="form-control " tabindex="-1" aria-hidden="true">
											<?php foreach ($data["formapago"] as $key => $value) {
												echo "<option value='".$value["for_id"]."'>".$value["for_descripcion"]."</option>";
											} ?>

										</select>
									</div>
								</div>

							</div>

							<div class="row">
								<div class="col-xs-6">
									<div class="form-group">
										<label style="color:white;">Seleccionar Cliente</label>
										<select id="cliente" class="form-control" name="cliente" onchange="cargar_direccion()" tabindex="-1" aria-hidden="true">
											<option value="">Seleccionar Cliente</option>
										</select>
									</div>
								</div>
								<div class="col-xs-1"><br>
									<button style="font-size: 15px;font-weight: bold;" id="nuevo" class="btn btn-success" type="button">
										+
									</button>
								</div>  
								<div class="col-xs-1">
									<div class="form-group mb-30">
										<label class="control-label mb-10 text-left" style="color:white;">IGV</label>
										<div class="checkbox checkbox-primary">
											<input onchange="chek_igv()" value="0.18" type="checkbox" class="form-control" name="igv" id="igv">
											<label for="igv">								
											</label>
										</div>
									</div>
								</div>
								<div class="col-xs-4">
									<div class="form-group">
										<label for="note" style="color:white;">Nota de pago</label>
										<input type="text" name="note" id="note" class="form-control">
									</div>
								</div>
							</div>
						<div class="row">
									<div class="col-md-2"> <label style="color:white;">Impresion Manual</label></div>
										<div class="col-md-1">
											<input value="1" id="comprobante_imprimir" name="comprobante_imprimir" type="checkbox" data-size="small"  class="js-switch js-switch-1" data-color="#8BC34A"/>
										</div>

									<div class="col-md-9">
									      <div class="form-group">
											

											<div class="input-group mb-3">
											<input type="hidden"  id="direccion_id" name="direccion_id" value="-">
											<input placeholder="DIRECCIÓN" type="search" autocomplete="off" name="direccion_descripcion" id="direccion_descripcion" class="form-control"  value="">
                                  

											 <div class="input-group-append">
											    <button class="btn-success btn" type="button" id="basic-addon2"
											    onclick="crear_direccion_cliente()">+</button>
											  </div>
											</div>
										</div>
										</div>
								</div>


							<div class="row">
							






								<div class="row" id="credito">
									<div class="col-xs-4">
										<div class="form-group">
											<label style="color:white;">Cuotas</label>
											<input type="text" autocomplete="off" name="cuotas" id="cuotas" onkeyup="crear_cronograma()" class="form-control">
										</div>
									</div>
									<div class="col-xs-4">
										<div class="form-group">
											<label style="color:white;">Intervalo de tiempo</label>	    
											<select class="form-control" id="intervalo" onchange="crear_cronograma()" name="intervalo" >
												<option value="">Seleccionar</option>
												<option value="1">Diario</option>
												<option value="2">Semanal</option>
												<option value="3">Quincenal</option>
												<option value="4" >Mensual</option>
											</select>   
										</div>
									</div>
									<div class="col-xs-12">
										<div id="cronograma"></div>
									</div>
								</div> 


							</div>

							<div id="mostrar_delivery">
								<div class="row">
									<div class="col-md-12"> <center><h5 style="color:white;">DELIVERY: <label id="estado_pago"></label></h5></center></div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<h6 >DIRECCION: <label id="delivery_direccion"></label></h6>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label style="color:white;">Monto Por delivery</label>
											<input type="number" min="0"  step="0.01" name="monto_delivery" onchange="deliverycosto()" onkeyup="deliverycosto()" id="monto_delivery" class="form-control">
										</div>
									</div>
									<!-- <div class="col-xs-6">
										<div class="form-group">
											<label style="color:white;">Seleccionar Deliverista</label>
											<select class="form-control" id="id_delivery" name="id_delivery">
												<option value="">selecionar</option>
												<?php foreach ($data["delivery"] as $key => $value) { ?>

												<option value="<?php echo $value["empleado_id"]; ?>"><?php echo $value["empleado_nombre_completo"]; ?> </option>
												<?php }?>
											</select>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>



				</div>

				<div class="modal-footer" style="    background-color: #4273a6!important;">
					<button type="button" class="btn btn-default pull-left" data-dismiss="modal"> Cerrar </button>
					<button class="btn btn-success" id="submit-sale">COBRAR</button>
				</div>
			</div>
		</form>
	</div>
</div>






<div id="nuevo_cliente" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="myModalLabel">Nuevo de Cliente</h5>
			</div>
			<div class="modal-body">
				
					<div class="row" >

						

                     <div class="col-md-12">
					
							<form id="formulario_cliente">
								<div class="row">

									<div class="col-md-6">
										<div class="form-group">
											<label>Tipo de Documento</label>
											<select class="form-control" name="tipo_documento_id" id="tipo_documento_id">
												<?php foreach ($data["tipo_documento_cliente"] as $key => $value) {?>
													<option value="<?php echo $value['tipo_cliente_id'] ?>">
														<?php echo $value['tipo_cliente_descripcion'] ?>
													</option>
												<?php } ?>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>DNI O RUC</label>
											<div class="input-group mb-3">
											<input type="text" autocomplete="off" name="ruc" id="ruc" class="form-control" required="required">
											 <div class="input-group-append">
											    <button onclick="consultar_externa()" class="btn-success btn" type="button" id="basic-addon3">Buscar</button>
											  </div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Nombre Completo o Razón Social</label>
											<input type="text" autocomplete="off" name="nombre" id="nombre" class="form-control" required="required">
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group">
											<label>Celular</label>
											<input type="text" autocomplete="off" name="celular" id="celular" class="form-control" >
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Direccion</label>
											<input type="text" autocomplete="off" name="direccion" id="direccion" class="form-control" >
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Correo</label>
											<input type="email" autocomplete="off" name="correo" id="correo" class="form-control" >
										</div>
									</div>
								</div>
							</form>
							<div class="row">
								<center><button class="btn btn-primary" id="guardar_cliente">Guardar</button></center>
							</div>

						</div>
						

					</div>
				</div>


			</div>
			<div class="modal-footer">

			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>











<div id="myModal" class="modal fade in"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="myModalLabel">Eliminar Pedido</h5>
			</div>
			<form id="formulario" onsubmit="return guardar_eliminar_pedido()">
				<input type="hidden" value="" id="id_detalle_venta" name="id_detalle_venta">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Ingrese el Motivo de Eliminar Pedido</label>
								<input type="text" required="true" name="motivo_modal" id="motivo_modal" class="form-control">
							</div>
						</div>

				<div class="col-md-6" id="eliminar_div_usuario_total">
             		<div class="form-group">
             			<label>Usuario</label>
             			<input type="text" name="eliminar_usuario_total" autocomplete="off" id="eliminar_usuario_total" class="form-control" required="true">
             		</div>
             	</div>
             	<div class="col-md-6" id="eliminar_div_contrasena_total">
             		<div class="form-group">
             			<label>Contraseña</label>
             			<input type="password" name="eliminar_contrasena_total" autocomplete="off" id="eliminar_contrasena_total" class="form-control" required="true">
             		</div>
             	</div>





					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-success" id="boton_aceptar_eliminar">Aceptar</button>
				</div>
			</form>
		</div>
	</div>
</div>






<div id="modal_direccion_cliente" class="modal fade bs-example-modal-sm in" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="mySmallModalLabel">GUARDAR DIRECCIÓN (<label id="modal_nombre_direccion"></label>)</h5>
			</div>
			<form id="formulario_direccion_cliente" onsubmit="return guardar_direccion_cliente()">
				<div class="modal-body"> 
					<div class="row">
						<input type="hidden" value="" name="id_cliente_direccion" id="id_cliente_direccion">
                    
             	<div class="col-md-12">
             		<div class="form-group">
             			<label>Direccción</label>
             			<input type="text" id="fdireccion_descripcion" name="fdireccion_descripcion" required="true" class="form-control">
             			
             		</div>
             	</div>

             

             </div>

         </div>
         <div class="modal-footer">
         	<button type="submit" class="btn btn-success" id="btn_guardar_direccion_cliente" >Guardar</button>

         	<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
         </div>
     </form>
 </div>
 <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

</div>








<script src="<?php echo base_url(); ?>public1/js/select2.min.js"></script>



<script type="text/javascript">

	function consultar_externa()
{

//	https://api.selvafood.com/api/consultaruc/10752705866
//https://api.selvafood.com/api/consultarreniec/75270586
let tipo_documento=$("#tipo_documento_id").val();
let documento=$("#ruc").val();
if(tipo_documento=="1")
{

 if(documento.length!=8)
 {

alertainfo("Alerta","Tiene que tener al menos 8 digitos");
 	return false;
 }

 $("#basic-addon3").attr("disabled",true);
 $("#basic-addon3").text("buscando...");


fetch('https://api.selvafood.com/api/consultarreniec/'+documento,{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({}),
        cache: 'no-cache'
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        console.log('data = ', data);
		 $("#basic-addon3").attr("disabled",false);
		 $("#basic-addon3").text("buscar");
        if(data["ok"])
        {    
        	let datos=data["datos"];
        	//$("#nombre").val('');
        	console.log(datos);
        	var obj = JSON.parse(datos);
        	if(obj["success"])
        	{
        		//alert(obj["result"]["nombre"]);
         		 $("#nombre").val(obj["result"]["nombre"]+" "+obj["result"]["paterno"]+" "+obj["result"]["materno"]);
        	}else{
        	alertainfo("Alerta","Se genero un error en la busqueda");

        	}
        }else{
        	alertainfo("Alerta","Se genero un error en la busqueda");

        }
    })
    .catch(function(err) {
        console.error(err);
    });






}else{


 if(documento.length!=11)
 {
 	
alertainfo("Alerta","Tiene que tener al menos 11 digitos");

 	return false;
 }

  $("#basic-addon3").attr("disabled",true);
 $("#basic-addon3").text("buscando...");
fetch('https://ruc.selvafood.com/api/consultaruc/'+documento,{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({}),
        cache: 'no-cache'
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        console.log('data = ', data);
         $("#basic-addon3").attr("disabled",false);
 $("#basic-addon3").text("buscar");
        if(data["ok"])
        {    
        	let obj=data["datos"];
        	//$("#nombre").val('');
        	//console.log(datos);
        	//var obj = JSON.parse(datos);
          $("#nombre").val(obj["razon_social"]);
          if(obj["nombre_via"]!="-"){

             $("#direccion").val(obj["tipo_via"]+" "+obj["nombre_via"]+" NRO "+obj["numero"]);

          }
        	/*if(obj["success"])
        	{
        		//alert(obj["result"]["nombre"]);
         		 

        	}else{
        	alertainfo("Alerta","Se genero un error en la busqueda");

        	}*/
        }else{
        	alertainfo("Alerta","Se genero un error en la busqueda");

        }
    })
    .catch(function(err) {
        console.error(err);
    });










}
}
	function deliverycosto() { 
		if (isNaN(parseFloat($("#monto_delivery").val()) ) ) {
			$("#total_pagar_modal").text(parseFloat($("#totalparapagar").val()));
			generar_vuelto(); 
		}else{
			dinero = parseFloat($("#totalparapagar").val()) + parseFloat($("#monto_delivery").val());
			$("#total_pagar_modal").text(dinero);
			$("#dinero_entregado").val(dinero);
			generar_vuelto();
		}

	}

	function guardar_eliminar_pedido()
	{

		$("#boton_aceptar_eliminar").text("Eliminando...");
		$("#boton_aceptar_eliminar").attr("disabled",true);
		$.post(base_url+"Pedido/eliminar_pedido",$("#formulario").serialize(),function(data){

			if(parseInt(data)==1)
			{
				generar_notificacion("Se realizo correctamente","El pedido se elimino correctamente ","success","");
			}else{
				generar_notificacion("Error","Se genero un error al eliminar","error","");

			}
			$("#myModal").modal("hide");
			$("#boton_aceptar_eliminar").text("Aceptar");
			$("#boton_aceptar_eliminar").attr("disabled",false);
		});

		return false;
	}


	function eliminar_venta(id_venta){

			$.post("Pedido/preguntar_configuracion",function(permiso){
			if(parseInt(permiso) == 1){
				$("#eliminar_usuario_total").val("");
				$("#eliminar_contrasena_total").val("");
				$("#eliminar_usuario_total").removeAttr("disabled");
				$("#eliminar_contrasena_total").removeAttr("disabled");
				$("#eliminar_usuario_total").attr("type","text");
				$("#eliminar_div_usuario_total").removeAttr("hidden");
				$("#eliminar_div_contrasena_total").removeAttr("hidden");
				$("#eliminar_contrasena_total").removeAttr("hidden");
			}else{
				$("#eliminar_usuario_total").attr("disabled","disabled");
				$("#eliminar_contrasena_total").attr("disabled","disabled");
				$("#eliminar_usuario_total").attr("type","hidden");
				$("#eliminar_div_usuario_total").attr("hidden","hidden");
				$("#eliminar_div_contrasena_total").attr("hidden", "hidden");
				$("#eliminar_contrasena_total").attr("type","hidden");
			}
		});
		$("#collapse_"+id_venta).collapse('show');
		$("#myModal").modal();
		$("#id_detalle_venta").val(id_venta);
		$("#motivo_modal").val("");
	}

	function valeconsumo(id_venta){
		$.confirm({
			title: '¿Desea realizar el canje?',
			content: 'Todo este pedido será tomado como un vale de consumo!',
			buttons: {
				pedido: {
					text: 'Aceptar',
					btnClass: 'btn-success',
					keys: ['enter', 'shift'],
					action: function(){
						llamarfuncion(id_venta);
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

	function llamarfuncion(id){
		$.post(base_url+"Pedido/canjearvale",{"id_venta" : id },function(data){
			var url=base_url+"pedido/mostrar_comprobante/"+id;
			var a = document.createElement("a");
			a.target = "_blank";
			a.href = url;
			a.click();
		},'json');
	}


	$("#guardar_cliente").click(function(){
		$(this).attr("disabled",true);
		$.post(base_url+"Pedido/guardar_cliente",$("#formulario_cliente").serialize(),function(data){
			$('#formulario_cliente')[0].reset();
			$("#nuevo_cliente").modal("hide");
			$("#guardar_cliente").attr("disabled",false);

		});
	});
	$("#guardar_empresa").click(function(){
		$(this).attr("disabled",true);
		$.post(base_url+"Pedido/guardar_cliente",$("#formulario_empresa").serialize(),function(data){
			$('#formulario_empresa')[0].reset();
			$("#nuevo_cliente").modal("hide");
			$("#guardar_empresa").attr("disabled",false);

		});
	});
	$(function(){
		$("#credito").hide();
	});

	$("#nuevo").click(function(){
		$("#nuevo_cliente").modal();
	});

	function generar_vuelto()
	{
		var monto_pagar=0;
		monto_pagar=parseFloat($("#total_pagar_modal").text());

		dinero=parseFloat($("#dinero_entregado").val());
		vuelto=dinero-monto_pagar;
  	//alert(vuelto);
  	$("#total_paying").text("s/. "+dinero.toFixed(2));
  	$("#balance").text(vuelto.toFixed(2));

  }


  function cobrar_venta()
  {

  	if($("#cliente").val()==""){
  		generar_notificacion("ERROR","SELECCIONAR CLIENTE POR FAVOR","error","");
  		return false;
  	}

 /*if($("#tipo_comprabante").val()=="2" || $("#tipo_comprabante").val()=="4"){
 
 	 if($("#cliente").val()=="0"){
  		generar_notificacion("ERROR","SELECCIONAR CLIENTE POR FAVOR VALIDO","error","");
  		return false;
  	   }
  	}*/
 


  	dat=$("#forma_pago").val();
  	monto_pagar=parseFloat($("#total_pagar_modal").text());
  	if(parseFloat(dat)==99){
  		$("#submit-sale").text("Iniciando Tarjetero"); 
  		pagar(1,1,monto_pagar,'<?php echo $data["empresa"][0]["empresa_razon_social"]?>');
  	}else{
  		monto=0;
  		monto=parseFloat($("#balance").text());
  		$("#submit-sale").attr("disabled",true);
  		$("#submit-sale").text("Procesando..."); 
  		if(monto>=0)
  		{

  			generar_venta();
  		}
  		else{
  			generar_notificacion("ERROR","NO SE PUEDE GENERAR LA VENTA PORQUE EL MONTO ENTREGADO","error","");
  			$("#submit-sale").attr("disabled",false);
  			$("#submit-sale").text("COBRAR"); 
  		}
  	}

  	return false;
  }






  $('#cliente').select2({
  	ajax: {
  		url: base_url+'pedido/buscar_cliente1',
  		dataType: 'json',
  		placeholder: 'Buscar Cliente',
  		maximumSelectionLength: 10,

  		data: function (params) {
  			return {
                    q: params.term, // search term
                    page: params.page,
                    id: $("#tipo_comprabante").val(),
                    tipo_pago:$("#tipo_pago").val(),
                    totalpago: $("#total_pagar_modal").text()
                };
            },
            processResults: function (data, params) {

                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used


                return {
                	results: data.results

                };
            },
            cache: true
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
},
     escapeMarkup: function (markup) { return markup; }, // let our custom formatter work 
        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection, // omitted for brevity, see the source of this page
        language: {

        	noResults: function() {

        		return "No hay resultado";        
        	},
        	searching: function() {

        		return "Buscando..";
        	}
        }});




  function formatRepo (repo) 
  {
  	if (repo.loading) return repo.text;
  	var markup="";
  	markup += "<h5 style='font-size:15px;'>"+repo.text + "</h5>" ;
  	markup += "<h6 style='font-size:12px;'>"+repo.documento + "</h6>" ;
  	return markup;
  }

    // Format selection
    function formatRepoSelection (repo) {
    	return repo.text || repo.documento;
    }

   

    function actualizar_comprobante()
    {


      	var dat= $("#tipo_comprabante").val();
    	$("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
    	if(dat!=0)
    	{
    		$.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){

    			if (data["estado"] == 1) {
    				$("#comprobante").text("Nº "+data["correlativo"]);
    				$("#submit-sale").attr("disabled",false);
    				$("#submit-sale").text("Guardar"); 
    			}else{
    				generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
    				$("#submit-sale").attr("disabled",true);
    				$("#submit-sale").text("Guardar"); 
    			}
      //$("#comprobante").text("Nº "+data);
  			},'json');
    	}else{
    		$("#comprobante").text("Nº 001-1");
    	}


    }

    $("#tipo_comprabante").change(function(){

    	var dat=$(this).val();
    	$("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
    	if(dat!=0)
    	{
    		$.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){

    			if (data["estado"] == 1) {
    				$("#comprobante").text("Nº "+data["correlativo"]);
    				$("#submit-sale").attr("disabled",false);
    				$("#submit-sale").text("Guardar"); 
    			}else{
    				generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
    				$("#submit-sale").attr("disabled",true);
    				$("#submit-sale").text("Guardar"); 
    			}
      //$("#comprobante").text("Nº "+data);
  },'json');
    	}else{
    		$("#comprobante").text("Nº 001-1");
    	}
    });

    $("#forma_pago").change(function(){
    	$("#submit-sale").text("COBRAR");
    });

    $(function () { 
    	validarcaja(); 
    }); 

    function chek_igv()
    {

    	if($("#igv").prop('checked')){
    		localStorage.setItem("ivg_venta", "1");

    	}else{
    		localStorage.setItem("ivg_venta", "0");

    	}

    }



    function culqi() {

    if(Culqi.token) { // ¡Token creado exitosamente!
        // Get the token ID:
        var token = Culqi.token.id;
        var email= Culqi.token.email;
        var diner=$("#total_pagar_modal").text();
       // alert('Se ha creado un token:'+$("#merchant_order_id").val());
       $("#submit-sale").attr("disabled",true);
       $("#submit-sale").text("Procesando..."); 
       $.post(base_url+"public/pagar_culqi.php",{"email":email,"token":token,"dinero": parseFloat(diner)},function(data){

       	if(data=="1"){

       		generar_venta();
       	}
       	if(data=="2"){
       		$("#submit-sale").attr("disabled",false);
       		$("#submit-sale").text("COBRAR"); 


       		generar_notificacion("ERROR","ERROR AL MOMENTO DE INGRESA LA TARJETA","error","");
       	}
       });


    }else{ // ¡Hubo algún problema!
        // Mostramos JSON de objeto error en consola
        console.log(Culqi.error);
        alert(Culqi.error.mensaje);
    }
};


function limpiar()
{


	// $("#id_tipocliente option[value="+ data.id_tipocliente +"]").attr("selected",true);
	document.getElementById("tipo_comprabante").selectedIndex = "0";
	document.getElementById("tipo_pago").selectedIndex = "0";

	document.getElementById("forma_pago").selectedIndex = "0";

	//$("#tipo_comprabante option[value=0]").attr("selected",true);

	//$("#cliente option[value='']").attr("selected",true);
	
	$("#comprobante").text("Nº 001-1");
	$("#dinero_entregado").val(0.00);

	$("#cronograma").empty();
	$("#cuotas").val("");

	document.getElementById("intervalo").selectedIndex = "0";
	$("#credito").hide();

	$("#forma_pago").attr("disabled",false);
	$("#mostrar_delivery").hide();
	$("#monto_delivery").val("");
	//$("#id_delivery").val(0);
	// document.getElementById("id_delivery").selectedIndex = "0";
	$("#tipo_pago option[value=2]").attr("disabled",false);
	$("#forma_pago option[value=1]").attr("disabled",false);
	$("#forma_pago option[value=3]").attr("disabled",false);
	$("#forma_pago option[value=4]").attr("disabled",false);
	$("#cuotas").attr("required",false);
	$("#intervalo").attr("required",false);
	$("#monto_delivery").attr("required",false);
	$("#id_delivery").attr("required",false);
	
}

function multi_pagos(id_venta)
{

	var url=base_url+"Multifactura/particionarventa/"+id_venta;
	var a = document.createElement("a");
	a.target = "_blank";
	a.href = url;
	a.click();

}

function mostar_multi(id) {
	

	$("#collapse_"+id).collapse('show');
	/*$("#color_"+id).addClass("activestate");*/
}

function crear_cronograma()
{
	if($("#intervalo").val()!="" && $("#cuotas").val()!=""){
		$("#cronograma").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
		$.post(base_url+"compra/cronograma_prestamo",
		{
			"fecha_compra":$("#fecha_venta").val(),
			"cuotas":$("#cuotas").val(),
			"monto":$("#total_pagar_modal").text(),
			"intervalo":$("#intervalo").val()
		},
		function(data){

			$("#cronograma").empty().html(data);

		});
	}else{
		$("#cronograma").empty();
	}
}
function tipo_pago_mostrar(){
	
	var dat=$("#tipo_pago").val();

	if(parseInt(dat)==1){

		$("#credito").hide();
		$("#forma_pago").attr("disabled",false);
		$("#cuotas").attr("required",false);
		$("#intervalo").attr("required",false);
	}
	else{
		$("#credito").show();
		$("#forma_pago").attr("disabled",true);
		$("#cuotas").attr("required",true);
		$("#intervalo").attr("required",true);

	}

}

function cantdidad_validar(cantidad, t){
	var cant=$(t).val();
	if(cantidad < parseInt(cant)){
		$(t).val(cantidad);
	}else if (parseInt(cant) < 1){
		$(t).val("1");
	}
}



</script>


</style>
