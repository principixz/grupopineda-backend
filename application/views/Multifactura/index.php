 
<style>
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
.fblock {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #DDD;
	opacity: .35;
	filter: Alpha(Opacity=35);
}
.tr
{
	background: rgba(66, 190, 86, 0.92);
	opacity: 0.5;
	filter: Alpha(Opacity=50);
}
.ui-widget-header {
	border: 1px solid #ddd;
	background: #ddd  50% 50% repeat-x;
	color: #444;
	font-weight: bold;
}
#agregar {
	border: 1px solid #ddd;
	background: #f6f6f6 50% 50% repeat-x;
	font-weight: bold;
	color: #0073ea;
}
#agregar_c{
	float: right;right: 20px;width: 120px;height: 40px;font-size: 12px;margin-bottom: 5px;
}
#agregar_c:hover {
	border: 1px solid #0073ea;
	background: #0073ea 50% 50% repeat-x;
	font-weight: bold;
	color: #fff;
}
.ui-button-text-icon-primary .ui-button-text, .ui-button-text-icons .ui-button-text {
	padding: 0px;
}
.letrastd{
	font-style: oblique;
	font-weight: bolder;
	font-family: monospace;
	text-transform: uppercase;
}
#contenedor {
	margin: 0 auto;
	display: block;
	width: 22px;
	height: 22px;
	border: solid 1px rgba(0, 0, 10, 0.5);
	border-radius: 5px;
	position: relative;
}
#contenedor label {
	height: 20px;
	width: 20px;
	z-index: 0;
	display: inline-block;
	position: absolute;
	top: 0;
	left: 0;
}
#contenedor label div {
	height: 20px;
	width: 20px;
	border: solid 2px rgba(0, 0, 10, 0.6);
	margin: 0px;
	border-radius: 50%;
	transform: rotate(45deg);
	transition: all 100ms ease-in-out, border 50ms ease 100ms;
}
#contenedor input {
	height: 20px;
	/* width: 20px; */
	margin: 0;
	opacity: 0;
	z-index: 1;
	position: relative;
	cursor: pointer;
}
#contenedor input:checked + label > div {
	border-radius: 0;
	border-top: 0;
	border-left: 0;
	border-color: rgba(227, 71, 71, 0.9);
	height: 15px;
	width: 5px;
	margin-top: 3px;
	margin-left: 7px;
	transform: rotate(40deg);
	transition: all 150ms ease-in-out;
}

.titulosop{
	text-align: left;
	width: 170px;
	font-style: oblique;
	font-size: 18px;
	font-weight: bolder;
	font-family: cursive;
	text-transform: uppercase;
}
</style>

