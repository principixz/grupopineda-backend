<div class="panel panel-default card-view">
	<div class="panel-heading">
		<div class="pull-left">
			<h6 class="panel-title txt-dark">INGRESAR DATOS</h6>
		</div>
		<div class="clearfix">
			<button class="btn btn-primary" type="button" id="modal" name="modal" >
				<i class="fa fa-fire"></i> NUEVO
			</button>
		</div>
	</div>
	<br>
	<div class="">
		<div class="col">
				<div class="row">
					<div class="col-lg-3 col-12">
						<div class="form-group">
							<label class="control-label mb-10 text-left">TIPO DE MEDIDA</label>
							<input type="hidden"  name="id" id="id"/>
							<select id="tipo_medida" name="tipo_medida" class="form-control" required>
								<option value="">Seleccionar tipo</option>
								<?php foreach ($data["tabla"] as $key => $value) {
									echo "<option value='".$value->id_tipo_unidad_medida."'>".$value->tipo_unidad_medida_descripcion."</option>";
								}?>
							</select>
						</div>
					</div>
					<div class="col-lg-3 col-12">
						<div class="form-group">
							<label class="control-label mb-10 text-left">UNIDAD MEDIDA MASTER</label>
							<select id="unidad" name="unidad" class="form-control" required>
								<option value="">Selecionar</option>
							</select>
						</div>
					</div>
					<div class="col-lg-3 col-12">
						<label class="control-label mb-10 text-left">UNIDAD MEDIDA ESCLAVO</label>
						<select id="unidad_2" name="unidad_2" class="form-control" required>
							<option value="">Selecionar</option>
						</select>
					</div>
					<div class="col-lg-3 col-12">
						<label class="control-label mb-10 text-left">RELACION NÚMERICA</label>
						<input type="text" class="form-control" required="true" name="relacion" id="relacion" autofocus="true" value="" required="">
					</div>
					<div class="col-lg-12 col-12">
					<center><a href="<?php echo  base_url();?>Unidad_medida"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary" id="guardar" >Guardar</button></center>		
						</div>
					</div>
			</div>
			<!-- /.col -->
		</div>



		<div id="modal_default" class="modal fade in">

			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">×</button>

						<h5 class="modal-title">Datos de unidad de medida</h5>

					</div>



					<div class="modal-body">

						<div class="row">

							<div class="col-md-6">

								<div class="form-group">

									<label>Descripcion</label>

									<input type="text" name="descripcion_unidad" id="descripcion_unidad" class="form-control">

								</div>

							</div>

							<div class="col-md-6">

								<div class="form-group">

									<label>Tiempo *opcional</label>

									<input type="text" name="numero" id="numero" class="form-control">

								</div>

							</div>							

						</div>

					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-link legitRipple" data-dismiss="modal">Cerrar</button>

						<button type="button" class="btn btn-primary legitRipple" id="guardar_unidad">Guardar Cambios</button>

					</div>

				</div>

			</div>

		</div>



		<script type="text/javascript">

			<?php if(isset($data["id"])) {?>

				$(function(){

					$.post(base_url+"Unidad_medida/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){

						$("#id").val(data[0]["moneda_id"]);

						$("#descripcion").val(data[0]["moneda_descripcion"]);

					},"json");

				});

			<?php }?>



			$("#tipo_medida").change(function(){

				var val=$(this).val();

				$.post(base_url+"Unidad_medida/ver_datos",{"id":val},function(data){

					$("#unidad").empty().append(data);

					$("#unidad_2").empty().append(data);

					$("#relacion").val('');

				});

			});



			$("#unidad_2").change(function(){

				if($("#unidad_2").val() == ''){

					$("#relacion").val('') ;

					return 0;

				}else{

					if($("#unidad_2").val() == $("#unidad").val()){



					}else{

						traerrelacionmedida();

					}

				}

			});



			$("#unidad").change(function(){

				if($("#unidad_2").val() == ''){

					$("#relacion").val('') ;

					return 0;

				}else{

					if($("#unidad_2").val() == $("#unidad").val()){

						alertainfo("No puede seleccionar las mismas unidades!!!");

						$("#relacion").val('') ;

						$("#unidad").val('');

						return 0;

					}else{

						traerrelacionmedida();

					}

				}

			});



			$("#guardar").click(function(){

				if($("#tipo_medida").val() == ''){

					$("#tipo_medida").focus();

					alertainfo("Campo vacio llenelo, Por favor!!!");

					return 0;

				}

				if($("#unidad").val() == ''){

					$("#unidad").focus();

					alertainfo("Campo vacio llenelo, Por favor!!!");

					return 0;

				}

				if($("#unidad_2").val() == ''){

					$("#unidad_2").focus();

					alertainfo("Campo vacio llenelo, Por favor!!!");

					return 0;

				}

				if($("#relacion").val() == ''){

					$("#relacion").focus();

					alertainfo("Campo vacio llenelo, Por favor!!!");

					return 0;

				}

				$.post(base_url+"Unidad_medida/guardar",{"relacion": $("#relacion").val(),"unidad_medida":$("#unidad").val(),"unidad_medida1":$("#unidad_2").val()},function(data){

					alertasuccess("Se guardo correctamente la relación","Gracias");

				});

			});



			$("#modal").click(function(){

				if($("#tipo_medida").val()!=""){

					$("#modal_default").modal();

				}else{

					alertainfo("Por favor seleccione un tipo de medida!!!");

				}

			});



			$("#guardar_unidad").click(function(){

				$.post(base_url+"Unidad_medida/guardar_unidad",{"tipo_medida":$("#tipo_medida").val(),"descripcion_unidad":$("#descripcion_unidad").val(),"numero":$("#numero").val()},function(data){

					alertasuccess("Se inserto correctamente la Unidad Medida","Exito");

					$("#descripcion_unidad").val("");

					$("#numero").val("");

					$("#modal_default").modal("hide");

					var val=$("#tipo_medida").val();

					$.post(base_url+"Unidad_medida/ver_datos",{"id":val},function(data){

						$("#unidad").empty().append(data);

						$("#unidad_2").empty().append(data);



					});

				});

			});



			function traerrelacionmedida(){

				$.post(base_url+"Unidad_medida/data",{"unidad_medida":$("#unidad").val(),"unidad_medida1":$("#unidad_2").val()},function(data){

					$("#relacion").val(data);

				});

			}

		</script>



