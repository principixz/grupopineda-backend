<style type="text/css">
   
   .disabledTab{
          pointer-events: none;
   }
</style>


<form  id="formulario_data" enctype="multipart/form-data" onsubmit="return guardar_producto()">
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
				<input class="form-control" min="0" step="0.01" required="true" required="true" min="0" value="1.0" type="number" id="moneda" name="moneda">
			</div>

		</div>
		
	</div>
</div>
<div class="col-md-12">
	<div class="row">
     
		<div class="col-md-4">
			<div class="form-group">
			<label>Clase 
				 <button type="button" onclick="abrir_nueva_clase()" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                          					 <i class="ti-plus text" aria-hidden="true"></i>
                                              			</button></label>
			<select class="form-control" id="clase" name="clase">
				
			</select>
			</div>
		</div>
		<div class="col-md-4">
			 <div class="form-group">
			    <label>Marca <button type="button" onclick="abrir_nueva_marca()" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                          					 <i class="ti-plus text" aria-hidden="true"></i>
                                              			</button></label>
			    <select class="form-control" id="marca" name="marca">
				
			   </select>
			 </div>
		</div>
		<div class="col-md-4">
			 <div class="form-group">
			    <label>Modelo</label>
			   <input type="text" autocomplete="off" class="form-control" id="modelo" name="modelo">
			 </div>
		</div>
		
	</div>
</div>
<div class="col-md-12">
	<div class="row">
     
		<div style="display: none;" class="col-md-4">
			<div class="form-group">
			<label>Proveedor</label>
			 <select class="form-control" id="proveedor" name="proveedor" >
				<option value="">Seleccionar </option>
			   </select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>Descripcion</label>
				<textarea class="form-control" required="true" id="descripcion" name="descripcion"></textarea>
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
            <label>Ubicación</label>
            <input type="text" autocomplete="off" class="form-control" required="true" name="ubicacion" id="ubicacion">
         </div>
      </div>

	</div>
</div>
<div class="col-md-12">
   <div class="row">

      
      <div class="col-md-4">
         <div class="form-group">
            <label>Tipo Producto</label>
            <select class="form-control" onchange="mostrar_categoria()" id="tipo_producto" name="tipo_producto">
            
            </select>
         </div>
      </div>
    <div class="col-md-4">
      <div id="cuerpo_categoria" class="form-group">
      <label>Categoria 
      <!--   <button type="button" onclick="abrir_nueva_categoria()" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                                     <i class="ti-plus text" aria-hidden="true"></i>
                                                    </button>-->
      </label>
      <select class="form-control"  id="categoria" name="categoria">
        
      </select>
      </div>
    </div>
      
      <div class="col-md-4">
        <center><br><br><button type="submit" id="boton_guardar_producto" class="btn btn-primary">Guardar</button> <a href="<?php echo base_url() ?>R_producto"><button id="boton_cancelar" type="button" class="btn btn-danger">Cancelar</button></a> </center> 
      </div>
       
   </div>
</div>

</div>

</div>

