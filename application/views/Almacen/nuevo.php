<div class="panel panel-default card-view">
								<div class="panel-heading">
									<div class="pull-left">
										<h6 class="panel-title txt-dark">INGRESAR DATOS DE ALMACEN</h6>
									</div>
									<div class="clearfix"></div>
								</div>
<div class="panel-wrapper collapse in">
 	<div class="panel-body">
      <div class="form-wrap">
		<form method="POST" action="<?php echo base_url();?>almacen/guardar">
			<div class="row">
				<div class="col-md-6">
				<div class="form-group">
				<input type="hidden"  name="id" id="id">
				<label class="control-label mb-10 text-left">DESCRIPCION DE ALMACEN</label>
				<input type="text" class="form-control" required="true" name="descripcion" id="descripcion" autofocus="true" value="">
			  </div></div>	
			  <div class="col-md-6">
			  	<div class="form-group">
		
				<label class="control-label mb-10 text-left">DIRECCION DE ALMACEN</label>
				<input type="text" class="form-control" required="true" name="direccion" id="direccion" autofocus="true" value="">
			  </div>
			  </div>
			</div>
			  <br>

			  <center><a href="<?php echo  base_url();?>almacen"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary">Guardar</button></center>								
		   </form>
	    </div>
	 </div>
	</div>
</div>

<script type="text/javascript">
	<?php

     if(isset($data["id"]))
     {?>
     

     $(function(){
    
     	$.post(base_url+"almacen/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){
              console.log(data);
              $("#id").val(data[0]["almacen_id"]);
              $("#descripcion").val(data[0]["almacen_descripcion"]);
              $("#direccion").val(data[0]["almacen_direccion"]);


     	},"json");
     });




     <?php }

	 ?>
</script>