<div class="panel panel-default card-view">
	<form method="POST" enctype="multipart/form-data" action="<?php echo base_url();?>usuario/guardar">
<div class="panel-heading">
									<div class="pull-left">
										<h6 class="panel-title txt-dark"> DATOS DEL USUARIO</h6>
									</div>
									<div class="clearfix"></div>
								</div>
<div class="panel-wrapper collapse in">
 	<div class="panel-body">
      <div class="form-wrap">
	
			<input type="hidden"  name="id" id="id">
			<div class="row" style="display: none;">
				<div class="col-md-4">
			      	<label class="control-label mb-10">¿Él empleado se encuentra en Planilla?</label>
			      	<div>

			      		<div class="radio">
			      			<input type="radio" name="estadoplanilla" id="estadoplanilla" onclick="cambiarestado(1);" value="1" checked="">
			      			<label for="estadoplanilla">
			      				Sí
			      			</label>
			      		</div>
			      		<div class="radio">
			      			<input type="radio" name="estadoplanilla" id="estadoplanilla" onclick="cambiarestado(0);" value="0">
			      			<label for="estadoplanilla_02">
			      				No
			      			</label>
			      		</div>
			      	</div>
			      </div>
			</div>
			<div class="row">
		    <div class="col-md-4">
				<div class="form-group">
					
					<label class="control-label mb-10 text-left">NOMBRES COMPLETOS</label>
					<input type="text" class="form-control" required="required" name="nombre" id="nombre" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">APELLIDOS COMPLETOS</label>
					<input type="text" class="form-control" required="required" name="apellido" id="apellido"  value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">DNI</label>
					<input type="text" class="form-control" onkeypress="return solonumeros(event)" required="required" maxlength="8" name="dni" id="dni" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">DIRECCION</label>
					<input type="text" class="form-control" required="required" name="direccion" id="direccion" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">CORREO</label>
					<input type="text" class="form-control" required="required" name="correo" id="correo" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">TELEFONO</label>
					<input type="text" onkeypress="return solonumeros(event)"  maxlength="9" class="form-control" required="required" name="telefono" id="telefono" maxlength="9"   value="">
				  </div>
				</div>
			    
			    <div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">USUARIO</label>
					<input type="text" class="form-control" required="required" name="usuario" onchange="buscar_usuario()" onkeyup="buscar_usuario()" id="usuario"  value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">CLAVE</label>
					<input type="password" class="form-control" required="required" name="clave" id="clave"  value="" placeholder="MINIMO 8 MAXIMO 16 CARACTERES" maxlength="16" minlength="8">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">FECHA DE NACIMIENTO</label>
					<input type="date" class="form-control" required="required" name="fecha" id="fecha" max="<?php echo date("Y-m-d")?>" value="">
				  </div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>Seleccionar perfil</label>
						<select class="form-control" id="perfil" name="perfil" required="required">
						  <option value="">Seleccionar</option>
						  	<?php foreach ($data["perfil"] as $key => $value) {
						  		echo "<option value='".$value["perfil_id"]."'>".$value["perfil_descripcion"]."</option>";
						  	} ?>
						  </option> 
						</select>
					</div>
				</div>
				<!--<div class="col-md-4">
		      		<div class="form-group">
		      			<label>FECHA DE INICIO CONTRATO</label>
		      			<input type="date" name="fecha_inicio" id="fecha_inicio" class="form-control" required="required">
		      		</div>
	         	</div>
	      	   <div class="col-md-4">
			      		<div class="form-group">
			      			<label>FECHA DE FIN CONTRATO</label>
			      			<input type="date" name="fecha_fin" id="fecha_fin" class="form-control" required="required">
			      		</div>
	         	</div>-->
	         	 <div class="col-md-4">
			      		<div class="form-group">
			      			<label>SUELDO PLANILLA</label>
			      			<input type="number" min="0" value="0" onkeyup="verificar_planilla()