<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-tabs" onclick="verificar_producto()" id="myTab" role="tablist">
                                    <li id="tab_unidad_medida"   class="nav-item"> 
                                       <a class="nav-link show active" id="home-tab" data-toggle="tab" href="#home5" role="tab" aria-controls="home5" aria-expanded="true" aria-selected="true">
                                          <span class="hidden-sm-up">
                                             <i class="ti-home"></i>
                                          </span> 
                                          <span class="hidden-xs-down">UNIDAD PRINCIPAL</span>
                                       </a> 
                                    </li>
                                    <li  id="tab_equivalencia"  class="nav-item disabledTab">
                                        <a  class="nav-link show" id="profile-tab" data-toggle="tab" href="#profile5" role="tab" aria-controls="profile" aria-selected="false"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">EQUIVALENCIA</span>
                                        </a>
                                     </li>
                             
               </ul>
               <div class="tab-content tabcontent-border p-20" id="myTabContent">
                                    <div role="tabpanel" class="tab-pane fade active show" id="home5" aria-labelledby="home-tab">
                                       <div class="col-md-12">
                                       	<div class="row">
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       				<label>Unidad
                                       					<button onclick="abrir_nueva_unidad()" type="button" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                          					 <i class="ti-plus text" aria-hidden="true"></i>
                                              			</button>
                                    				</label>
                                       				<select class="form-control" id="unidad" name="unidad">
                                       					
                                       				</select>
                                       			</div>
                                       		</div>
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       				<label>Peso(KG)</label>
                                       				<input type="number" id="peso" name="peso" class="form-control">
                                       			</div>
                                       		</div>
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       			<label>Ultimo Costo</label>
                                       				<input readonly="true" value="0.00" type="number" id="ultimo_costo" name="ultimo_costo" class="form-control">
                                       			</div>
                                       		</div>
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       			<label>Costo Mayor</label>
                                       				<input readonly="true" value="0.00" type="number" id="costo_mayor" name="costo_mayor" class="form-control">
                                       			</div>
                                       		</div>
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       			<label>Precio Fijo</label>
                                       			<label class="custom-control custom-radio">
                                                	<input id="precio_fijo1" onchange="buscar_precio_fijo()" min="0" step="0.01" name="precio_fijo" value="1" type="radio" checked="true" class="custom-control-input">
                                              	  <span class="custom-control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Si</span>
                                          		 </label>
                                          		 <label class="custom-control custom-radio">
                                                	<input id="precio_fijo0" onchange="buscar_precio_fijo()" min="0" step="0.01" name="precio_fijo" value="0" type="radio" class="custom-control-input">
                                              	  <span class="custom-control-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No</span>
                                          		 </label>

                                               </div>
                                       		</div>
                                       		<div class="col-md-2">
                                       			<div class="form-group">
                                       				<label>Aplicar % a</label>
                                       				<select class="form-control" id="tipo_aplicar" name="tipo_aplicar">
                                       					<option value="1">Ultimo Costo</option>
                                       					<option value="2">Costo Mayor</option>

                                       				</select>
                                       			</div>
                                       		</div>
                                       	</div>
                                       </div>
                                       <div class="col-md-12">
                                       	<div class="row">
                                       		<div class="col-md-4">
                                       			<div class="row">
                                       				<label>Cantidades</label>
                                       			</div>

                                            <?php 
                                                 
                                            foreach ($data["almacen"] as $key => $value) {?>
                                              
                                          
                                       			<div class="row">
                                       				<div class="col-md-12">
                                       				<h5 style="font-weight: bold;"><?php echo $value["almacen_descripcion"]; ?></h5>
                                       				</div>
                                       				<div class="col-md-6">
                                       					<div class="form-group">
                                       						
                                       						<input type="number" readonly="true" class="form-control" value="0.00"  name="cantidad_almacen[]" id="cantidad_almacen<?php echo $value["almacen_id"]; ?>">
                                       					</div>
                                       				</div>
                                       				<div class="col-md-2">
                                       						<label>Costo Prom.</label>
                                       				</div>
                                       				<div class="col-md-4">
                                       					<div class="form-group">
                                       					
                                       						<input type="number" readonly="true" value="0.00" class="form-control" name="promedio_costo[]" id='promedio_costo<?php echo $value["almacen_id"]; ?>'>
                                       					</div>
                                       				</div>
                                       				<div class="col-md-5">
                                       					<label>No contabilizado</label>
                                       				</div>
                                       				<div class="col-md-7">
                                       					<input type="number" readonly="true" value="0.00" class="form-control" name="no_contabilidad[]" id="no_contabilidad<?php echo $value["almacen_id"]; ?>">
                                       				</div>
                                       			</div>
                                       		
                                                 <?php } ?>



                                       		</div>
                                       		<div class="col-md-8">
                                       			<div class="row">
                                       				<button class="btn btn-success" type="button" onclick="ver_precio_nuevo()">Añadir Precio</button>&nbsp;
                                       				
                                       			</div>
                                       			<div class="row">
                                       				<div style="height: 350px;width: 100%;" class="table-responsive">
                                       					<br>
				                                    <table class="table">
				                                        <thead >
				                                            <tr class="table-primary">
				                                                <th width="25%">Unidad</th>
				                                                <th width="20%">Precio</th>
				                                                <th width="10%">Valor</th>
				                                                <th width="10%">%Util.</th>
				                                                <th width="10%">%Desc.</th>
                                                        <th width="15%">Opc.</th>

				                                            </tr>
				                                        </thead>
				                                        <tbody id="tabla_precio_unidad">
				                                           
				                                        </tbody>
				                                    </table>
                                				  </div>
                                       			</div>
                                       		</div>
                                       	</div>
                                       	
                                       </div>
                                    </div>
                                    <div class="tab-pane fade" id="profile5" role="tabpanel" aria-labelledby="profile-tab">
                                       <div class="col-md-12">
                                         
                                       	<div class="row">
                                       		<div class="col-md-3">
                                       			<div class="form-group">
                                       				<label>Unidad <button onclick="abrir_nueva_unidad()" type="button" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                          					 <i class="ti-plus text" aria-hidden="true"></i>
                                              			</button></label>
                                       				<select class="form-control" id="unidad_equivalencia" name="unidad_equivalencia">
                                       					
                                       				</select>
                                       			</div>
                                       		</div>
                                       		<div class="col-md-4">
                                       			<div class="form-group">
                                       				<label>Factor Unidad</label>
                                       				<input type="number" id="factor_unidad" min="1" name="factor_unidad" class="form-control">
                                       			</div>
                                       		</div>
                                       		<div class="col-md-1">
                                                <br>
                                       			<button class="btn btn-success" onclick="guardar_equivalencia()" type="button" id="boton_agregar_equivalencia" >agregar</button>
                                       		</div>
                                       	  </div>

                                       	  <div class="row">
                                       	  	<div  class="col-md-8">
                                       	  		<div style="height: 350px;width: 100%;" class="table-responsive">
                                       					<br>
				                                    <table class="table">
				                                        <thead >
				                                            <tr class="table-primary">
				                                                <th width="70%">Unidad de Medida</th>
				                                                <th width="20%">Factor</th>
				                                                <th width="10%">Opc.</th>

				                                                
				                                              
				                                            </tr>
				                                        </thead>
				                                        <tbody id="tabla_equivalencia">
				                                           
				                                        </tbody>
				                                    </table>
                                				  </div>
                                       	  	</div>
                                       	  </div>
                                   		</div>
                                    </div>
                                    
                  </div>
		</div>
	</div>
