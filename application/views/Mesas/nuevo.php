<form id="formulario" class="form-element">
	<div class="box-body">
		<div class="row">
			<div class="col-md-6 col-12">
				<div class="form-group">
					<label for="mesas">Cantidad de Mesas</label>
					<input type="number" class="form-control" id="mesas" name="mesas"  onkeypress="return solonumeros(event)" min="1" placeholder="Ingrese Cantidad Mesas" onchange="actualizarlista();" onkeyup="actualizarlista();">
				</div>
				<div class="form-group">
					<label for="mesas">Ubicación de la Mesa</label>
					<select class="form-control" id="ubicacionmesa" onchange="actualizarlista();" name="ubicacionmesa" >
						<option value="0">Seleccionar</option>
						<?php foreach ($data["select_lugar"] as $key => $value) {
							echo "<option value='".$value["lugarmesa_id"]."'>".$value["lugarmesa_descripcion"]."</option>";
						} ?>
					</select>
				</div>
			</div> 
			<div class="col-md-6 col-12" id="mesasid">
				<div class="form-group">

				</div> 
				<div class="form-group">

				</div> 
			</div> 
		</div> 
	</div>
	<center >
		<a href="<?php echo  base_url();?>/Mesas">
			<button class="btn btn-danger" type="button" >Cancelar</button>
		</a> <button class="btn btn-primary " id="botones">Guardar</button>
	</center> 
</form>




<script type="text/javascript">
	$(function() {  
		document.getElementById("botones").style.display = "none";
	});
	$(document).ready(function () {
		$('#formulario').validate({
			submitHandler: function (form) {
				var datos = {};
				datos["documento"]=$("#formulario").serialize();
				url = base_url+"Mesas/procesamiento"; 
				$.post(url,JSON.stringify(datos), function(respuesta){ 
					if(respuesta == 1){
						alertasuccess('Se Registro correctamente','Exitoso');
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
	function actualizarlista(){ 
		if ($("#mesas").val() <= 0 || $("#ubicacionmesa").val() == 0 ) {
			document.getElementById("botones").style.display = "none";
			return 0;
		} 
		document.getElementById("botones").style.display = "initial";
		html ="";
		for (var i = 1; i <= $("#mesas").val(); i++) {
			if (i == 1) {
				a = 'onchange="actualizarnumeros(this.value)"';
			}else{
				a  = '';
			}
			html+='<div class="form-group">';
			html+='<label for="nombremesa'+i+'">Mesa N° '+i+'</label>';
			html+='<input type="text" class="form-control" id="nombre_mesa'+i+'" name="nombre_mesa[]" '+a+' placeholder="Descripción Mesa" >';
			html+='</div>';
		}
		$("#mesasid").empty().html(html);
	}

	function actualizarnumeros(valor){
		url = base_url+"Mesas/Traersiguiente"; 
		$.post(url,{'valor' : valor,'cantidad' : $("#mesas").val()}, function(respuesta){ 
 
				
				for (var j = 0; j < $("#mesas").val(); j++) {
					id = '#nombre_mesa'+(j+1);
					$(id).val(respuesta[j]);
				}
									
 
		 },'json');
	}

</script>