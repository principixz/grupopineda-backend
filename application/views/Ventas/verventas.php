<div class="row">

		<div class="col-md-12"><a href="<?php echo base_url() ?>ventas"><button class="btn btn-danger">Atras</button></a><br></div>
		<div class="col-md-12">
			<?php  $dias = array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sábado");
			$meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");  ?>
			<h5>Venta realizada en la Mesa <?php echo $data["venta"][0]["ubicacion"] ?></h5>
			<h5>Está Mesa fue atendido por : <?php echo $data["venta"][0]["nombre_mesera"] ?> </h5>
			<h5>Tiene un consumo valorizado en : <?php echo $data["venta"][0]["mov_monto"] ?> </h5>
		<?php 
			$semana = mktime(0,0,0, $data["venta"][0]["mes"],$data["venta"][0]["dia"],$data["venta"][0]["anio"]);
		 ?>
			<h5>Se realizo el pago el día :  <?php echo  $dias[date('w',$semana)]." ".date('d',$semana)." de ".$meses[date('n',$semana)-1]. " del ".date('Y',$semana); ?> a las <?php echo$data["venta"][0]["mov_hora"] ?> </h5>
		</div>
	<div class="col-md-12">
		<div class="table-responsive"><br>
											<table class="table table-hover table-bordered mb-0">
												<thead>
												  <tr>
													<th>#</th>
													<th>Descripcion</th>
													<th>Cantidad</th>
													<th>Precio U.</th>
													<th>Total</th>
												
												  </tr>
												</thead>
												<tbody>
													<?php 
                                                        $c=0;
													foreach ( $data["tabla"] as $key => $value) {
														$c++;
														$total = ($value["cantidad"] * $value["precio"]);
													 ?>
												  <tr>
													<td><?php echo $c; ?></td>
													<td><?php echo $value["producto_descripcion"]; ?></td>
													<td><?php echo $value["cantidad"]; ?></td>
													<td><?php echo 'S./'.number_format($value["precio"],2); ?></td>
													<td><?php echo 'S./'.number_format($total,2); ?></td>
												
												  </tr>
												 <?php } ?>

												</tbody>
											</table>
										</div>
										<br><br>
	</div>
</div>