</div>

</form>


<div id="modal_clase" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
     <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar Nueva Clase</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form onsubmit="return guardar_clase()" id="formulario_clase">
              <div class="modal-body">
                 <div class="col-md-12">
                 	<div class="row">
                 		
                 		<div class="col-md-12">
                 			<div class="form-group">
                 				<label>Nombre de Clase</label>
                 				<input type="text" autocomplete="off" required="true" id="nombre_clase" class="form-control" name="nombre_clase">
                 			</div>
                 		</div>
                 		

                 	</div>
                 	
                 </div>
              
             </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="boton_guardar_clase" class="btn btn-success waves-effect">Guardar</button>
                    
               </div>
           </form>
            </div>
                                        <!-- /.modal-content -->
       </div>
                                    <!-- /.modal-dialog -->
</div>

























<div id="modal_unidad" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
     <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar Nueva Unidad</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form onsubmit="return guardar_unidad()" id="formulario_unidad">
              <div class="modal-body">
                 <div class="col-md-12">
                 	<div class="row">
                 		
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Nombre de Unidad</label>
                 				<input type="text" autocomplete="off" required="true" id="nombre_unidad" class="form-control" name="nombre_unidad">
                 			</div>
                 		</div>
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Nombre Sunat</label>
                 				<input type="text" autocomplete="off" required="true" id="sunat_unidad" class="form-control" name="sunat_unidad">
                 			</div>
                 		</div>

                 	</div>
                 	
                 </div>
              
             </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="boton_guardar_unidad" class="btn btn-success waves-effect">Guardar</button>
                    
               </div>
           </form>
            </div>
                                        <!-- /.modal-content -->
       </div>
                                    <!-- /.modal-dialog -->
