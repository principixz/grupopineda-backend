<form method="POST" enctype="multipart/form-data" action="<?php echo base_url();?>Clientes/guardar">

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

			    	<div class="col-md-4">

						<div class="form-group">						

							<label class="control-label  mb-10 text-left ">D.N.I/R.U.C</label>

							
								<input type="text" autocomplete="off" class="form-control" required="true" maxlength="11" name="dni" id="dni" autofocus="true" value="" required />

						</div>

					</div>

					<div class="col-md-4">

						<div class="form-group">					

							<label class="control-label mb-10 text-left">NOMBRE Y APELLIDOS</label>

							<input type="text" class="form-control" required="true" name="nombres" id="nombres"  value="" required/>

					  	</div>

					</div>

					<div class="col-md-4">

						<div class="form-group">					

							<label class="control-label mb-10 text-left">DIRECCION</label>

							<input type="text" class="form-control" autocomplete="off" required="true" name="direccion" id="direccion" autofocus="true" value="" required>

						</div>

					</div>

				</div>

				<div class="row">

				    <div class="col-md-4">

						<div class="form-group">					

							<label class="control-label mb-10 text-left">CORREO</label>

							<input type="email" class="form-control" autocomplete="off" required="true" name="correo" id="correo"  value="" required>

					  	</div>

					</div>					

					<div class="col-md-4">

						<div class="form-group">					

							<label class="control-label mb-10 text-left">TELEFONO</label>

							<input type="text"  class="form-control" onkeypress="return solonumeros(event);" maxlength="9" minlength="9"  required="true" name="telefono" autocomplete="off" id="telefono" autofocus="true" value="" required>

					  	</div>

					</div>

					<div class="col-md-4">

						<div class="form-group">					

							<label class="control-label mb-10 text-left">CIUDAD</label>

							<input type="text"  autocomplete="off" class="form-control" required="true" name="ciudad" id="ciudad" autofocus="true" value="" required>

					 	</div>

					</div>				    				

				</div>		

			</div>

		    </div>

		</div>

	</div>

  	<br>	

	<center><a href="<?php echo  base_url();?>Clientes"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary">Guardar</button></center>								

</form>





<script type="text/javascript">

<?php if(isset($data["id"])) {?>

    $(function(){

     	$.post(base_url+"Clientes/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){             

            $("#id").val(data[0]["cliente_id"]);

            $("#nombres").val(data[0]["cliente_nombres"]);

            $("#direccion").val(data[0]["cliente_direccion"]);

            $("#dni").val(data[0]["cliente_dni"]);

            $("#ciudad").val(data[0]["cliente_ubicacion"]);

            $("#telefono").val(data[0]["cliente_telefono"]);

            $("#correo").val(data[0]["cliente_email"]);

        },"json");

     });

<?php }?>





</script>