<div id="container">
	<fieldset class="ui-widget ui-widget-content" style="">
		<legend class="ui-widget-content ui-widget-header" style="font-style: oblique;font-weight: bolder; font-family: monospace;font-size: 2em;border: 1px solid #822424;
		background: #73d187 50% 50% repeat-x;color: #080707;"><center>Administración Cobro</center></legend>

		<div style="margin: 10px auto;width: 612px;float:left;padding-left: 8px;">
			<form id="filtrar_grilla" style="display: inline-block;width: 97%;margin-right: 0px;">

				<fieldset class="ui-widget ui-widget-content" style="margin-top: 5px;"> 
					<legend style="font-style: oblique;font-weight: bolder;font-family: monospace;font-size: 1.4em;border: 1px solid #111111;background: #73d187 50% 50% repeat-x;color: #080707;" class="ui-widget-header ui-corner-all"><center>COBRAR <?php echo $data["venta"]->mesa_numero.'-'.$data["venta"]->silla_descripcion;  ?>  </center></legend>
					<div style="border: solid 1px #CCC; margin-top: 5px;">
						<table id="" width="100%" style="border:0px solid #ccc; font-size:14px; margin-bottom:5px;border-spacing: 0;">
							<tr class='ui-widget-header tr-head' style='font-style: oblique;font-weight: bolder;font-family: monospace;border: 1px solid #111111;background: #8a8a8f 50% 50% repeat-x;color: #1f1e20;border-bottom: 1px solid #382ba5;'>
								<td style="padding-bottom:8px;width: 12%;">Cantidad</td>
								<td style="width:10%">Saldo</td>
								<td style="width:40%">Descripcion</td>
								<td style="width:15%">Precio U</td>
								<td style="width:15%">Importe</td>
								<td style="width:15%">Incluir</td>
								<td style="width:15%">Detalle</td>
							</tr>
						</table>
					</div>
					<div style="overflow-y: auto; overflow-x: hidden; height: 320px; border: solid 1px #CCC;background:#fff;">
						<table id="productos_vta" width="100%" style="border:0px solid #ccc; font-size:14px; margin-bottom:5px;">
							<tr>
								<td style="width:12%"> 
									<input type="hidden" name="id_venta_g" id="id_venta_g" value="<?php echo $data["venta"]->venta_idventas; ?>" />
									<input type="hidden" name="cod_moso_g" id="cod_moso_g" value="<?php echo $data["venta"]->venta_codigomozo; ?>" />
									<input type="hidden" name="codigo_mesa" id="codigo_mesa" value="<?php echo $data["venta"]->codigoubicacion ?>" />
								</td>
								<td style="width:10%"></td>
								<td style="width:40%"></td>
								<td style="width:15%"></td>
								<td style="width:15%"></td>
								<td style="width:15%"></td>
								<td style="width:15%"></td>
							</tr>
							<tbody id="productos_vta_tbody">
								<?php 
								$total = 0;
								$saldo = 0;
								foreach ($data["detalleventa"] as $key => $value) {
									$t = $value['precio'] * $value['cantidad'];
									$treal = $value['precio'] * $value['real'];
									$temp = $value['precio'] * $value['cantidad_temporal'];
									$total = $total+$treal;
									$saldo=$saldo+$temp;
									if( $value['cantidad'] == 0){
										$class="tr";
										$disabled="disabled='disabled'";
									}else{
										$class="";
										$disabled="";
									}
									?> 
									<tr class="<?php echo $class ?>">
										<td class="p-cantidad_r letrastd">
											<?php echo sprintf("%.2f",$value['cantidad']); ?> 
										</td>
										<td class="p-cantidad letrastd">
											<?php echo sprintf("%.2f",$value['cantidad']); ?> 
										</td>
										<td class="p-descripcion letrastd">
											<input type="hidden" name="codigo_producto[]" id="codigo_producto[]" class="codigo_producto" value="<?php echo  $value['cod_producto_venta']; ?>" />
											<input type="hidden" name="codigo_deventa[]" id="codigo_deventa[]" class="codigo_deventa" value="<?php echo  $value['id_detalle_venta']; ?>" />
											<!--codigo_producto en si es cod_producto_venta-->
											<input type="hidden" name="descripcion[]" id="descripcion[]" class="descripcion" value="<?php echo $value["producto_descripcion"]; ?>" />
											<input type="hidden" name="precio_min[]" id="precio_min[]" class="precio_min" value="<?php echo $value["precio"]; ?>" />
											<input type="hidden" name="cantidad_real[]" id="cantidad_real[]" class="cantidad_real" value="<?php echo $value["real"]; ?>" />
											<input type="hidden" name="cantidad_ant[]" id="cantidad_ant[]" class="cantidad_ant" value="<?php echo $value["cantidad"]; ?>" />
											<input type="hidden" name="cantidad[]" id="cantidad[]" class="cantidad" value="<?php echo $value["cantidad"]; ?>" />
											<input type="hidden" name="precio[]" id="precio[]" class="precio" value="<?php echo $value["precio"]; ?>" />
											<input type="hidden" name="importe[]" id="importe[]" class="importe" value="<?php echo $value['precio'] * $value['cantidad']; ?>" />
											<input type="hidden" name="obs[]" id="obs[]" class="obs" value="<?php echo $value['observaciones'] ; ?>" />
											<input type="hidden" name="estado_pedido[]" id="estado_pedido[]" class="estado_pedido" value="<?php echo $value['estado_cuenta'] ; ?>" />
											<input type="hidden" name="agrupado[]" id="agrupado[]"  class="agrupado"value="S" />
											<input type="hidden" name="id_detalle_producto[]" id="id_detalle_producto[]"  class="id_detalle_producto" value="0" />
											<?php echo sprintf("%.2f",$value['cantidad']).'-'.$value["producto_descripcion"]; ?>
										</td>
										<td  class="letrastd" style="text-align: center;"><?php echo $value["precio"]; ?></td>
										<td class="p-precio letrastd" style="text-align: center;"><?php echo sprintf("%.2f",$t);  ?> </td>
										<td class="letrastd" id="contenedor" style="text-align: center;">   
											<input type="checkbox" class="check incluir readonly cblock" name="incluir[]"  id="incluir<?php echo $key ?>"   value="1"   style="margin: 0;padding: 0;margin-left: 0px;" <?php echo $disabled ?> >
                        					<label for="incluir<?php echo $key ?>"></label>

										 
										</td>
										<td class="letrastd"> 
											<div style="position: relative;">
												<input type="text" name="cant[]" id="cant[]" class="cant readonly " style="margin: 0; padding: 0; margin-left: 10px;width: 40px;text-align: right;" value="">
												<div class="fblock"  style="display: block"></div>
											</div>
										</td>
									</tr>
									<?php } ?>
								</tbody>
								<tr>
									<td colspan="6" style="height: 30px;"></td>
								</tr>

							</table>
						</div>
						<div style="border: solid 1px #CCC; margin-top: 5px;">
							<table id="" width="100%" style="border:0px solid #ccc; font-size:14px; margin-bottom:5px;">
								<tr>
									<td></td>
									<td style="width: 200px;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="width: 85px;"></td>
								</tr>
								<tr>
									<td class='ui-widget-header tr-head titulosop'  style="text-align:left;">CUENTA MESA</td>
									<td colspan="4"></td>
									<td class='ui-widget-header tr-head titulosop'  style="text-align:right;">SALDO MESA</td>
								</tr>
								<tr>
									<td class="letrastd" style="text-align: center;font-weight: 700;">
										S/<?php 
										echo sprintf("%.2f",$total); 
										$saldor = $total - $saldo;
										?> <!-- {$total|string_format:"%.2f"}{$saldor=$total-$saldo} -->
									</td>
									<td colspan="4"></td>
									<td  id="td_total_venta" class="letrastd" style="text-align:right;font-weight: 700;">S/<?php echo sprintf("%.2f",$saldor);  ?> 

									</td>
									<input type="hidden" id="td_total_venta_inp" name="td_total_venta_inp" value="<?php echo sprintf("%.2f",$saldor);  ?>" />
									<input type="hidden" id="total_venta" name="total_venta" value="<?php echo sprintf("%.2f",$total);  ?>" />
								</tr>
								<tr>
									<td colspan="3"><!--<button id="dividir_c"style="float: left;left: 20px;" >Dividir Cuenta</button>--></td>
									<td colspan="3">
										<button id="agregar_c" style="" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button" aria-disabled="false">
											<span class="fa fa-opencart"></span>
											<span class="ui-button-text">Agregar Cuenta</span>
										</button>
									</td>
								</tr>
							</table>
						</div>

					</fieldset>

				</form> 
			</div>
			<div style="margin: 10px auto;width: 100%;/* padding-left: 4px; *//* padding: 0px 0px 0px 32px; */">
				<form id="filtrar_grilla_cuentas" style="/* display: inline-block; *//* width: 95%; */">
					<fieldset class="ui-widget ui-widget-content" style="margin-top: 5px;"> 
						<legend style="font-style: oblique;font-weight: bolder;font-family: monospace;font-size: 1.4em;border: 1px solid #111111;background: #73d187 50% 50% repeat-x;color: #080707;" class="ui-widget-header ui-corner-all"><center>CUENTAS</center> </legend>
						<div style="border: solid 1px #CCC; margin-top: 5px;">
							<table id="" width="100%" style="border:0px solid #ccc; font-size:14px; margin-bottom:5px;border-spacing: 0;">
								<tr class='ui-widget-header tr-head' style='font-style: oblique;font-weight: bolder;font-family: monospace;border: 1px solid #111111;background: #8a8a8f 50% 50% repeat-x; color: #1f1e20;border-bottom: 1px solid #382ba5;'>
									<td style="padding-bottom:8px;text-align: center;width: 18%">Cuenta</td>
									<td style="width: 15%;">Cantidad</td>
									<td style="width: 35%;">Descripcion</td>
									<td style="text-align: center;width: 15%;">Precio U</td>
									<td style="text-align: center;width: 20%;">Importe</td>
									<td style="width: 10%;"></td>
								</tr>
							</table>
						</div>
						<div id="div_cuentas" style="overflow-y: auto; overflow-x: hidden; height: 320px; border: solid 1px #CCC;background:#fff">

						</div>
						<div style="border: solid 1px #CCC; margin-top: 5px;">
							<table  width="100%" style="border:0px solid #ccc; font-size:14px; margin-bottom:5px;">
								<tr>
									<td colspan="5"></td>
									<td class='ui-widget-header tr-head titulosop'  style="text-align:right;width: 220px;">CUENTA ASIGNADA</td>
								</tr>
								<tr>
									<td colspan="6"  id="td_total_cuentas_" class="letrastd" style="text-align:right;font-weight: 700;">S/<!-- {$saldo|string_format:"%.2f"} --></td>

								</tr>
								<tr>
									<td colspan="3">&nbsp;</td>
									<td colspan="3"><!--<button id="cobrar_cuentas" style="float: right;right: 20px;">Cobrar</button>--></td>
								</tr>
							</table>
						</div>
					</fieldset>
				</form>

			</div>
		</fieldset>
		<form id="frm_cobrar_cuentas" name="frm_cobrar_cuentas" title="Cobranza">
			<div id="accordion-resizer" class="ui-widget-content">
				<div id="accordion" class="accordion_cuentas">

				</div>

			</div>
		</form>





		<div class="modal fade" id="cobrar_modal"    role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg " >
				<div class="modal-content"> 
					<div class="modal-header" style="    background-color: #4273a6!important;">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
						<h4 class="modal-title" id="payModalLabel" style="color:white;">
						PAGAR VENTA </h4>
					</div>
					<div class="modal-body" style="    background-color: #4273a6!important;">


						<form id="formulario_pago">
							<input type="hidden" name="id_modal_venta" id="id_modal_venta" value="">
							<input type="hidden" name="monto_venta" id="monto_venta" value="">
							<input type="hidden" name="codigoubicacion" id="codigoubicacion" value="">
							<input type="hidden" name="codigodelmozo" id="codigodelmozo" value="">
							<input type="hidden" name="cuenta_x_cobrar_" id="cuenta_x_cobrar_" value="">
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
													<td width="25%" style=" border: 1px solid #4273a6;background: #FFF !important;color: black ;font-weight: bold;">Articulos totales</td>
													<td width="25%" style=" border: 1px solid #4273a6;background: #FFF !important;color: black;" class="text-right"><span id="item_count" style="color: black;">1</span></td>
													<td width="25%" style=" border: 1px solid #4273a6;background: #FFF !important;color: black;font-weight: bold;">Total a Pagar</td>
													<td width="25%" class="text-right" style=" border: 1px solid #4273a6;background: #FFF !important;color: black;"><span id="total_pagar_modal" style="color: black;">0.00 </span></td>
												</tr>
												<tr>
													<td style=" border: 1px solid #4273a6;background: #FFF !important;color: black;font-weight: bold;">Dinero Entrego</td>
													<td class="text-right" style=" border: 1px solid #4273a6;background: #FFF !important;color: black;"><span id="total_paying" style="color: black;">3,163.65</span></td>
													<td style=" border: 1px solid #4273a6;background: #FFF !important;color: black;font-weight: bold;">Vuelto</td>
													<td class="text-right" style=" border: 1px solid #4273a6;background: #FFF !important;color: black;"><span id="balance" style="color: black;font-weight: bold;">0.00</span></td>
												</tr>
											</tbody>
										</table>

									</div>

									<div class="row">
										<div class="col-xs-4">
											<div class="form-group">
												<label for="amount" style="color:white;">Monto Entregado</label> <input  onkeyup="generar_vuelto()" name="dinero_entregado" type="number" id="dinero_entregado" class="pa form-control kb-pad amount ui-keyboard-input ui-widget-content ui-corner-all" aria-haspopup="true" role="textbox">
											</div>
										</div>

										<input name="fecha" id="fecha" value="<?php echo date('Y-m-d'); ?>" max="<?php echo date('Y-m-d'); ?>" class=" form-control " type="hidden" aria-haspopup="true" role="textbox">
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
												<select id="cliente" class="form-control" name="cliente" tabindex="-1" aria-hidden="true">
													<option value="">Seleccionar Cliente</option>
												</select>
											</div>
										</div>
										<div class="col-xs-1"><br>
											<button id="nuevo" class="btn btn-default btn-icon-anim btn-square" type="button"><i class="fa fa-pencil"></i></button>
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
										<div class="col-xs-2"> <label style="color:white;">Impresion Manual</label></div>
										<div class="col-xs-1">
											<input value="1" id="comprobante_imprimir" name="comprobante_imprimir" type="checkbox" data-size="small"  class="js-switch js-switch-1" data-color="#8BC34A"/>
										</div>
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
								</div>
							</div>
						</form>


					</div>

					<div class="modal-footer" style="    background-color: #4273a6!important;">
						<button type="button" class="btn btn-default pull-left" data-dismiss="modal"> Cerrar </button>
						<button class="btn btn-success" id="submit-sale" onclick="cobrar_venta()">COBRAR</button>
					</div>
				</div>
			</div>
		</div>



		<div id="nuevo_cliente" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h5 class="modal-title" id="myModalLabel">Nuevo de Cliente</h5>
					</div>
					<div class="modal-body">

						<div class="tab-struct custom-tab-1 ">
							<ul role="tablist" class="nav nav-tabs" id="myTabs_7">
								<li class="active" role="presentation"><a aria-expanded="true" data-toggle="tab" role="tab" id="home_tab_7" href="#home_7">RUC</a></li>
								<li role="presentation" class=""><a data-toggle="tab" id="profile_tab_7" role="tab" href="#profile_7" aria-expanded="false">DNI</a></li>

							</ul>
							<div class="tab-content" id="myTabContent_7">

								<div id="home_7" class="tab-pane fade active in" role="tabpanel">
									<form id="formulario_empresa">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Razon Social</label>
													<input type="text" autocomplete="off" name="nombre" id="nombre" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>RUC</label>
													<input type="text" autocomplete="off" name="ruc" id="ruc" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Celular</label>
													<input type="text" autocomplete="off" name="celular" id="celular" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Direccion</label>
													<input type="text" autocomplete="off" name="direccion" id="direccion" class="form-control" required="required">
												</div>
											</div>
										</div>
									</form>
									<div class="row">
										<center><button id="guardar_empresa" class="btn btn-primary">Guardar</button></center>
									</div>
								</div>


								<div id="profile_7" class="tab-pane fade" role="tabpanel">
									<form id="formulario_cliente">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Nombre Completo</label>
													<input type="text" autocomplete="off" name="nombre" id="nombre" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>DNI</label>
													<input type="text" autocomplete="off" name="ruc" id="ruc" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Celular</label>
													<input type="text" autocomplete="off" name="celular" id="celular" class="form-control" required="required">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Direccion</label>
													<input type="text" autocomplete="off" name="direccion" id="direccion" class="form-control" required="required">
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


	</div>
	<style>
	#frm_dividir input
	{
		border: 1px solid rgba(116, 113, 113, 0.98);
	}
	.ui-dialog-title
	{
		font-size: 13px;
	}

