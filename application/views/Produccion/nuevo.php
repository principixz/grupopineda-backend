<style type="text/css">
	




  .disabledTab{
         pointer-events: none;
   }
</style>
<div class="col-md-12">
  <div class="row">
    <div class="col-md-1">
    <a href="<?php echo base_url(); ?>Produccion">
      <button  class="btn btn-xs btn-danger"><i class="fa fa-arrow-left"></i>
      </button></a>
    </div>
   
  </div>
  <div class="row"><br></div>
	<div class="row">
		<div class="col-md-12">
				<ul class="nav nav-tabs" onclick="verificar_producto()" id="myTab" role="tablist">
                                    <li id="tab_unidad_medida"   class="nav-item"> 
                                       <a class="nav-link show active" id="home-tab" data-toggle="tab" href="#home5" role="tab" aria-controls="home5" aria-expanded="true" aria-selected="true">
                                          <span class="hidden-sm-up">
                                             <i class="ti-home"></i>
                                          </span> 
                                          <span class="hidden-xs-down">PLATOS NUEVOS </span>
                                       </a> 
                                    </li>
                                    <li  id="tab_equivalencia"  class="nav-item disabledTab">
                                        <a  class="nav-link show" id="profile-tab" data-toggle="tab" href="#profile5" role="tab" aria-controls="profile" aria-selected="false"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">PRODUCTOS UTILIZADOS</span>
                                        </a>
                                     </li>
                             
               </ul>
                   <div class="tab-content tabcontent-border p-20" id="myTabContent">
                                    <div role="tabpanel" class="tab-pane fade active show" id="home5" aria-labelledby="home-tab">
                                     
                                    	<form id="formulario_plato_nuevo" onsubmit="return agregar_plato()">

                                    	<div class="col-md-12">
                                    		<div class="row">
                                    			<div class="col-md-5">
                                    				<div class="form-group">
                                    					<label>Platos</label>
                                    					<select required="true" style="width: 100%;" id="plato_id" name="plato_id">
                                    						<option value="">Seleccionar Plato</option>
                                    					</select>
                                    				</div>
                                    			</div>
                                    			<div class="col-md-4">
                                    				<div class="form-group">
                                    					<label>Cantidad</label>
                                    					<input required="true" type="number" style="" class="form-control" id="cantidad" name="cantidad">
                                    				</div>
                                    			</div>
                                    			<div class="col-md-3">
                                    				<br>
                                    				<center>
                                    					<button type="submit" class="btn btn-primary">Agregar</button>
                                    					<button type="button" onclick="ir_platos_utilizados()"   class="btn btn-success">Continuar</button>
                                    				</center>
                                    			</div>
                                    		</div>
                                    	</div>
                                      </form>


                                    	<div class="col-md-12">
                                    		<form id="formulario_plato">
                                    			<div class="table-responsive">
				                                    <table class="table color-bordered-table success-bordered-table">
				                                        <thead>
				                                            <tr>
				                                                <th width="10%">#</th>
				                                                <th width="50%">Nombre Producto</th>
				                                                <th width="30%">Cantidad</th>
				                                                <th width="10%">Acciones</th>
				                                            </tr>
				                                        </thead>
				                                        <tbody id="cuerpo_agregar_plato">
				                                            
				                                        </tbody>
				                                    </table>
				                                </div>
                                      </form>
                                    		
                                    	</div>

                                      <div class="col-md-12">
                                        
                                           <form id="formulario_observacion">
                                         
                                          <div class="col-md-12">
                                            <div class="form-group">
                                               <label>Observacion</label>
                                            <input type="text" id="observacion" name="observacion" class="form-control">
                                          </div>
                                          </div>
                                      </form>
                                        
                                      </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile5" role="tabpanel" aria-labelledby="profile-tab">
                                    	<form id="formulario_producto_nuevo" onsubmit="return agregar_producto()"> 
                                    		<div class="col-md-12">
                                    			<div class="row">
                                    				<div class="col-md-4">
                                    					<div class="form-group">
                                    					<label>Producto o insumo</label>
                                    					<select  onchange="traer_unidad()" required="true" style="width: 100%;" id="producto_id" name="producto_id">
                                    						<option value="">Seleccionar </option>
                                    					</select>
                                    				</div>
                                    				</div>
                                    				<div class="col-md-3">
                                    					 <center style="display: none;" id="cargando"> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>
	                                                     <div class="form-group">
	                                                       <label>Unidad Medida</label>
	                                                       <select required="true" class="form-control" id="unidad_medida" name="unidad_medida">
	                                                         <option value="">Selecionar Producto</option>
	                                                       </select>
	                                                     </div>
                                    				</div>
                                    				<div class="col-md-2">
                                    					<div class="form-group">
                                    						<label>Cantidad</label>
                                    						<input type="number" autocomplete="off"  required="true" id="cantidad_producto" class="form-control" step="0.01" name="cantidad_producto" >
                                    					</div>
                                    				</div>
                                    				<div class="col-md-3">
                                    				<br>
                                    				<center>
                                    					<button type="submit" class="btn btn-primary">
                                    						Agregar
                                    					</button>
                                    					<button type="button" id="procesar_produccion_data" onclick="procesar_produccion()"  class="btn btn-success">Guardar</button>
                                    				   </center>
                                    				 </div>
                                    			</div>
                                    			<div class="row">
                                    				<div class="col-md-4">
                                    					<div class="form-group">
                                    						<label>Almacen</label>
                                    						<select id="almacen_id" name="almacen_id" class="form-control">
                                    							<?php 

                                                                 foreach ($data["tabla"] as $key => $value) {
                                                                 	echo "<option value='".$value["almacen_id"]."'>".$value["almacen_descripcion"]."</option>";
                                                                 }


                                    							?>
                                    						</select>
                                    					</div>
                                    				</div>
                                    				<div class="col-md-4">
                                    					<div class="form-group">
                                    						<label>Stock</label>
                                    						<input type="number" readonly="true"  step="0.01"  class="form-control" id="stock" name="stock">
                                    					</div>
                                    				</div>
                                    				<div class="col-md-4">
                                    					<div class="form-group">
                                                <br><br>
                                    						<label id="unidad_medida_master"></label>
                                    					</div>
                                    				</div>
                                    			</div>
                                    		</div>
                                    		<div class="col-md-12">
                                    			<div class="row">
                                    				<div class="table-responsive">
				                                    <table class="table color-bordered-table primary-bordered-table">
				                                        <thead>
				                                            <tr>
				                                                <th width="5%">#</th>
				                                                <th width="30%">Nombre Producto</th>
				                                                <th width="30%">Unidad Medida</th>

				                                                <th width="30%">Cantidad</th>
				                                                <th width="5%">Acciones</th>
				                                            </tr>
				                                        </thead>
				                                        <tbody id="cuerpo_agregar_producto">
				                                            
				                                        </tbody>
				                                    </table>
				                                </div>
                                    			</div>
                                    		</div>
                                    	</form>
                                    </div>
                    </div>
		</div>
		<!--<div class="col-md-2">
			<center>
				<button class="btn btn-danger">Cancelar</button>
				<button class="btn btn-primary">Guardar</button>
			</center>
		</div>-->
	</div>