" max="20000" name="salario_planilla" id="salario_planilla" class="form-control" required="required">
			      		</div>
	         	</div>
	         	 <div class="col-md-4">
			      		<div class="form-group">
			      			<label>SUELDO REAL</label>
			      			<input type="number" min="0" value="0" onchange="verificar_planilla()" max="20000"  name="salario_real" id="salario_real" class="form-control" required="required">
			      		</div>
	         	</div>
	         	<div class="col-md-4" style="display: none;">
	         	   <div class="form-group">
	         	   	  <label>FONDO DE PENSION</label>
                      <select class="form-control" id="fondo_pension" name="fondo_pension" > 
                      	<option value="">Seleccionar</option>
                      </select>	         	  
	         	   </div>
	         	</div>

	         	<div class="col-md-4 ocultar" style="display: none;">
	         	   <div class="form-group">
	         	   	  <label>FONDO DE SALUD</label>
                      <select class="form-control" id="fondo_salud" name="fondo_salud"  > 
                      	<option value="">Seleccionar</option>
                      	 
                      </select>
	         	  
	         	   </div>
	         	</div>
	         	<div class="col-md-4 ocultar" style="display: none;">
	         	   <div class="form-group">
	         	   	  <label>Banco a Usar</label>
                      <select class="form-control" id="idbanco" name="idbanco" > 
 
                      </select>
	         	  
	         	   </div>
	         	</div>
	         	<div class="col-md-4 ocultar" style="display: none;">
			      	<div class="form-group">
			      		<label>N° de Cuenta</label>
			      		<input type="number" name="ncuenta" id="ncuenta" class="form-control" >
			      	</div>
	         	</div>
	         	<div class="col-md-4 ocultar" style="display: none;">
			      	<div class="form-group">
			      		<label>N° de C.C.I</label>
			      		<input type="number" name="ncci" id="ncci" class="form-control"  >
			      	</div>
	         	</div>
	<div class="col-md-4" style="display: none;">

					<div class="form-group">

						<label class="control-label mb-10 text-left">INGRESO MAÑANA</label>

					    	<div class='input-group date' >

							<input type='text' class="form-control" value="<?php echo $data['sede'][0]['sede_horario_m_i']; ?>" id='datetimepicker2' autocomplete="off" name="tiempo_m" />

						  	  <span class="input-group-addon">

						      <span class="fa fa-clock-o"></span>

							</span>

							</div>

						</div>

				</div>

				<div class="col-md-4" style="display: none;">

					<div class="form-group">

						<label class="control-label mb-10 text-left">SALIDA MAÑANA</label>

					    	<div class='input-group date' >

							<input type='text' class="form-control" value="<?php echo $data['sede'][0]['sede_horario_m']; ?>" id='datetimepicker3' autocomplete="off" name="tiempo_m_c" />

						  	  <span class="input-group-addon">

						      <span class="fa fa-clock-o"></span>

							</span>

							</div>

						</div>

				</div>

				<div class="col-md-4" style="display: none;">

					<div class="form-group">

						<label class="control-label mb-10 text-left">INGRESO TARDE</label>

					    	<div class='input-group date' >

							<input type='text' class="form-control"  id='datetimepicker4'  value="<?php echo $data['sede'][0]['sede_horario_t_i']; ?>" autocomplete="off" name="tiempo_t" />

						  	  <span class="input-group-addon">

						      <span class="fa fa-clock-o"></span>

							</span>

							</div>

						</div>

				</div>

				<div class="col-md-4" style="display: none;">

					<div class="form-group">

						<label class="control-label mb-10 text-left">SALIDA TARDE</label>

					    	<div class='input-group date' >

							<input type='text' class="form-control" value="<?php echo $data['sede'][0]['sede_horario_t']; ?>" id='datetimepicker5' autocomplete="off" name="tiempo_t_c"/>

						  	  <span class="input-group-addon">

						      <span class="fa fa-clock-o"></span>

							</span>

							</div>

						</div>

				</div>

				<div id="fecha_inicio_data" class="col-md-4" style="display: none;">
					<div class="form-group">
						<label>FECHA DE INICIO CONTRATO</label>
						<input type="date" id="fecha_contrato_inicio" class="form-control"   name="fecha_contrato_inicio">
					</div>
				</div>

				<div id="fecha_fin_data" class="col-md-4" style="display: none;">
					<div class="form-group">
						<label>FECHA DE FIN CONTRATO</label>
						<input type="date" id="fecha_contrato_fin" class="form-control"   name="fecha_contrato_fin">
					</div>
				</div>




	 
			
			
	    </div>
	 </div>
	</div>

  <br>	
			  <center><a href="<?php echo  base_url();?>usuario"><button class="btn btn-danger" type="button" >Cancelar</button><a> 

			  	<button class="btn btn-primary" id="boton_guardar"
			  	<?php if(!isset($data["id"])) { echo 'disabled="true"'; } ?>
         >Guardar</button></center>								
		 
	  </form>
</div>


<script type="text/javascript">
function verificar_planilla()
{

	var sueldo_planilla=$("#salario_planilla").val();
	var sueldo_real=$("#salario_real").val();
	var numero_sueldo_planilla=parseFloat(sueldo_planilla);
	var numero_sueldo_real=parseFloat(sueldo_real);
	
	if(parseFloat($("#salario_real").val())<=parseFloat($("#salario_planilla").val()))
	{
	
           var total=$("#salario_planilla").val();
           $("#salario_real").val(total);
	}
}
</script>


