
	<form method="POST" enctype="multipart/form-data" action="<?php echo base_url();?>proveedor/guardar">
<div class="panel-heading">
									<div class="pull-left">
										<h6 class="panel-title txt-dark"> DATOS DEL PROVEEDOR</h6>
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
					
					<label class="control-label mb-10 text-left">ruc</label>
					<div class='input-group date' >
					<input type="text" class="form-control" onkeypress="return solonumeros(event)" required="true" minlength="11" maxlength="11" name="ruc" id="ruc" autofocus="true" autocomplete="off" value=""/>
					    <span style="cursor:pointer;" onclick="jalar_sunat()" id="sunat"  class="btn btn-primary">
						      sunat
							</span>
						</div>
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">RAZON SOCIAL</label>
					<input type="text" class="form-control" required="true"  name="razon_social" id="razon_social"  value=""/>
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">DIRECCION</label>
					<input type="text" class="form-control"  name="direccion" id="direccion" autofocus="true" value="">
				  </div>
				</div>
			</div>
				<div class="row">
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">TELEFONO</label>
					<input type="text"  class="form-control" onkeypress="return solonumeros(event);" maxlength="9" minlength="9" name="telefono" id="telefono" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">CIUDAD</label>
					<input type="text" class="form-control"  name="ciudad" id="ciudad" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">NOMBRE COMERCIAL</label>
					<input type="text" class="form-control"  name="nombre_comercial" id="nombre_comercial"  value="">
				  </div>
				</div>
			    </div>
			    <div class="row">
			    <div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">CORREO</label>
					<input type="email" class="form-control" name="correo" id="correo"  value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">
				
					<label class="control-label mb-10 text-left">PAGINA WEB</label>
					<input type="pagina" class="form-control"  name="pagina" id="pagina"  value="">
				  </div>
				</div>
				
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label mb-10 text-left">CONTACTO </label>
						<input type="text" name="contacto" id="contacto" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
		    <div class="col-md-4">
					<div class="form-group">
						<label class="control-label mb-10 text-left">ESTADO HABIDO</label>
						<input type="text" name="habido" id="habido" class="form-control">
					</div>
				</div>
			</div>
			
	    </div>
	 </div>
	</div>

  <br>	
			  <center><a href="<?php echo  base_url();?>proveedor"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary">Guardar</button></center>								
		 
	  </form>


<script type="text/javascript">
	<?php

     if(isset($data["id"]))
     {?>
     

     $(function(){
      // $("#icono_empresa").attr("required",false);
     	$.post(base_url+"proveedor/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){
             
                $("#id").val(data[0]["proveedor_id"]);
                $("#razon_social").val(data[0]["proveedor_razonsocial"]);
                $("#direccion").val(data[0]["proveedor_direccion"]);
                $("#ruc").val(data[0]["proveedor_ruc"]);
                $("#ciudad").val(data[0]["proveedor_ciudad"]);
                $("#telefono").val(data[0]["proveedor_telefono"]);
                $("#nombre_comercial").val(data[0]["proveedor_nombrecomercial"]);
                $("#correo").val(data[0]["proveedor_email"]);
                $("#pagina").val(data[0]["proveedor_website"]);
                $("#contacto").val(data[0]["proveedor_contacto"]);
                $("#habido").val(data[0]["proveedor_estado_habido"]);

              



                  
                

               


     	},"json");
     });




     <?php }

	 ?>

	
</script>