</div>

 <script src="<?php echo base_url();?>public/assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
<script type="text/javascript">

function procesar_produccion()
{



    datos_matriz={};
      datos_matriz["producto"]=$("#formulario_producto_nuevo").serialize();
datos_matriz["plato"] = $("#formulario_plato").serialize();
datos_matriz["observacion"] = $("#formulario_observacion").serialize();

//alert(datos_matriz["pago"]);
$("#procesar_produccion_data").text("Procesando...");
$("#procesar_produccion_data").attr("disabled",true);
console.log(JSON.stringify(datos_matriz));
$.post(base_url+"Produccion/procesar_produccion",JSON.stringify(datos_matriz),function(data)
{
if(data["estado"]==1){
$("#procesar_produccion_data").text("Guardar");
$("#procesar_produccion_data").attr("disabled",false);
 swal("SE GENERO LA TRANSACCION EXITOSA", "EXITOSA ", "success"); 
          //location.reload(true);
          setTimeout(function(){ 
            location.href =base_url+"Produccion";

          }, 1500);


}

},"json");



}

















 function eliminar_plato(id)
  {

    confirmar=confirm("¿Estas seguro que sea eliminar el plato?");
      if(confirmar)
      {
                $("#celda_plato_"+id).remove();
      }
  }
  function eliminar_producto(id)
  {

    confirmar=confirm("¿Estas seguro que sea eliminar el producto?");
      if(confirmar)
      {
                $("#celda_producto_"+id).remove();
      }
  }
   function agregar_producto()
   {

    var stock_total=$("#stock").val();
    var cantidad=$("#cantidad_producto").val();
    var id_unidad_medida=$("#unidad_medida").val();
    var conversion=id_unidad_medida.split("/");
    var total_cantidad=parseFloat(cantidad)*parseFloat(conversion[1]);
    var id_almacen=$("#almacen_id").val();


    var producto_id=$("#producto_id").val();

    var descripcion=$("#producto_id :selected").text();
    var cantidad_mostrar=$("#cantidad_producto").val();
    var descripcion_unidad_medida=$("#unidad_medida :selected").text();


   var canti=0;
     $('input[name="producto_id_data[]"]').map(function () {
                  var producto_id_data=$(this).val();
                  if(producto_id==producto_id_data){
                   canti=1;

                  }

      }).get();




           if(canti==1)
             {
              swal("ERROR", "NO SE PUEDE REGISTRAR EL MISMO PRODUCTO", "error");
              // $("#cantidad_plato_"+producto_id).focus();
               return false;
             }














    //alert(total_cantidad+" ver"+stock_total);
    if(total_cantidad<=parseFloat(stock_total))
    {
    

            var html="";   
        html+='<tr id="celda_producto_'+producto_id+'">';
        html+='<td><label id="texto_producto'+producto_id+'"></label></td>';

        html+='<td><input type="hidden" value="'+producto_id+'" id="producto_id_data_'+producto_id+'" name="producto_id_data[]" /><label id="nombreproducto'+producto_id+'">'+descripcion+'</label></td>';

  html+='<td><input type="hidden" value="'+id_almacen+'" id="id_almacen_data_'+producto_id+'" name="id_almacen_data[]" /><input type="hidden" value="'+id_unidad_medida+'" id="unidad_medida_producto_'+producto_id+'" name="unidad_medida_producto[]" /><label id="nombre_unidad_producto'+producto_id+'">'+descripcion_unidad_medida+'</label></td>';

         html+='<td><input type="number" readonly="true" id="cantidad_producto_'+producto_id+'" value="'+cantidad+'" name="cantidad_producto[]" class="form-control" /></td>';
         html+='<td><button onclick="eliminar_producto('+producto_id+')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></td>';
        html+='</tr>';


         $("#cuerpo_agregar_producto").prepend(html);

actualizar_dato_producto();

            var select=$('#producto_id');

            var option = new Option("Seleccionar","", true, true);
            select.append(option).trigger('change');

              // manually trigger the `select2:select` event
              select.trigger({
                type: 'select2:select'
              });
              traer_unidad();
              $("#cantidad_producto").val("");
                $("#stock").val("");
                $("#unidad_medida_master").text("");


    }else{

      alert("error sobre pasa el stock");
    }
            

     return false;


   }
   

    function actualizar_dato_producto()
  {

    var c=1;

         $('input[name="producto_id_data[]"]').map(function () {
                  var producto_id=$(this).val();
                  //console.log(producto_id);
                 // alert(producto_id);
                  $("#texto_producto"+producto_id).text(c);
                  
                 c++;

      }).get();

  }


   function buscar_stock()
   {

       var producto_id=$("#producto_id").val();
       var almacen_id=$("#almacen_id").val();
       $.post(base_url+"Produccion/mostrar_stock",
       	{"producto_id":producto_id,"almacen_id":almacen_id}
       	,function(data){
       		 $("#unidad_medida_master").text(data["unidad_medida"]);
       		 $("#stock").val(data["stock"]);


       },"json");


   }