<script type="text/javascript">

	<?php

     if(isset($data["id"]))
     {?>
     

     $(function(){

     	$("#fecha_inicio_data").hide();
     	$("#fecha_fin_data").hide();
          $("#fecha_contrato_inicio").attr("required",false);
          	$("#fecha_contrato_fin").attr("required",false);
          	$('.ocultar').hide(); 
      // $("#icono_empresa").attr("required",false);
      document.getElementById("usuario").readOnly = true;
     	$.post(base_url+"usuario/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){ 
             	$("div input[type=radio][name='estadoplanilla'][value="+data["usuario"][0]["empleado_estado_planilla"]+"]").prop ("checked", true);
                $("#id").val(data["usuario"][0]["empleado_id"]);
                $("#nombre").val(data["usuario"][0]["empleado_nombres"]);
                $("#apellido").val(data["usuario"][0]["empleado_apellidos"]);
                $("#dni").val(data["usuario"][0]["empleado_dni"]);
                $("#direccion").val(data["usuario"][0]["empleado_direccion"]);
                $("#correo").val(data["usuario"][0]["empleado_email"]);
                $("#telefono").val(data["usuario"][0]["empleado_telefono"]);
                $("#usuario").val(data["usuario"][0]["empleado_usuario"]);
                $("#clave").val(data["usuario"][0]["empleado_clave"]);
                $("#fecha").val(data["usuario"][0]["empleado_fecha_nacimiento"]);
               $("#perfil option[value="+ data["usuario"][0]["perfil_id"] +"]").attr("selected",true);
               $("#idbanco option[value="+ data["usuario"][0]["empleado_idbanco"] +"]").attr("selected",true);
               $("#ncuenta").val(data["usuario"][0]["empleado_numbanco"]);
                $("#ncci").val(data["usuario"][0]["empleado_cci"]);
               // $("#fecha_inicio").val(data["usuario"][0]["empleado_fecha_ingreso"]);
//$("#fecha_fin").val(data["usuario"][0]["empleado_fecha_salida"]);
                $("#salario_real").val(data["usuario"][0]["empleado_sueldoreal"]);
                $("#salario_planilla").val(data["usuario"][0]["empleado_sueldoplanilla"]);
               $("#fondo_pension option[value="+ data["usuario"][0]["id_fondo_pension"] +"]").attr("selected",true);
               $("#fondo_salud option[value="+ data["usuario"][0]["empleado_idsalud"] +"]").attr("selected",true);

             $("#datetimepicker2").val(data["usuario"][0]["empleado_horario_entrada_man"]);
                  $("#datetimepicker3").val(data["usuario"][0]["empleado_horario_salida_man"]);
                    $("#datetimepicker4").val(data["usuario"][0]["empleado_horario_entrada_tar"]);
                
 		 $("#datetimepicker5").val(data["usuario"][0]["empleado_horario_salida_tar"]);
               	
 		 if (data["usuario"][0]["empleado_estado_planilla"] == 0) {
 		 	$('.ocultar').hide(); 
 		 	$('#ncuenta').removeAttr("required");
 		 	$('#fondo_pension').removeAttr("required");
 		 	$('#fondo_salud').removeAttr("required");
 		 	$('#idbanco').removeAttr("required");
 		 	$('#ncci').removeAttr("required");
 		 	$('#ncuenta').removeAttr("required");
 		 	$('#ncci').removeAttr("required");
 		 }else{
 		 	$('.ocultar').show(); 
 		 	$('#ncuenta').prop("required", "required");
 		 	$('#fondo_pension').prop("required", "required");
 		 	$('#fondo_salud').prop("required", "required");
 		 	$('#idbanco').prop("required", "required");
 		 	$('#ncci').prop("required", "required");
 		 	$('#ncuenta').prop("required", "required");
 		 	$('#ncci').prop("required", "required");
 		 }


     	},"json");
     });




     <?php }

	 ?>

	 function cambiarestado(estado){
	 	if (estado == 0) {
	 		$('.ocultar').hide(); 
	 		 $('#ncuenta').removeAttr("required");
	 		$('#fondo_pension').removeAttr("required");
 		 	$('#fondo_salud').removeAttr("required");
 		 	$('#idbanco').removeAttr("required");
 		 	$('#ncci').removeAttr("required");
 		 	$('#ncuenta').removeAttr("required");
 		 	$('#ncci').removeAttr("required");

	 	}else{
	 		$('.ocultar').show(); 
	 		$('#ncuenta').prop("required", true);
	 		$('#fondo_pension').prop("required", "required");
 		 	$('#fondo_salud').prop("required", "required");
 		 	$('#idbanco').prop("required", "required");
 		 	$('#ncci').prop("required", true);
 		 	$('#ncuenta').prop("required", true);
 		 	$('#ncci').prop("required", true);
	 	}
	 }

	 function buscar_usuario()
	 {
	 	  $("#boton_guardar").attr("disabled",true);
	 	valor=$("#usuario").val();
	 	espacio_s=valor.replace(" ", "");
	 	$("#usuario").val(espacio_s);
	 	$.post(base_url+"Usuario/buscar_usuario",{"usuario":valor},function(data){
	 		if(parseInt(data)==1)
	 		{
             $("#boton_guardar").attr("disabled",false);
	 		}else{

             $("#boton_guardar").attr("disabled",true);
              
	 		}

	 	});
	 }
</script>