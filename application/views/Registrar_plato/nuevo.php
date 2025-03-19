<style type="text/css">
   
   .disabledTab{
          pointer-events: none;
   }

   input[type=”file”]#imagen {
 width: 0.1px;
 height: 0.1px;
 opacity: 0;
 overflow: hidden;
 position: absolute;
 z-index: -1;
 }
</style>


<form  id="formulario_data" enctype="multipart/form-data" onsubmit="return guardar_plato()">
<div class="row">
   <input type="hidden" id="producto_id"  value="<?php if(isset($data["id"])){echo $data["id"];} ?>" name="producto_id">
   <div class="col-md-3">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30"> <img  id="preview"  src="<?php echo base_url() ?>public/default.jpg" class="img-circle" style="width: 120px;height: 120px;">
                                   
                                </center>

                            </div>
                            <hr>
                            <div class="card-body"> 
                            <div class="col-md-12">                                  
                                       <label>Imagen</label>
                                       <input type="file" onchange="mostrar(this)" id="imagen" name="imagen">
                                   </div>
                                 
                            </div>
                           
                           
                        </div>
          </div>

<div class="col-md-9">
<div class="col-md-12">
	<div class="row">
    
		<div class="col-md-4">
			<div class="form-group">
          
				<label><i class="mdi mdi-barcode"></i> Codigo Barra </label>
				<input type="text" class="form-control" autocomplete="off" name="codigo_barra" id="codigo_barra">
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>Codigo Referencia </label>
				<input type="text" class="form-control" autocomplete="off" name="codigo_referencia" id="codigo_referencia">
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>Moneda</label>
				<select class="form-control" id="tipo_moneda" name="tipo_moneda">
					<?php
                          foreach ($data["moneda"] as $key => $value) {
                            echo "<option value='".$value["moneda_id"]."'>".$value["moneda_simbolo"]."</value>";
                          }
					?>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>monto</label>
				<input class="form-control" required="true" required="true" min="0" value="1.0" type="number" step="0.01" id="moneda" name="moneda">
			</div>

		</div>
		
	</div>
</div>
<div class="col-md-12">
	<div class="row">
     
		<div class="col-md-4">
			<div class="form-group">
			<label>Categoria 
				 <button type="button" onclick="abrir_nueva_categoria()" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                          					 <i class="ti-plus text" aria-hidden="true"></i>
                                              			</button></label>
			<select class="form-control" id="categoria" name="categoria">
				
			</select>
			</div>
		</div>
		 <div class="col-md-4">
          <div class="form-group">
             <label>Stock  Minimo</label>
            <input type="number" value="0.0" class="form-control" id="stock_minimo" name="stock_minimo">
          </div>
      </div>

        <div class="col-md-4">
         <div class="form-group">
            <label>Unidad Medida</label>
            <select class="form-control" id="unidad" name="unidad">
            
            </select>
         </div>
      </div>
		
	</div>
</div>
<div class="col-md-12">
	<div class="row">
     

		<div class="col-md-4">
			<div class="form-group">
				<label>Descripcion</label>
				<textarea class="form-control" required="true" id="descripcion" name="descripcion"></textarea>
			</div>
		</div>
		
       

         

	</div>
</div>


</div>

</div>
<div class="row">
	<div class="col-md-12">
   <div class="row">

      <!-- <div class="col-md-9">
       	  	<ul class="nav nav-tabs" onclick="verificar_producto()" id="myTab" role="tablist">
                                    <li id="tab_unidad_medida"   class="nav-item"> 
                                       <a class="nav-link show active" id="home-tab" data-toggle="tab" href="#home5" role="tab" aria-controls="home5" aria-expanded="true" aria-selected="true">
                                          <span class="hidden-sm-up">
                                             <i class="ti-home"></i>
                                          </span> 
                                          <span class="hidden-xs-down">EXTRAS</span>
                                       </a> 
                                    </li>
                                    
                             
               </ul>

                 <div class="tab-content tabcontent-border p-20" id="myTabContent">
                     <div role="tabpanel" class="tab-pane fade active show" id="home5" aria-labelledby="home-tab">
                          <div class="col-md-12">
                          	 <div class="row">
                           	 	<div class="col-md-9">
                           	 		
                           	 	</div>
                          	 </div>
                          </div>       
                      </div>

                 </div>       
       </div>-->
    
      
      <div class="col-md-12">
        <center><br><br><button type="submit" id="boton_guardar_producto" class="btn btn-primary">Guardar</button> <a href="<?php echo base_url() ?>Registrar_plato"><button id="boton_cancelar" type="button" class="btn btn-danger">Cancelar</button></a> </center> 
      </div>
       
   </div>
</div>
</div>

</form>



<div id="modal_categoria" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
     <div class="modal-dialog modal-lg">
        <div class="modal-content">
           <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar Nueva Categoria</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form onsubmit="return guardar_categoria()" id="formulario_categoria">
              <div class="modal-body">
                 <div class="col-md-12">
                 	<div class="row">
                 		<input type="hidden" id="categoria_id" name="categoria_id">
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Nombre de la Categoria</label>
                 				<input type="text" autocomplete="off" required="true" id="nombre_categoria" class="form-control" name="nombre_categoria">
                 			</div>
                 		</div>
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Imagen</label>
                 				<input type="file" id="imagen_categoria" name="imagen_categoria">
                 			</div>
                 		</div>
                 		

                 	</div>
                 	
                 </div>
              
             </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="boton_guardar_categoria" class="btn btn-success waves-effect">Guardar</button>
                    
               </div>
           </form>
            </div>
                                        <!-- /.modal-content -->
       </div>
                                    <!-- /.modal-dialog -->