function traer_unidad()
{

  var id=$("#producto_id").val();
  $("#cargando").show();
  $("#unidad_medida").hide();


  $.post(base_url+"Produccion/mostrar_unidad_medida",{"id":id},function(data){
    var html="";
      for(var i=0;i<data.length;i++)
      {
        $texto="";
        if(data[i]["detalle_unidad_producto_factor"]==1)
        {
          $texto=data[i]["unidad_medida_descripcion"];
        }else{
          $texto=data[i]["unidad_medida_descripcion"]+"X"+data[i]["detalle_unidad_producto_factor"];

        }
        html+="<option value='"+data[i]["detalle_unidad_producto_id"]+"/"+data[i]["detalle_unidad_producto_factor"]+"'>"+$texto+"</option>";

      }

      $("#unidad_medida").empty().append(html);
        $("#cargando").hide();
  $("#unidad_medida").show();
  },"json");

  buscar_stock();
 
}







	function ir_platos_utilizados()
	{       
		 c=0;

		   $('input[name="plato[]"]').map(function () {
                 c=1;
			}).get();

		   if(c==0){
              
                alert("por favor al menos debe ingresar un producto");
              return false;

		   }

		   $("#home-tab").removeClass("active");
		   $("#home5").removeClass("show active");
 $("#profile-tab").addClass("active");
		   $("#profile5").addClass("show active");

		   setTimeout(function(){
				
		   }, 500);
		  

	}
	function agregar_plato()
	{
		var producto_id=$("#plato_id").val();
       var descripcion_producto=$("#plato_id :selected").text();
		var cantidad=$("#cantidad").val();
        var html="";

    var canti=0;
     $('input[name="plato[]"]').map(function () {
                  var producto_id_data=$(this).val();
                  if(producto_id==producto_id_data){
                   canti=1;

                  }

			}).get();




           if(canti==1)
           	 {
           	 	swal("ERROR", "NO SE PUEDE REGISTRAR EL MISMO PLATO", "error");
           	 	 $("#cantidad_plato_"+producto_id).focus();
               return false;
           	 }









        html+='<tr id="celda_plato_'+producto_id+'">';
        html+='<td><label id="texto'+producto_id+'"></label></td>';
        html+='<td><input type="hidden" value="'+producto_id+'" id="plato'+producto_id+'" name="plato[]" /><label id="nombreproducto'+producto_id+'">'+descripcion_producto+'</label></td>';
         html+='<td><input type="number" id="cantidad_plato_'+producto_id+'" value="'+cantidad+'" name="cantidad_plato[]" class="form-control" /></td>';
         html+='<td><button onclick="eliminar_plato('+producto_id+')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></td>';
        html+='</tr>';


         $("#cuerpo_agregar_plato").prepend(html);






         actualizar_dato();
               $("#cantidad").val("");

             var select=$('#plato_id');

            var option = new Option("Seleccionar Plato","", true, true);
            select.append(option).trigger('change');

              // manually trigger the `select2:select` event
              select.trigger({
                type: 'select2:select'
              });
  

       $("#cantidad_plato_"+producto_id).focus();

      return false;
	}

	function actualizar_dato()
	{
		var c=1;
         $('input[name="plato[]"]').map(function () {
                  var producto_id=$(this).val();
                  $("#texto"+producto_id).text(c);
                  
                 c++;

			}).get();

	}


	$('#plato_id').select2({

  ajax: {
    url: base_url+'Produccion/buscar_producto',
    dataType: 'json',
    placeholder: 'Buscar Producto',
    maximumSelectionLength: 10
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
  },
  language: {
    noResults: function() {
      return "No hay resultado";        
    },
    searching: function() {
      return "Buscando..";
    }

  }


});

		$('#producto_id').select2({

  ajax: {
    url: base_url+'Compra/buscar_producto',
    dataType: 'json',
    placeholder: 'Buscar Producto',
    maximumSelectionLength: 10
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
  },
  language: {
    noResults: function() {
      return "No hay resultado";        
    },
    searching: function() {
      return "Buscando..";
    }

  }


  

});
</script>