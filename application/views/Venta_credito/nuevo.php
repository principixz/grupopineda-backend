<?php $total = 0; $totalpagado = 0;
	foreach ($data["tabla"] as $value) { 
		$total = $total + round($value["cuo_ventamontocuota"],2);
		$totalpagado = $totalpagado + round($value["cuo_ventamontopagado"],2);
		if ((round($value["cuo_ventamontocuota"],2) - round($value["cuo_ventamontopagado"],2))==0) {
			$monto = round($value["cuo_ventamontocuota"],2);
		}else{
			$monto = round($value["cuo_ventamontocuota"],2) - round($value["cuo_ventamontopagado"],2);
		}
	} 
?>

<div class="animated fadeInRight m-l-none m-r-none">
<form  id="form_amortizacion">
	<div class="row ">
		<div class="col-md-6">
			<div class="btn-group">
				<button type="button" class="btn btn-default">
			  		S/. Cobrado: <?php echo $totalpagado;?>
			  	</button>
			  	<button type="button" class="btn btn-default">
			  		S/. Restante: <?php echo $restante = $total-$totalpagado;?>
			  	</button>
			  	<button type="button" class="btn btn-primary">
			  		S/. Total: <?php echo $total;?>
			  	</button>
			  	<input type="hidden" name="saldorestante" id="saldorestante" value="<?php echo $restante; ?>">
			</div>
		</div>
	    	
	</div>
	<br>
<div class="row">
	<div class="col-md-2">
		<div class="form-group">
		<label class=" control-label">fecha</label>
	    <input type="date" class="form-control" id="fechapago" name="fechapago" value="<?php echo date('Y-m-d')?>" max="<?php echo date('Y-m-d')?>">
	   </div>
	</div>




	    	
	    	<div class="col-sm-2">
	    	 <div class="form-group">
	    	 	<label class="control-label">S/.Monto</label>
	        	<input type="number" class="form-control"  onkeyup="validarpago();" onchange="validarpago();" id="monto"  name="monto" placeholder="S/. Monto" required value="<?php echo $monto; ?>">
	        	<input type="hidden" name="montototal" id="montototal" value="<?php echo $total-$totalpagado; ?>">
	        	<input type="hidden" name="idventa" id="idventa" value="<?php echo $data['id_venta']; ?>">
	        </div>
	    	</div>

	    	<div class="col-md-2">
		<div class="form-group">
		<label class=" control-label">Forma de Pago</label>
	    <select class="form-control" name="forma_pago" id="forma_pago">
	    	<option value="">seleccionar</option>
	    	<?php 
             foreach ($data["forma_pago"] as $key => $value) {
             echo "<option value='".$value["for_id"]."'>".$value["for_descripcion"]."</option>";
             }

	    	?>
	    </select>
	   </div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
		<label class=" control-label">Comprobante</label>
	    <select class="form-control" name="comprobante" id="comprobante" readonly>
	    	<?php 
             foreach ($data["tipo_comprabante"] as $key => $value) {
             	if ($value["id_tipo_comprobante"] == $data["numcomprobante"]->ventas_idtipodocumento) {
             		$estadoseleccion = "selected ";
             		echo "<option value='".$value["id_tipo_comprobante"]."' ".$estadoseleccion.">".$value["tipo_comprobante_descripcion"]."</option>";
             	}else{
             		$estadoseleccion = "";
             	}
             
             }

	    	?>
	    </select>
	   </div>
	</div>
		<div class="col-md-2">
		<div class="form-group">
		<label class=" control-label">Nº de comprobante</label>
	    <input type="text" class="form-control" id="ncomprobante" name="ncomprobante" value="<?php echo $data["numcomprobante"]->num_boleta ?>" readonly>
	   </div>
	</div>
	    	
</div>
<br>
<div class="row">
	<center>
			<button type="button" class="btn btn-danger" onclick="location.href =base_url+'venta_credito'">Cancel
			</button>
		<button type="button" class="btn btn-success" onclick="cobrar_credito()">Cobrar</button>
	</center>
</div>
<br>
	<div style="height: 400px; overflow-y: auto;">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="center">Nro. Cuota</th>
		            	<th class="center">F. Vence</th>
		            	<th class="center">F. Pago</th>
		            	<th class="center">Monto Cuota</th>
		            	<th class="center">Monto Cancelado</th>
		            	<th class="center">Monto Restante</th>
		            	<th class="center">Estado</th>
				</tr>
			</thead>
			<tbody>
				<?php
					foreach ($data["tabla"]  as $value) { ?>
						<tr>
							<td><?php echo $value["cuo_ventanrocuota"]; ?></td>
							<td><?php echo $value["cuo_ventafechavence"]; ?></td>
							<td><?php echo $value["cuo_ventafechacancelado"]; ?></td>
							<td><?php echo $value["cuo_ventamontocuota"]; ?></td>
							<td><?php echo $value["cuo_ventamontopagado"]; ?></td>
							<td><?php echo ($value["cuo_ventamontocuota"] - $value["cuo_ventamontopagado"]); ?></td>
							<td>
								<?php 
									if ($value["cuo_ventaestado"]==1) {
										echo '<span class="label label-danger">Pendiente</span>';
									}else{
										echo '<span class="label label-primary">Cancelado</span>';
									}
								?>
							</td>
						</tr>
					<?php }
				?>
			</tbody>
		</table>
	</div>
</form>

</div>














<script type="text/javascript">
	$(function(){
        $("#titulo").text("Pagar Credito");
	});
function validarpago(){
		monto = parseFloat($("#monto").val());
		saldorestante = parseFloat($("#saldorestante").val());
		if (monto > saldorestante) {
			$("#monto").val(saldorestante);
		}
	}
  function cobrar_credito()
  {
      
      if($("#forma_pago").val()==""){
		$("#forma_pago").focus(); return 0;
	}
	if($("#comprobante").val()==""){
		$("#comprobante").focus(); return 0;
	}
	if($("#ncomprobante").val()==""){
		$("#ncomprobante").focus(); return 0;
	}
    Swal.fire({
    title: "¿Estas seguro que desea Realizar el cobro?",   
    text: "una vez realizado el pago se descontara el dinero de caja",   
    type: "success",   
    showCancelButton: true,   
    confirmButtonColor: "#8bc34a",   
    confirmButtonText: "Si, Deseo Cobrar",   
    cancelButtonText: "No, deseo hacerlo",
    }).then((result) => {
      if (result.value) {
       $('.confirm').prop('disabled', true); 
        $.post(base_url+"venta_credito/procesar_cobro",$("#form_amortizacion").serialize(),function(data){
        if(parseInt(data)==1){
                 swal("Se Guardo correctamente", "exitoso ", "success"); 
                 location.reload(true);
                }else{
                   generar_notificacion("ERROR","Se genero un error en la transferencia","error","#fec107")
                }
      },"json");
     }
   })


		return false;

  }


</script>