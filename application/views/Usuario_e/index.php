<div class="panel panel-default card-view">
	<form method="POST" enctype="multipart/form-data" action="<?php echo base_url();?>Usuario_e/guardar">
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
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">

								<label class="control-label mb-10 text-left">USUARIO</label>
								<input type="text" class="form-control" required="required" name="usuario" id="usuario" autofocus="true" value="">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">

								<label class="control-label mb-10 text-left">CLAVE</label>
								<input type="password" class="form-control" required="required" name="clave" id="clave"  value="">
							</div>
						</div>








					</div>
				</div>
			</div>
		</div>

		<br>	
		<center>

			<button class="btn btn-primary" id="boton_guardar"
			
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


		$(function(){

			$.post(base_url+"Usuario_e/traer_uno",function(data){ 
				$("#id").val(data["usuario"][0]["id_usuarioe"]);
				$("#usuario").val(data["usuario"][0]["usuario_eli"]);
				$("#clave").val(data["usuario"][0]["clave_eli"]);


			},"json");
		});



	</script>