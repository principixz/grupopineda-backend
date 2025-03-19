 
<div class="row">
	<div class="col-12">
		<form id="formulario">
			<div class="card"  >
				<div class="card-body">
					<div class="row">
						<div class="col-md-12"> 
							<h6 class="card-subtitle"></h6>
							<div class="skin skin-minimal"> 
								<div class="form-row">
									<div class="col-md-12 mb-12">
										<input type="hidden" value="<?php echo $data["id"] ?>" name="id" id="id">
										<div class="form-group">
											<label for="nombremesa">Número de Mesa</label>
											<input type="text" class="form-control" id="nombre_mesa" name="nombre_mesa"   placeholder="Descripción Mesa" >
										</div>
										<label for="validationDefault03">Ubicación Mesa</label> 
										<select class="select2 form-control custom-select"   name="id_ubicacion" id="id_ubicacion" style="width: 100%; height:36px;"> 
											<?php foreach ($data["select_lugar"] as $key => $value) {
												echo "<option value='".$value["lugarmesa_id"]."'>".$value["lugarmesa_descripcion"]."</option>";
											} ?>
										</select>
									</div>
								</div> 
							</div>
						</div> 
					</div>
				</div>
			</div>
						<center >
		<a href="<?php echo  base_url();?>">
			<button class="btn btn-danger" type="button" >Cancelar</button>
		</a> <button class="btn btn-primary " id="botones">Actualizar</button>
	</center>
		</form>
 
	</div>
</div>
<script type="text/javascript">
      $(function(){
     	$.post(base_url+"Mesas/traer_mesa",{"id":"<?php echo $data['id']?>"},function(data){
     	console.log(data.mesa_id_lugar);
            $("#nombre_mesa").val(data.mesa_numero); 
            $("#id_ubicacion option[value="+ data.mesa_id_lugar +"]").attr("selected",true);
     	},"json");
     });
	$(document).ready(function () {
		$('#formulario').validate({
			submitHandler: function (form) {
				var datos = {};
				datos["documento"]=$("#formulario").serialize();
				url = base_url+"Mesas/Editar_mesa"; 
				$.post(url,JSON.stringify(datos), function(respuesta){ 
					if(respuesta == 1){
						alertasuccess('Se Actualizo correctamente','Exitoso');
						setTimeout(function(){ 
							location.href = base_url+"Mesas";
						}, 1000);
					}else{
						alertainfo('No se pudo completar!','Error');
					}
				});
			}
		});
	});
</script>