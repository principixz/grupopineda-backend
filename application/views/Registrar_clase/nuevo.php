<form id="formulario" name="formulario" onsubmit="return guardar()" >
<div class="col-md-12">
	<input type="hidden" id="id" value="<?php if(isset($data['id'])){ echo $data['id'];}?>" name="id">
	<div class="row">
		<div class="col-md-12">
			<label>Descripcion</label>
			<input type="text" required="true" id="descripcion" name="descripcion" class="form-control">
		</div>
	</div>
</div>
<div class="col-md-12">
	
		<center>
			<br><br>
			<a href=""><button name="" class="btn btn-danger" id="">Cancelar</button></a>
				<button class="btn btn-success">Guardar	</button>
		</center>

</div>
</form>


<script type="text/javascript">
	function guardar(){

		$.post(base_url+"Registrar_clase/guardar",$("#formulario").serialize(),function(data){

			location.href=base_url+"Registrar_clase";

		});

		return false;
	}

	function actualizar(){

	var id=$("#id").val();
	if(id!=""){
        $.post(base_url+"Registrar_clase/traer_uno",{"id":id},function(data){
             $("#descripcion").val(data[0]["clase_descripcion"]); 
        },"json");
	}
	}

	$(function(){
		actualizar();
	});
</script>