</div>
<div id="modal_precio" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
     <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Precio</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form id="formulario_precio" onsubmit="return guardar_precio_equivalencia()"> 
              <input type="hidden" value="" name="precio_equivalencia_id" id="precio_equivalencia_id">
              <div class="modal-body">
                 <div class="col-md-12">
                 	<div class="row">
                 		<div class="col-md-12">
                 		<h6>Precio fijo - Ultimo Costo:<label id="precio_costo_ultimo">2.5</label></h6>
                 		</div>
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Equivalencia</label>
                 				<select class="form-control" id="equivalencia" name="equivalencia"> 
                 				</select>
                 			</div>
                 		</div>
                 		<div class="col-md-6">
                 			<div class="form-group">
                 				<label>Precio Descripcion</label>
                 				<input type="text" id="precio_descripcion" value="Descuento" class="form-control" name="precio_descripcion">
                 			</div>
                 		</div>

                 	</div>
                 	<div class="row">
                 		<div class="col-md-4">
                 			<div class="form-group">
                 				<label>Valor</label>
                 				<input type="number" value="0.00" class="form-control" id="valor_precio" name="valor_precio">
                 			</div>
                 		</div>
                 		<div class="col-md-4">
                 			<div class="form-group">
                 				<label>%Utilidad</label>
                 				<input type="number" value="0.00" class="form-control" id="utilidad_precio" name="utilidad_precio">
                 			</div>
                 		</div>
                 		<div class="col-md-4">
                 			<div class="form-group">
                 				<label>%Descuento</label>
                 				<input type="number" value="0.00" class="form-control" id="descuento_precio" name="descuento_precio">
                 			</div>
                 		</div>
                 	</div>
                 </div>
              
             </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="boton_guardar_precio" class="btn btn-success waves-effect">Guardar</button>
                    
               </div>
             </form>
            </div>
                                        <!-- /.modal-content -->
       </div>
                                    <!-- /.modal-dialog -->
</div>

<div id="modal_marca" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
     <div class="modal-dialog">
        <div class="modal-content">
           <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar Nueva Marca</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <form onsubmit="return guardar_marca()" id="formulario_marca">
              <div class="modal-body">
                 <div class="col-md-12">
                 	<div class="row">
                 		
                 		<div class="col-md-12">
                 			<div class="form-group">
                 				<label>Nombre de la Marca</label>
                 				<input type="text" autocomplete="off" required="true" id="nombre_marca" class="form-control" name="nombre_marca">
                 			</div>
                 		</div>
                 		

                 	</div>
                 	
                 </div>
              
             </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger waves-effect" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="boton_guardar_marca" class="btn btn-success waves-effect">Guardar</button>
                    
               </div>
           </form>
            </div>
                                        <!-- /.modal-content -->
       </div>
                                    <!-- /.modal-dialog -->
</div>



<div id="modal_confirmar_guardar" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-modal="true">
                                    <div class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="mySmallModalLabel">Alerta</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body"><h5>¿Para seguir a este paso es necesario subir los datos ahora?</h5></div>
                                            <div class="modal-footer">
                                               <button class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                               <button class="btn btn-success" onclick="guardar_datos()" id="boton_guardar_datos" type="button" >Aceptar</button>

                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
