<div class="panel panel-default card-view">
								<div class="panel-heading">
									<div class="pull-left">
										<h6 class="panel-title txt-dark">INGRESAR DATOS</h6>
									</div>
									<div class="clearfix"></div>
								</div>
<div class="panel-wrapper collapse in">
 	<div class="panel-body">
      <div class="form-wrap">
		<form method="POST" action="<?php echo base_url();?>modulo/guardar">
			<input type="hidden"  name="id" id="id">
			<div class="row">
		    <div class="col-md-4">
				<div class="form-group">

					<label class="control-label mb-10 text-left">DESCRIPCION DEL MODULO</label>
					<input type="text" class="form-control" required="true" name="descripcion" id="descripcion" autofocus="true" value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">

					<label class="control-label mb-10 text-left">URL</label>
					<input type="text" class="form-control" required="true" name="url" id="url"  value="">
				  </div>
				</div>
				<div class="col-md-4">
				<div class="form-group">

					<label class="control-label mb-10 text-left">ICONO</label>
					<input type="text" class="form-control" required="true" name="icono" id="icono" autofocus="true" value="">
				  </div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label class="control-label mb-10 text-left">MODULO PADRE</label>
						 <select class="form-control" name="modulo" id="modulo">
						 	<?php
                               foreach ($data["select_modulo_padre"] as $key => $value) {
                                echo "<option value='".$value["modulo_id"]."'>".$value["modulo_nombre"]."</option>";
                               }
						 	?>
						 </select>
					</div>
				</div>
			</div>
			  <br>
			  <center><a href="<?php echo  base_url();?>modulo"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary">Guardar</button></center>
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

     	$.post(base_url+"modulo/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){
              console.log(data);
              $("#id").val(data[0]["modulo_id"]);
              $("#descripcion").val(data[0]["modulo_nombre"]);
              $("#url").val(data[0]["modulo_url"]);
              $("#icono").val(data[0]["modulo_icono"]);

               $("#modulo option[value="+ data[0]["modulo_padre"] +"]").attr("selected",true);


     	},"json");
     });




     <?php } ?>
</script>