</div>


<script type="text/javascript">
function traer_informacion()
{
   var producto_id=$("#producto_id").val();
   if(producto_id!=""){
   $.post(base_url+"R_producto/traer_informacion",{"producto_id":producto_id},function(data){
          $("#codigo_barra").val(data[0]["producto_codigobarra"]);
          $("#codigo_referencia").val(data[0]["producto_codigobarra"]);
          $("#tipo_moneda").val(data[0]["moneda_id"]);
          $("#moneda").val(data[0]["producto_precio"]);
          $("#categoria").val(data[0]["categoria_producto_id"]);
          //$("#marca").val(data[0]["marca_id"]);
          //$("#modelo").val(data[0]["producto_modelo"]);
         // $("#proveedor").val(data[0]["proveedor_id"]);

          $("#descripcion").val(data[0]["producto_descripcion"]);
          $("#stock_minimo").val(data[0]["producto_minimo"]);
          //$("#ubicacion").val(data[0]["producto_ubicacion"]);
          //$("#tipo_producto").val(data[0]["producto_id_tipoproducto"]);
           //$("#tab_equivalencia").removeClass("disabledTab");
           $("#unidad").val(data[0]["unidad_medida_id"]);
         //  $("#peso").val(data[0]["producto_kilogramo"]);

           //$("#precio_fijo"+data[0]["producto_estado_precio_fijo"]).prop("checked",true);



          $("#tipo_aplicar").val(data[0]["producto_tipo_precio"]);


         $("#peso").attr("readonly",true);
         $("#boton_cancelar").text("Retornar");

     
         //$("#unidad option").attr("disabled",true);
			//$("#unidad option[value="+data[0]["unidad_medida_id"]+"]").attr("disabled",false);

          //alert(data[0]["producto_imagen"]);
         if(data[0]["producto_imagen"]!="")
         {
             $("#preview").attr("src",base_url+"public/img/productos/"+data[0]["producto_imagen"]);
         }

            

   },"json");
   }

}



function guardar_plato()
{
console.log($("#formulario_data"));
$("#boton_guardar_producto").text("Guardando");
$("#boton_guardar_producto").attr("disabled",true);

  var formData = new FormData($("#formulario_data")[0]);
   $.ajax({
            type: 'POST',
            url: base_url+'Registrar_plato/guardar_plato',
            data: formData,
            contentType: false,
            cache: false,
            dataType: "json",
            processData:false,
            beforeSend: function(){
                $('.submitBtn').attr("disabled","disabled");
                $('#fupForm').css("opacity",".5");
            },
            success: function(msg){

            }
        }).done(function( data, textStatus, jqXHR ) {
        	swal("Excelente!", "Se registro Correctamente", "success");
                $("#boton_guardar_producto").text("Guardar");
                $("#boton_guardar_producto").attr("disabled",false);
          
              


              setTimeout(function(){ 
               location.href=base_url+"Registrar_plato";

               }, 1000);
          });
    
     return false;
}



 function mostrar(e)
{
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














function guardar_categoria()
{
   $("#boton_guardar_categoria").text("Guardando...");
   $("#boton_guardar_categoria").attr("disabled",true);
   var formData = new FormData($("#formulario_categoria")[0]);

    $.ajax({
            type: 'POST',
            url: base_url+'Registrar_plato/guardar',
            data: formData,
            contentType: false,
            cache: false,
            dataType: "json",
            processData:false,
            beforeSend: function(){
                $('.submitBtn').attr("disabled","disabled");
                $('#fupForm').css("opacity",".5");
            },
            success: function(msg){

            }
        }).done(function( data, textStatus, jqXHR ) {
              
              $("#boton_guardar_categoria").text("Guardar");
   $("#boton_guardar_categoria").attr("disabled",false);
   $("#formulario_categoria")[0].reset();
    $("#modal_categoria").modal("hide");
              setTimeout(function(){ 
                // location.href=base_url+"R_producto";

               }, 1500);
          });
    
     return false;




}

function abrir_nueva_categoria()
{

   $("#modal_categoria").modal();

}







	$(function(){

		actualizar_medida();
		actualizar_categoria();
		traer_informacion();
	});

	function actualizar_medida()
	{
		$.post(base_url+"R_producto/actualizar_medida",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["id_unidad_medida"]+"'>"+data[i]["unidad_medida_descripcion"]+"</option>";
            }
           
           $("#unidad").empty().append(html);
           //$("#unidad_equivalencia").empty().append(html);

		},"json");
	}
	function actualizar_categoria()
	{
		$.post(base_url+"Registrar_plato/actualizar_categoria",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["categoria_producto_id"]+"'>"+data[i]["categoria_producto_descripcion"]+"</option>";
            }
           
           $("#categoria").empty().append(html);
           //$("#unidad_equivalencia").empty().append(html);

		},"json");
	}
</script>