<?php
	$montocuota=$monto_prest/$cuotas;
?>

<div style="height: 140px; overflow-y: auto;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;"> <center> Cuotas </center> </th>
	            	<th style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;"> <center> Fecha Vencimiento </center> </th>
	            	<th style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;"> <center> Monto Pagar </center> </th>
			</tr>
		</thead>
		<tbody>
			<?php 
				for ($i=1; $i <= $cuotas ; $i++) { 
			        	if($intervalo=="1"){
			            	$fecha = date('Y-m-d',strtotime('+1 days', strtotime($fecha)));
			        	}else{
			            	if ($intervalo=="2") {
			                	$fecha = date('Y-m-d',strtotime('+1 weeks', strtotime($fecha)));
			            	}else{
			                	if ($intervalo=="3") {
			                    		$fecha = date('Y-m-d',strtotime('+15 days', strtotime($fecha)));
			                	}else{
			                    		$fecha = date('Y-m-d',strtotime('+1 months', strtotime($fecha)));
			                	}
			            	}
			        	} 
			        	$valid_fecha = $fecha; $valido = 0;
			        	while ($valido <= 0) {
			        		$valid_dia = strtotime($valid_fecha);
						switch (date('w', $valid_dia)){ 
						    	case 0: $dia="Domingo"; break; 
						    	case 1: $dia="Lunes"; break; 
						    	case 2: $dia="Martes"; break; 
						    	case 3: $dia="Miercoles"; break; 
						    	case 4: $dia="Jueves"; break; 
						    	case 5: $dia="Viernes"; break; 
						    	case 6: $dia="Sabado"; break; 
						}
						if ($dia=="Domingo") {
							$valid_fecha = date('Y-m-d',strtotime('+1 days', strtotime($valid_fecha)));
							if($intervalo=="DIARIO"){
								$fecha = $valid_fecha;
							}
						}else{
							$valido = 1;
						}
			        	} ?>
			        	<tr>
						<td style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;">
							<input type="hidden" name="nrocuotas[]" value="<?php echo $i;?>"> 
							<center> <?php echo $i; ?> </center> 
						</td>
			            	<td style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;"> 
			            		<input type="date" class="form-control" name="fechavence[]" value="<?php echo $valid_fecha;?>"> 
			            		
			            	</td>
			            	<td style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;"> 
			            		<input type="hidden" name="montocuota[]" value="<?php echo $montocuota;?>"> 
			            		<center> S/. <?php echo $montocuota; ?> </center> 
			            	</td>
					</tr>
			    <?php }
			?>
		</tbody>
	</table>
	<!--<input type="hidden" name="total" id="total" value="<?php echo round(($monto_prest+$interes),2);?>">-->
</div>