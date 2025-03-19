<div class="row">
	<div class="col-12">
		<div class="card">
			<div class="card-body" id="cuerpo_pagina"> 
				<div class="row">
					<div class="col-md-12">
						<a href="<?php echo base_url();?>Mesas/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="box-body">
							<div class="table-responsive">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>Mesa</th>
											<th>Ubicación</th>
											<th>Opciones</th> 
										</tr>
									</thead>
									<tbody>
										<?php $c=1; foreach ($data["tabla"] as $key => $value) {  
										$a="'Mesas',".$value["mesa_id"];
										echo '<tr>';
										echo "<td>".$c."</td>";
										echo "<td>".$value["mesa_numero"]."</td>";
										echo "<td>".$value["lugarmesa_descripcion"]."</td>";
										echo '<td><a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="mdi mdi-delete-empty txt-danger"></i></a> <a href="'.base_url().'Mesas/editar/'.$value["mesa_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="mdi mdi-table-edit txt-danger"></i></a></td>';
										echo '</tr>';
										$c++;
										} ?>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


