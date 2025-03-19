 
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
										<center><label for="validationDefault03">MODULO PADRE</label></center>
										<select class="select2 form-control custom-select" onchange="llamarfuncion();" name="perfil" id="perfil" style="width: 100%; height:36px;">
											<?php foreach ($data["perfiles"] as $key => $value) {
												echo "<option value='".$value["perfil_id"]."'>".$value["perfil_descripcion"]."</option>";
											}?>
										</select>
									</div>
								</div> 
						</div>
					</div> 
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<h4 class="card-title">Lista de Permisos</h4>
						<h6 class="card-subtitle"></h6>
						<div class="skin skin-square"> 
								<div class="form-group" id="cuerpo_icono">
									<!--<label>Checkbox &amp; Radio List</label>
									<div class="input-group" >
										<ul class="icheck-list">
											<li>
												<input type="checkbox" class="check" id="minimal-checkbox-1">
												<label for="minimal-checkbox-1">Checkbox 1</label>
											</li>
											<li>
												<input type="checkbox" class="check" id="minimal-checkbox-2" checked>
												<label for="minimal-checkbox-2">Checkbox 2</label>
											</li> 
										</ul>
									</div>-->
								</div> 
						</div>
					</div> 
				</div>
			</div>
			<br>
									<center><a href="<?php echo  base_url();?>"><button class="btn btn-danger" type="button" >Cancelar</button></a> <button class="btn btn-primary ">Guardar</button></center><br>
		</div>
	</form>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$(".select2").select2();
		llamarfuncion();
	});
	$(document).ready(function () {
		$('#formulario').validate({
			submitHandler: function (form) {
				var datos = {};
				datos["documento"]=$("#formulario").serialize();
				url = base_url+"Permisos/procesamiento"; 
				$.post(url,JSON.stringify(datos), function(respuesta){ 
					if(respuesta == 2){
						alertasuccess('Se Registro correctamente','Exitoso');
						setTimeout(function(){ 
							 location.href = base_url+"Permisos";
						}, 3000);
					}else{
						alertainfo('No se pudo completar!','Error');
					}
				});
			}
		});
	});
	function llamarfuncion(){
	    $.ajax({
	        url: base_url+'Permisos/traermodulos', // url where to submit the request
	        type : "POST", // type of action POST || GET
	        dataType : 'json', // data type
	        data : {id :  $("#perfil").val()}, // post data || get data
	        success : function(result) { 
	        	var html = ''; 
	        	html+='<div class="row">';
	        	var idmodulos = [];
	        	aux = 0;
	        	for (var i = 0; i < (result.length -1); i++) {
	        		html+='<div class="col-md-3">';
	        		html+= '<label>'+result[i]["nombre_padre"]+'</label>';
		        	html+= '<div class="input-group" >';
		        	html+= '<ul class="icheck-list">';
		        	for (var j = 0; j < (result[i]["lista"].length); j++) { 
		        		for (var k = 0; k <  (result[(result.length-1)]["permisos"].length); k++) {
		        			if (result[(result.length-1)]["permisos"][k]["persed_id_modulo"] == result[i]["lista"][j]["modulo_id"]){
		        				idmodulos[aux] = 'flat-checkbox-'+i+j;
		        				aux++;
		        			} 
		        		}
		        		html+= '<li>'; 
		        		html+= '<input type="checkbox" data-checkbox="icheckbox_flat-red" name="permisos[]" id="flat-checkbox-'+i+j+'" value="'+result[i]["lista"][j]["modulo_id"]+'" class="check" >';
		        		html+= '<label for="flat-checkbox-'+i+j+'">'+result[i]["lista"][j]["modulo_nombre"]+'</label>';
		        		html+= '</li>';
		        	}		        
		        	html+= '</ul>';
		        	html+= '</div>';
		        	html+= '</div>';
	        	}
	        	html+= '</div>';
	        	console.log(idmodulos);
	        	$("#cuerpo_icono").empty().append(html);
				for (var i = 0; i < (idmodulos.length ); i++) {
	        		document.getElementById(idmodulos[i]).setAttribute('checked', 'checked');
	        	}
	        	//

	        },
	        error: function(xhr, resp, text) {
	            console.log(xhr, resp, text);
	        }
	    });
	}

</script>