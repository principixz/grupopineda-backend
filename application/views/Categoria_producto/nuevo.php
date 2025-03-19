<div class="box-body">
<div class="panel panel-default card-view">
  
		<div class="panel-body">
			<div class="form-wrap">
				<form method="POST" enctype="multipart/form-data" action="<?php echo base_url();?>C_producto/guardar">
					<div class="col-md-12">
						<div class="col-lg-12">
							<center>
								<div class="img-upload-wrap">
									<img class="img-responsive" id="preview" style="width: 200px;height: 200px;border-radius:150px;" src="<?php echo base_url()?>public/categoriap/default.jpg" alt="upload_img"> 
								</div>
								<div class="fileupload btn btn-success btn-anim" style="width: 252px;"><i class="fa fa-upload"></i><span class="btn-text">Subir nueva Imagen</span>
									<input type="file" onchange="mostrar(this)" id="imagen" name="imagen" class="upload">
								</div>
							</center>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="hidden"  name="id" id="id">
							<label class="control-label mb-10 text-left">DESCRIPCION DE LA CATEGORIA</label>
							<input type="text" class="form-control" required="true" name="descripcion" id="descripcion" autofocus="true" value="">
						</div>
						<br>
					</div>
					<center><a href="<?php echo  base_url();?>C_producto"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary">Guardar</button></center>								
					</form>
				</div>
			</div>
		</div> 
</div>


<script type="text/javascript">

	function mostrar(e){
	if(e.files && e.files[0])
	{
 
		// Comprobamos que sea un formato de imagen
		if (e.files[0].type.match('image.*')) {
 
			// Inicializamos un FileReader. permite que las aplicaciones web lean 
			// ficheros (o información en buffer) almacenados en el cliente de forma
			// asíncrona
			// Mas info en: https://developer.mozilla.org/es/docs/Web/API/FileReader
			var reader=new FileReader();
 
			// El evento onload se ejecuta cada vez que se ha leido el archivo
			// correctamente
			reader.onload=function(e) {
				$("#preview").attr("src",e.target.result);
			}
 
			// El evento onerror se ejecuta si ha encontrado un error de lectura
			reader.onerror=function(e) {
				alert("Error de lectura");
			}
 
			// indicamos que lea la imagen seleccionado por el usuario de su disco duro
			reader.readAsDataURL(e.files[0]);
		}else{
 
			// El formato del archivo no es una imagen
			alert("No es un formato de imagen");
		}
	}
}




	<?php if(isset($data["id"])){?>
     

     $(function(){
    
     	$.post(base_url+"C_producto/traer_uno",{"id":"<?php echo $data['id']?>"},function(data){
              console.log(data);
			$("#id").val(data[0]["categoria_producto_id"]);
			$("#descripcion").val(data[0]["categoria_producto_descripcion"]);
            if(data[0]["insumo_imagen"]!=""){
               $("#preview").attr("src",base_url+"public/categoriap/"+data[0]["categoria_imagen"]);
            }             
     	},"json");
     });
     <?php }?>
 

</script>