<script type="text/javascript" src="<?php echo base_url();?>public/modulos/r_producto.js"></script>
<script type="text/javascript">
function mostrar_categoria()
{
  let categoria=$("#tipo_producto").val();
  if(categoria=="1")
  {
   $("#cuerpo_categoria").show();
  }else{
   $("#cuerpo_categoria").hide();

  }
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

  $(function(){
  actualizar_categoria();
    actualizar_medida();
    actualizar_clase();
    actualizar_marca();
    actualizar_tipo_producto();
      mostrar_precio();
      
      mostrar_equivalencia();
      mostrar_tabla_equivalencia();
      traer_informacion();
       traer_stock();

  });


  function guardar_precio_equivalencia()
  {
    $("#boton_guardar_precio").text("Guardando...");
    $("#boton_guardar_precio").attr("disabled",true);

    $.post(base_url+"R_producto/guardar_precio_detalle",$("#formulario_precio").serialize(),function(data)
    {
      $("#boton_guardar_precio").text("Guardar");
       $("#boton_guardar_precio").attr("disabled",false);
       mostrar_precio();
       $("#modal_precio").modal("hide");
       $("#precio_descripcion").val("Descuento");
       $("#valor_precio").val(0.00);
       $("#utilidad_precio").val(0.00);
       $("#descuento_precio").val(0.00);
       
  

    });

   return false;


  }
  function buscar_precio_fijo()
  {
    var precio_fijo=$("input[name='precio_fijo']:checked").val();
   
    if(precio_fijo=="1"){
       $("#tipo_aplicar").attr("disabled",true);

    }else{
       $("#tipo_aplicar").attr("disabled",false);
      

    }
  }
  function eliminar_precio_equivalencia(id)
  {
    
          var r = confirm("¿Estas seguro que desea eliminar ?");
          if (r == true) {
            $.post(base_url+"R_producto/eliminar_detalle_precio",{"id":id},function(data){
             mostrar_precio();
            });
          } 
  }
  function eliminar_equivalencia(id)
  {
    var r = confirm("¿Estas seguro que desea eliminar ?");
          if (r == true) {
            $.post(base_url+"R_producto/eliminar_detalle_unidad",{"id":id},function(data){
                 mostrar_tabla_equivalencia();
                 mostrar_equivalencia();

            });
          } 
  }
function guardar_equivalencia()
{
  if($("#unidad_equivalencia").val()==""){
  return false;
  }
  if($("#factor_unidad").val()==""){
   alert("Agregar factor de unidad");
   return false;
   
  }
  $("#boton_agregar_equivalencia").text("Guardando...");
  $("#boton_agregar_equivalencia").attr("disabled",true);

  $.post(base_url+"R_producto/guardar_equivalencia",{"producto_id":$("#producto_id").val(),"unidad_medida":$("#unidad_equivalencia").val(),"factor_unidad":$("#factor_unidad").val()},function(data){
       if(parseFloat(data)==1){
         $("#boton_agregar_equivalencia").text("Agregar");
         $("#boton_agregar_equivalencia").attr("disabled",false);
         alertasuccess("Exitoso","Se guardo correctamente");
         $("#unidad_equivalencia").val(1);
         $("#factor_unidad").val("");
         mostrar_tabla_equivalencia();

         }else{
            alertainfo("ERROR","se genero un una error en unidad");
             $("#boton_agregar_equivalencia").text("Agregar");
         $("#boton_agregar_equivalencia").attr("disabled",false);

         }

  });
}
    function mostrar_tabla_equivalencia()
   {
    var producto_id=$("#producto_id").val();
      if(producto_id!=""){
         $.post(base_url+"R_producto/mostrar_equivalencia",{"producto_id":producto_id},function(data){   
            var html="";
            for (var i = 0; i < data.length; i++) {
               if(parseFloat(data[i]["detalle_unidad_producto_fijo"])==0){
                  html+="<tr>";
                  html+="<td>"+data[i]["unidad_medida_descripcion"]+"</td>";
                  html+="<td>"+data[i]["detalle_unidad_producto_factor"]+"</td>";
                  html+='<td><button onclick="eliminar_equivalencia('+data[i]["detalle_unidad_producto_id"]+')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></td>';


                  html+="</tr>";

               }
            }
           
           $("#tabla_equivalencia").empty().append(html);
           mostrar_equivalencia();

         },"json");
      }

   }
   function mostrar_equivalencia()
   {
    var producto_id=$("#producto_id").val();
      if(producto_id!=""){
         $.post(base_url+"R_producto/mostrar_equivalencia",{"producto_id":producto_id},function(data){   
            var html="";
            for (var i = 0; i < data.length; i++) {
              
                html+="<option value='"+data[i]["detalle_unidad_producto_id"]+"'>"+data[i]["unidad_medida_descripcion"]+"X"+data[i]["detalle_unidad_producto_factor"]+"</option>";
            }
         
           $("#equivalencia").empty().append(html);

         },"json");
      }

   }
function traer_informacion()
{
   var producto_id=$("#producto_id").val();
   if(producto_id!=""){
   $.post(base_url+"R_producto/traer_informacion",{"producto_id":producto_id},function(data){
          $("#codigo_barra").val(data[0]["producto_codigobarra"]);
          $("#codigo_referencia").val(data[0]["producto_codigobarra"]);
          $("#tipo_moneda").val(data[0]["moneda_id"]);
          $("#moneda").val(data[0]["producto_precio"]);
          $("#clase").val(data[0]["clase_id"]);
          $("#marca").val(data[0]["marca_id"]);
          $("#modelo").val(data[0]["producto_modelo"]);
          $("#proveedor").val(data[0]["proveedor_id"]);

          $("#descripcion").val(data[0]["producto_descripcion"]);
          $("#stock_minimo").val(data[0]["producto_minimo"]);
          $("#ubicacion").val(data[0]["producto_ubicacion"]);
          $("#tipo_producto").val(data[0]["producto_id_tipoproducto"]);
           $("#tab_equivalencia").removeClass("disabledTab");
           $("#unidad").val(data[0]["unidad_medida_id"]);
           $("#peso").val(data[0]["producto_kilogramo"]);
           $("#categoria").val(data[0]["categoria_producto_id"]);

           

           $("#precio_fijo"+data[0]["producto_estado_precio_fijo"]).prop("checked",true);



           $("#tipo_aplicar").val(data[0]["producto_tipo_precio"]);


         $("#peso").attr("readonly",true);
         $("#boton_cancelar").text("Retornar");
          mostrar_categoria();
          buscar_precio_fijo();
         $("#unidad option").attr("disabled",true);
$("#unidad option[value="+data[0]["unidad_medida_id"]+"]").attr("disabled",false);

          //alert(data[0]["producto_imagen"]);
         if(data[0]["producto_imagen"]!="")
         {
             $("#preview").attr("src",base_url+"public/img/productos/"+data[0]["producto_imagen"]);
         }

            

   },"json");
   }

}


function verificar_producto()
{
   var producto_id=$("#producto_id").val();
   if(producto_id=="")
   {
      $("#modal_confirmar_guardar").modal();
      return false;
   }
   else{
      $("#tab_equivalencia").removeClass("disabledTab");
      return true;
      
   }
}
function ver_precio_nuevo() {
      
      var verificar=verificar_producto();
     
      if(verificar==true){
          $("#modal_precio").modal();
          var precio_fijo=$("input[name='precio_fijo']:checked").val();
   
          if(precio_fijo=="1"){
            $("#utilidad_precio").attr("readonly",true);
             $("#valor_precio").attr("readonly",false);


          }else{
             
 $("#utilidad_precio").attr("readonly",false);
             $("#valor_precio").attr("readonly",true);
            

          }

      }
      

   }
function guardar_producto()
{
console.log($("#formulario_data"));
$("#boton_guardar_producto").text("Guardando");
$("#boton_guardar_producto").attr("disabled",true);

  var formData = new FormData($("#formulario_data")[0]);
   $.ajax({
            type: 'POST',
            url: base_url+'R_producto/guardar_producto',
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
                $("#boton_guardar_producto").text("Guardar");
                $("#boton_guardar_producto").attr("disabled",false);
          
              $("#producto_id").val(data["producto_id"]);
              mostrar_precio();
              alertasuccess("Exitoso","Se guardo correctamente el producto");
             $('#imagen').val(null); 
              $("#peso").attr("readonly",true);
         $("#boton_cancelar").text("Retornar");

          var idunidad=$("#unidad").val();
         $("#unidad option").attr("disabled",true);
        $("#unidad option[value="+idunidad+"]").attr("disabled",false);

 $("#boton_guardar_datos").text("Aceptar");
  $("#boton_guardar_datos").attr("disabled",false);
  $("#modal_confirmar_guardar").modal("hide");


              setTimeout(function(){ 
                // location.href=base_url+"R_producto";

               }, 1500);
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


	function guardar_marca()
	{
		$("#boton_guardar_marca").text("Guardando...");
		$("#boton_guardar_marca").attr("disabled",true);
		$.post(base_url+"R_producto/guardar_marca",$("#formulario_marca").serialize(),function(data){
				$("#boton_guardar_marca").text("Guardar");
				$("#boton_guardar_marca").attr("disabled",false);
				actualizar_marca();
				$("#modal_marca").modal("hide");
				
				document.getElementById("formulario_marca").reset();

		});

		return false;

	}




    function abrir_nueva_marca()
    {
		$("#modal_marca").modal();

    }
function guardar_clase()
	{
		$("#boton_guardar_clase").text("Guardando...");
		$("#boton_guardar_clase").attr("disabled",true);
		$.post(base_url+"R_producto/guardar_clase",$("#formulario_clase").serialize(),function(data){
				$("#boton_guardar_clase").text("Guardar");
				$("#boton_guardar_clase").attr("disabled",false);
				actualizar_clase();
				$("#modal_clase").modal("hide");
				
				document.getElementById("formulario_clase").reset();

		});

		return false;

	}




    function abrir_nueva_clase()
    {
		$("#modal_clase").modal();

    }
	function guardar_unidad()
	{
		$("#boton_guardar_unidad").text("Guardando...");
		$("#boton_guardar_unidad").attr("disabled",true);
		$.post(base_url+"R_producto/guardar_unidad",$("#formulario_unidad").serialize(),function(data){
				$("#boton_guardar_unidad").text("Guardar");
				$("#boton_guardar_unidad").attr("disabled",false);
				actualizar_medida();
				$("#modal_unidad").modal("hide");
				
				document.getElementById("formulario_unidad").reset();

		});

		return false;

	}
		function abrir_nueva_unidad()
	{
		$("#modal_unidad").modal();
	}


	function actualizar_medida()
	{
		$.post(base_url+"R_producto/actualizar_medida",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["id_unidad_medida"]+"'>"+data[i]["unidad_medida_descripcion"]+"</option>";
            }
           
           $("#unidad").empty().append(html);
           $("#unidad_equivalencia").empty().append(html);

		},"json");
	}
	function actualizar_clase()
	{
		$.post(base_url+"R_producto/actualizar_clase",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["clase_id"]+"'>"+data[i]["clase_descripcion"]+"</option>";
            }
           
          
           $("#clase").empty().append(html);

		},"json");

	}
	function actualizar_marca()
	{
		$.post(base_url+"R_producto/actualizar_marca",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["marca_id"]+"'>"+data[i]["marca_descripcion"]+"</option>";
            }
           
          
           $("#marca").empty().append(html);

		},"json");

	}
	function actualizar_tipo_producto()
	{
		$.post(base_url+"R_producto/actualizar_tipo_producto",function(data){
			var html="";
            for (var i = 0; i < data.length; i++) {
              html+="<option value='"+data[i]["tipoproducto_id"]+"'>"+data[i]["tipoproducto_descripcion"]+"</option>";
            }
           
          
           $("#tipo_producto").empty().append(html);

		},"json");

	}
</script>