</style>
<script src="<?php echo base_url(); ?>public1/js/select2.min.js"></script>
<script>
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


	});

	$.post(base_url + 'Multifactura/temporal',{id_venta:$("#id_venta_g").val()},function(response){

		for(var i=0; i < response.response.length; i++) {
			var obj = response.response[i];
			cuentas_nombre[cb]=obj.cuenta;
			ccreadas.push(cuentas_nombre[cb]);
			cb++;
			var cuentas=[];
			$.each(obj.detalle,function(index_detalle,obj_detalle){
				cuentas.push({ 
					codigo_producto:obj_detalle.cod_producto_venta,
					agrupado:obj_detalle.estado_pedido,
					estado_pedido:obj_detalle.estado_cuenta,
					obs:obj_detalle.observaciones,
					importe:parseFloat(obj_detalle.importe),
					precio:obj_detalle.precio,
					precio_min:obj_detalle.precio,
					descripcion:obj_detalle.descripcion,
					cantidad:obj_detalle.cantidad,
					nombre_cuenta:obj_detalle.nombre_cuenta,
					estado:obj_detalle.cuenta_estadopago,
					id_temp:obj_detalle.detalle_iddetalletemporal,
					id_cuentatemp:obj_detalle.cuentas_idtemporal,
					id_detalle_producto:obj_detalle.id_detalle_producto_,
					normal:"S"
				});
			});
			$.post(base_url + "BaseController/Generarvariascuentas", {cuentas:cuentas,grabar:"N",id_venta:$("#id_venta_g").val()},function(dat) {
				$("#div_cuentas").append(dat["html"]);
				$("#credito").hide();
				mostra_numeros();
			},'json'); 
		}
	},'json'); 
	function chek_igv()
	{

		if($("#igv").prop('checked')){
			localStorage.setItem("ivg_venta", "1");

		}else{
			localStorage.setItem("ivg_venta", "0");

		}

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
	function mostra_numeros(){
		var cont=0;
		$.each($('.tb_general tr'),function(i,j){
			cont++;
			$(this).find(".p-cont").text(cont);
			$(this).find(".span-cuentas").text(cuentas_nombreM[cont]); 
		});
	}
</script>
<script>
	$("#credito").hide();

	var item=0;//contador de item de cada cuente
var agregados=0;//cantidad de agregados
cuentas_nombre=new Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","W","X","Y","Z","AB");
cuentas_nombreM=new Array("","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","W","X","Y","Z","AB");
ccreadas=[];//almacena todas las cuentas creadas (dividir-agregar cuenta)
ccreadasD=[];//guarda las nuevas cuentas en dividir 

var cb=0;//contador de cuentas
var montocuenta= 0;
var datosxcuenta=[];
$(document).ready(function(){
     // $(".cant").numerico();

     $("#contentLoading").fadeOut("fast");
     $('#dividir_c,#agregar_c,#cobrar_cuentas').css({"width":"120px",'height':'40px','font-size':'12px','margin-bottom':'5px'});
     $(".cblock").change(function() {
     	var td = $(this).parent("td").next("td");
     	var tr=$(this).parent("td").parent("tr");
                  var cant=parseFloat(tr.find(".cantidad").val());   ///            
                  if($(this).is(":checked")) {      
                  	$("div.fblock", td).css("display", "none");
                  	tr.find(".cant").val(cant);
                  	tr.find(".cant").focus();
                  	agregados++;
                  	tr.find(".cantidad").attr("value",0);
                  }else {
                  	tr.find(".cantidad").attr("value", tr.find(".cantidad_ant").val());
                  	tr.find(".p-cantidad").text(parseFloat(tr.find(".cantidad_ant").val()).toFixed(2));
                  	$("input[type=text]", td).val("");
                  	$("div.fblock", td).css("display", "block");
                  	agregados--; 
                  }
              });  
     $(".cant").keyup(function(e){
     	var tr=$(this).parent("div").parent("td").parent("tr");
     	var cant=parseFloat(tr.find(".cantidad_ant").val());

     	tecla= (document.all) ? e.keyCode : e.which;
           // if(tecla==48){ Mensaje("Ingrese cantidad mayor o igual a 1",'Mensaje');return false;}
           if($(this).val()<=0){ 
           	generar_notificacion("ERROR","Ingrese cantidad mayor o igual a 1","error","#fec107");
           	$(this).val(cant);
           	return false;
           }
           if($(this).val()>cant)
           {
           	generar_notificacion("ERROR","la cantidad escrita supera a la cantidad real","error","#fec107");
           	$(this).val(cant);
           	return false;
           }else
           {
           	cantt=cant-$(this).val();
           	tr.find(".cantidad").attr("value",cantt);
           }
           if(cantt!=0){tr.find(".p-cantidad").text(cantt.toFixed(2));}
       });
    //    $("#monto").real();
    $("#agregar_c").button({
    	icons: {
    		primary: "ui-icon-cart"
    	}
    }).click(function(e){
    	e.preventDefault();
    	cuentas=[];
    	sumat=0;
    	total_venta=$("#td_total_venta_inp").val();
    	$.each($('#productos_vta_tbody tr'),function(idx,obj){
    		if($(this).find(".cblock").is(':checked')) {
    			if($(this).find(".cant").val()!="") {
    				cantidad=$(this).find(".cant").val();
    				cant_anteriror=$(this).find(".cantidad_ant").val();
    				descripcion=$(this).find(".descripcion").val();
    				precio_min=$(this).find(".precio_min").val();
    				precio=$(this).find(".precio").val();
    				detalleidventa = $(this).find(".codigo_deventa").val();
    				id_detalle_producto=$(this).find(".id_detalle_producto").val();
    				importe=parseFloat(precio)*cantidad;
                         sumat=parseFloat(sumat)+parseFloat(importe);//sumando los importes
                         obs=$(this).find(".obs").val();
                         estado_pedido=$(this).find(".estado_pedido").val();
                         agrupado=$(this).find(".agrupado").val();
                         codigo_producto=$(this).find(".codigo_producto").val();
                         pprecio_=parseFloat((cant_anteriror-cantidad)*parseFloat(precio));
                         $(this).find(".cantidad_ant").val(cant_anteriror-cantidad);
                         $(this).find(".p-precio").text(pprecio_.toFixed(2));
                         item++;
                         ncuenta="";
                         if(item==1){
                         	for(var i=0;i<ccreadas.length;i++) {
                         		var index = ccreadas[i];
                         		if(index==cuentas_nombre[cb]) {
                         			cb++;
                         		}
                         	}
                         	ncuenta=cuentas_nombre[cb];
                         	ccreadas.push(cuentas_nombre[cb]);
                         	cb++;
                         }
                         cuentas.push({
                         	codigo_producto:codigo_producto,
                         	agrupado:agrupado,
                         	estado_pedido:estado_pedido,
                         	obs:obs,
                         	importe:parseFloat(importe),
                         	precio:precio,
                         	precio_min:precio_min,
                         	descripcion:descripcion,
                         	cantidad:cantidad,
                         	nombre_cuenta:ncuenta,
                         	estado:'P',
                         	iddetalleventa : detalleidventa,
                         	id_detalle_producto:id_detalle_producto,
                         	normal:"S"
                         });
                         $(this).find(".cblock").attr("checked",false);
                         $(this).find(".cant").attr("value","");
                         $(this).find(".fblock").css("display","block");
                         if($(this).find(".cantidad_ant").val()==0) {
                         	$(this).find(".cblock").attr("disabled",true);
                         	$(this).addClass("tr");
                         }
                     }else {
                     	generar_notificacion("ERROR","Por favor ingrese Cantidad para poder realizar la accion","error","#fec107");
                     	return false;
                     }    
                 }
             });
    	if(item==0){
    		generar_notificacion("ERROR","No has seleccionado Ningun Producto Mensaje","error","#fec107");
    		return false;
    	} else {
    		agregados=0;
    		item=0;
    		$.post(base_url+"BaseController/Generarvariascuentas",{cuentas:cuentas,grabar:"S",id_venta:$("#id_venta_g").val()},function(data){
    			$("#div_cuentas").append(data["html"]);
    			mostra_numeros();
    		},'json');  
    		total_venta=parseFloat(total_venta)-parseFloat(sumat);
    		$("#td_total_venta").text("S/ " +total_venta.toFixed(2));
    		$("#td_total_venta_inp").val(total_venta.toFixed(2));
                 //  mostra_numeros();
             }
         });
    $(document).on("click", '.delete', function(e)
    {
    	e.preventDefault();
    	total_venta=$("#td_total_venta_inp").val();
           tr=$(this).parent("td").parent("tr");//tr donde hacemos click
           tb=tr.parent().parent();//la tabla donde estan los productos
           classtbody=tr.parent().attr("class");//clase del tbody donde estan los productos
           classtable=tb.attr("index");//classe de la tabla de productos
           cantidad=parseFloat(tr.find(".cantidad_cuenta").val());//cantidad producto seleccionado
           id_temp=tr.find(".id_temp_cuenta").val();
           id_detalletemp=tr.find(".id_temp_detalle").val();
           precio=parseFloat(tr.find(".precio_cuenta").val());
           importe=parseFloat(tr.find(".p-precio_cuenta").text())//importe producto seleccionado
           codigo=tr.find(".codigo_producto_cuenta").val();//codigo producto seleccionado
           id_detalle_producto_cuenta=tr.find(".id_detalle_producto_cuenta").val();//id_detalle_producto producto seleccionado
           total=parseFloat(tb.find(".td_tt_x_cuenta").text());//total de la cuenta creada
           ttalq=parseFloat(total)-parseFloat(importe);//resto del total para actualizarla

           tb.find(".tt_x_cuenta").val(ttalq.toFixed(2));//guardamos 
           tb.find(".td_tt_x_cuenta").text(ttalq.toFixed(2));//mostramos el nuevo total
        //   alert(cantidad+" "+codigo);
           $.each($('#productos_vta_tbody tr'),function(i,j)//recorremos los productos de la venta original 
           {
           	if($(this).find(".codigo_producto").val()==codigo)
           	{
           		if($(this).find(".id_detalle_producto").val()==id_detalle_producto_cuenta)
           		{
           			ca=parseFloat($(this).find(".cantidad_ant").val());
           			c=$(this).find(".cantidad").val();
           			ctd=parseInt($(this).find(".p-cantidad").text());
           			creal=parseFloat($(this).find(".cantidad_real").val());
           			devuelve=ca+cantidad;
           			if(devuelve<=creal)
           			{

           				$(this).find(".p-cantidad").text(devuelve.toFixed(2));
           				$(this).find(".cantidad_ant").attr("value",devuelve.toFixed(2));
           				$(this).find(".cantidad").attr("value",devuelve.toFixed(2));  
           				$(this).find(".cblock").attr("disabled",false);
           				$(this).find(".p-precio").text(parseFloat(devuelve*precio).toFixed(2));
           			}
							//---------
							total_venta=parseFloat(total_venta)+parseFloat(importe);
							$("#td_total_venta").text("S/ " +total_venta.toFixed(2));
							$("#td_total_venta_inp").val(total_venta.toFixed(2))
							//------------------
							$(this).removeClass("tr");
							$(this).find('.incluir').removeAttr('disabled');
							return false;

						}

					} 
				});
           if($('.'+classtbody+'>tr').length>1)
           {
           	$(tr).remove();
           	$(".tb_cabecera_"+classtable).height($('.'+classtbody+'>tr').length);
           }else
           {
           	$(".nombre_"+classtable).remove();
           	var index = ccreadas.indexOf(classtable); 
           	if (index > -1) {ccreadas.splice(index, 1);} 
           	mostra_numeros();
           }
           param="ajax=ajax";
           param+="&id_temp="+id_temp;
           $.post(base_url + 'Multifactura/eliminar',{id_tem:id_detalletemp},function(response){


           },'json');
       });

    $('#frm_cobrar_cuentas').dialog({
    	autoOpen: false,
    	width: 900,
    	modal: true,
    	position:'top',
    	buttons: {
                       /* Guardar: function() {
                         
                            
                       },*/
                       "Cancelar":function()
                       {
                           // alert("ok");
                           // $("#frm_cobrar_cuentas").dialog("close");
                           window.location = document.location.href;
                           window.location.reload();

                       }
                   },
                   close: function() {
                   	window.location = document.location.href;
                   	window.location.reload();
                   }
               });
    function restocuenta()
    {
    	totalventatd=parseFloat($("#td_total_venta_inp").val());
    	totalventa=parseFloat($("#total_venta").val());
    	totalcuentas=parseFloat(totalventa-totalventatd);
    	$("#td_total_cuentas_").text("S/" +totalcuentas.toFixed(2));
    }
    function mostra_numeros()
    {
    	cont=0;
    	$.each($('.tb_general tr'),function(i,j) {
    		cont++;
                //  console.log(cont);
                $(this).find(".p-cont").text(cont);
                $(this).find(".span-cuentas").text(cuentas_nombreM[cont]);

            });
    }
    var timer = window.setInterval(restocuenta, 1000);
    var timer2 = window.setInterval(mostra_numeros, 500);

        ///................................
        $(document).on("click", '.btn_guardar_cuentas', function(e) {
        	e.preventDefault();
        	cuenta=$(this).attr("index");
        	cuentag=$(".tb_cabecera_"+cuenta).find(".span-cuentas").text();
        	actualizar_comprobante();
        	datosxcuenta = [];
                 //mostrar los productos por cuenta
                 var monto=0;
                 $.each($('.productos_vta_cuentas_tbody_'+cuenta+' tr'),function(i,j){
                 	monto=parseFloat(monto)+(parseFloat($(this).find(".precio_cuenta").val())*parseFloat($(this).find(".cantidad_cuenta").val()));
                 	montocuenta = monto;
                 	cuentacobrar = $(this).find(".nombre_cuenta").val();
                 	datosxcuenta.push({
                 		codigo_producto:$(this).find(".codigo_producto_cuenta").val(),
                 		agrupado:$(this).find(".agrupado_cuenta").val(),
                 		estado_pedido:$(this).find(".estado_pedido_cuenta").val(),
                 		obs:$(this).find(".obs_cuenta").val(),
                 		importe:parseFloat($(this).find(".importe_cuenta").val()),
                 		precio:$(this).find(".precio_cuenta").val(),
                 		precio_min:$(this).find(".precio_min_cuenta").val(),
                 		descripcion:$(this).find(".descripcion_cuenta").val(),
                 		cantidad:$(this).find(".cantidad_cuenta").val(),
                 		id_temp:$(this).find(".id_temp_cuenta").val(),
                 		id_cuentatemp:$(this).find(".id_temp_detalle").val(),
                 		nombrecuentadetalle:$(this).find(".nombre_cuentadetalle").val(),
                 		id_detalle_producto:$(this).find(".id_temp_cuenta").val()
                 	});
                 });
                 $("#contentLoading").show();
                 $("#id_modal_venta").val($("#id_venta_g").val());
                 $("#codigoubicacion").val($("#codigo_mesa").val());
                 $("#codigodelmozo").val($("#cod_moso_g").val());
                 $("#cuenta_x_cobrar_").val(cuentacobrar);

                 // $.post(base_url + 'Multifactura/formCobrar',{monto:monto.toFixed(2),datosxcuenta:datosxcuenta,id_venta:$("#id_venta_g").val(),cod_moso:$("#cod_moso_g").val(),cuenta:cuenta},function(data) {
                 	// if (data.code && data.code == 'ERROR') {
                 	// 	generar_notificacion("ERROR",data.message,"error","#fec107");
                 	// 	return;
                  //               // alert(response.message)
                  //           } 
                  var select=$('#cliente'); 
                  if ($("#tipo_comprabante").val() != 2 && $("#tipo_comprabante").val() != 4 ) {
                  	var option = new Option('Varios', 0, true, true);
                  	select.append(option).trigger('change');
                  }else{
                  	var option = new Option('', '', true, true);
                  	select.append(option).trigger('change'); 
                  }

    // manually trigger the `select2:select` event
    select.trigger({
    	type: 'select2:select'
    });
    $("#cobrar_modal").modal({"backdrop":"static","keyboard":false});

    $("#dinero_entregado").val(monto.toFixed(2));
    $("#boton_monto_dinero").val(monto.toFixed(2));
    $("#boton_monto_dinero").text(monto.toFixed(2));
    $("#total_paying").text(monto.toFixed(2));
    $("#total_pagar_modal").text(monto.toFixed(2));
                        // }).always(function(){
                        // 	$("#contentLoading").fadeOut("fast");
                        // });

            //alert(cuenta)
        });
        $('#frm_cobrar_cuentas_').dialog({
        	autoOpen: false,
        	width: 900,
        	modal: true,
        	position:'top',
        	buttons: {
                       /* Guardar: function() {
                         
                            
                       },*/
                        /*"Cancelar":function()
                        {
                           // alert("ok");
                           // $("#frm_cobrar_cuentas").dialog("close");
                            //window.location = document.location.href;
                          //  window.location.reload();
                          $("#frm_cobrar_cuentas_").dialog("close");
                            
                      }*/
                  },
                  close: function() {

                  	$(document).off("click",".delete_montos");
                  	$(document).off("change",".id_medio_pago");
                   //   window.location = document.location.href;
                     //       window.location.reload();
                 }
             });

    });
function formatRepo (repo) {
	if (repo.loading) return repo.text;
	var markup="";
	markup += "<h5 style='font-size:15px;'>"+repo.text + "</h5>" ;
	markup += "<h6 style='font-size:12px;'>"+repo.documento + "</h6>" ;




	return markup;
}
$("#nuevo").click(function(){
	$("#nuevo_cliente").modal();
});
function formatRepoSelection (repo) {
	return repo.text || repo.documento;
}
$("#tipo_pago").change(function(){
	if($(this).val()=="1")
	{
		$("#credito").hide();
		$("#cuotas").val("");
		$("#intervalo").val("");
		$("#cronograma").empty();  

	}else{
		$("#credito").show();   

	}
});

function actualizar_comprobante()
{
	var dat=$("#tipo_comprabante").val();
	globalvariable = dat;
	$("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
	if(dat!=0){
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
	globalvariable = dat;
	$("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
	if(dat!=0){
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
			var select=$('#cliente'); 
			if ($("#tipo_comprabante").val() != 2 && $("#tipo_comprabante").val() != 4 ) {
				var option = new Option('Varios', 0, true, true);
				select.append(option).trigger('change');
			}else{
				var option = new Option('', '', true, true);
				select.append(option).trigger('change'); 
			}

    // manually trigger the `select2:select` event
    select.trigger({
    	type: 'select2:select'
    });
      //$("#comprobante").text("Nº "+data);
  },'json');
	}else{

		$("#comprobante").text("Nº 001-1");
	}
});
$('#cliente').select2({
	ajax: {
		url: base_url+'pedido/buscar_cliente1/',
		dataType: 'json',
		placeholder: 'Buscar Cliente',
		maximumSelectionLength: 10,

		data: function (params) {
			return {
                    q: params.term, // search term
                    id: $("#tipo_comprabante").val(),
                    totalpago: $("#total_pagar_modal").text(),
                    page: params.page
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
        }
    });
 

function culqi() {

    if(Culqi.token) { // ¡Token creado exitosamente!
        // Get the token ID:
        var token = Culqi.token.id;
        var email= Culqi.token.email;
        var diner=$("#total_pagar_modal").text();
       // alert('Se ha creado un token:'+$("#merchant_order_id").val());
       $.post(base_url+"public/pagar_culqi.php",{"email":email,"token":token,"dinero": parseFloat(diner)},function(data){

       	if(data=="1"){

       		generar_venta();
       	}
       	if(data=="2"){
       		$("#submit-sale").attr("disabled",false);
       		$("#submit-sale").text("Guardar"); 


       		generar_notificacion("ERROR","ERROR AL MOMENTO DE INGRESA LA TARJETA","error","");
       	}
       });


    }else{ // ¡Hubo algún problema!
        // Mostramos JSON de objeto error en consola
        console.log(Culqi.error);
        alert(Culqi.error.mensaje);
    }
};

function crear_cronograma()
{
	if($("#intervalo").val()!="" && $("#cuotas").val()!=""){
		$("#cronograma").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
		$.post(base_url+"Ventas/cronograma_prestamo",
		{
			"fecha_venta":$("#fecha").val(),
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

function cobrar_venta(){ 
	dat=$("#forma_pago").val();
	if ($("#cliente").val() == "") {
		generar_notificacion("ERROR","SELECCIONE TIPO DE CLIENTE POR FAVOR","error","#fec107");
		return 0;
	} 
	monto_pagar=parseFloat($("#total_pagar_modal").text());
	if(parseFloat(dat)==99){
		//pagar(1,1,monto_pagar,"grupoesconsultores");
	}else{
		monto=0;
		monto=parseFloat($("#balance").text());
		if(monto>=0){
			//$("#submit-sale").attr("disabled",true);
			//$("#submit-sale").text("Procesando..."); 
			generar_venta();
		} 
		else{
			generar_notificacion("ERROR","NO SE PUEDE GENERAR LA VENTA PORQUE EL MONTO ENTREGADO","error","")
		}
	}
}
function generar_vuelto(){
  monto_pagar=parseFloat($("#total_pagar_modal").text());
  dinero=parseFloat($("#dinero_entregado").val());
  vuelto=dinero-monto_pagar;
  $("#total_paying").text(dinero.toFixed(2));
  $("#balance").text(vuelto.toFixed(2));

}


function generar_venta(){

	let monto_pagar=parseFloat($("#total_pagar_modal").text());
	datos_matriz={};
	let dinero_entre=$("#dinero_entregado").val();
	//alert(monto_pagar);
	if($("#dinero_entregado").val()=="" && parseFloat(dinero_entre)>= monto_pagar){
		//alert(monto_pagar);
		$("#dinero_entregado").focus();return 0;
	}
	if($("#cliente").val()==""){
		$("#cliente").focus(); return 0;
	} 
	if($("#tipo_pago").val()=="2"){
		if($("#cuotas").val()==""){
			$("#cuotas").focus(); return 0;
		}
		if($("#intervalo").val()==""){
			$("#intervalo").focus(); return 0;
		}    
	} 
	datos_matriz["venta_producto"]=datosxcuenta;
	cuenta = $("#cuenta_x_cobrar_").val();
	datos_matriz["venta_pago"]=$("#formulario_pago").serialize();
	datos_matriz["total_pagar"] = montocuenta;

	$("#submit-sale").text("Procesando...");
	$("#submit-sale").attr("disabled",true);

	$.post(base_url+"Multifactura/procesar_venta",JSON.stringify(datos_matriz),function(data){

		if(parseInt(data["estado"])==1){
			$("#submit-sale").text("Pagar");
			$("#submit-sale").attr("disabled",false);
			$("#id_modal_venta").val(data["idventa"]); 
				var url=base_url+"Ventas/mostrar_comprobante/"+$("#id_modal_venta").val();
				var a = document.createElement("a");
				a.target = "_blank";
				a.href = url;
				a.click();  
				$("#submit-sale").attr("disabled",false);
				$("#submit-sale").text("Guardar"); 
				$("#cobrar_modal").modal("hide");
				$("#panel"+$("#id_modal_venta").val()).hide(); 
				$("#panel"+$("#id_modal_venta").val()).remove();
				$("#id_modal_venta").val("");
				limpiar();
				generar_notificacion("VENTA EXITOSA","SE GENERO LA TRANSACCION EXITOSA","success","#fec107");

				$("#mensaje_" + cuenta).css("display", "block");
				$("#fblock_" + cuenta).css("display", "block");
				$(".nombre_"+ cuenta).find("*").attr("disabled", "disabled"); 
                    //  $("#padre_"+cuenta).css("display","none");
                    var index = ccreadas.indexOf(cuenta);
                    if (index > -1) {
                    	ccreadas.splice(index, 1);
                    }
                    $.post(base_url+"Multifactura/verificarventa",{"id":"<?php echo $data['id_venta']; ?>"},function(data){
                    	if(parseInt(data)==1)
                    	{
                    		window.close();
                    		
                    	}
                    });         
                }else if (parseInt(data["estado"])==2) {
                	$("#submit-sale").text("Pagar");
                	$("#submit-sale").attr("disabled",false);
                	generar_notificacion("ERROR","SE GENERO UN ERROR EN CAJA POR FAVOR REVISE SI CAJA ESTE ABIERTO O SI TIENE EL DINERO NECESARIO","error","#fec107");
                }
                else{
                	$("#submit-sale").text("Pagar");
                	$("#submit-sale").attr("disabled",false);
                	generar_notificacion("ERROR","SE GENERO UN ERROR EN LA TRANSACCION","error","#fec107");
                }
            },"json") .fail(function() {
            	$("#submit-sale").text("Pagar");
            	$("#submit-sale").attr("disabled",false);
            	generar_notificacion("ERROR","SE GENERO UN ERROR EN LA TRANSACCION X","error","#fec107");
            });
        }

        function limpiar(){
        	$("#tipo_pago option[value='1']").attr("selected",true);
        	$("#forma_pago option[value='1']").attr("selected",true);
  //$("#cliente option[value='']").attr("selected",true);
  $("#tipo_comprabante option[value='0']").attr("selected",true);
  $("#comprobante").text("Nº 001-1");
  $("#dinero_entregado").val(0.00);
}
</script>
