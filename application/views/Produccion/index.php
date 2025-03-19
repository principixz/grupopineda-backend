<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>Produccion/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="20%">FECHA</th>
				    <th width="30%">USUARIO</th>
					<th width="20%">OBSERVACION</th>
					
				
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'Produccion',".$value["produccion_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["produccion_fecha"]."</td>";
                     echo "<td>".$value["empleado_nombre_completo"]."</td>";
                        echo "<td>".$value["produccion_observacion"]."</td>";
                  

                  
                      
                     
                                         
                      echo '<td>';
                       echo '<a href="#" class="text-inverse" onclick="mostrar_detalle('.$value["produccion_id"].')"  data-toggle="tooltip"><button title="Mostrar Detalle" class="btn btn-success btn-xs"><i class="mdi mdi-eye zmdi-hc-2x txt-primary"></i></button></a> ';
                      // echo '<a  onclick="eliminar('.$a.')" class="text-inverse"  data-toggle="tooltip"><button title="Eliminar" class="btn btn-danger btn-xs"><i class="mdi mdi-delete zmdi-hc-2x txt-danger"></i></button></a> ';
                       echo '</td>';
                     
                      
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>




<div id="mostrar_datos" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-modal="true" >
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">Detalle de Produccion</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                            	<div class="col-md-12">
                                            		<center style="display: none"  id="cargando"> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>
                                            	</div>
                                                <div id="mostrar_datos_detalla" class="col-md-12">
                                             
                                                  	<ul class="nav nav-tabs" id="myTab" role="tablist">
												                                    <li id="tab_unidad_medida"   class="nav-item"> 
												                                       <a class="nav-link show active" id="home-tab" data-toggle="tab" href="#home5" role="tab" aria-controls="home5" aria-expanded="true" aria-selected="true">
												                                          <span class="hidden-sm-up">
												                                             <i class="ti-home"></i>
												                                          </span> 
												                                          <span class="hidden-xs-down">PLATOS </span>
												                                       </a> 
												                                    </li>
												                                    <li  id="tab_equivalencia"  class="nav-item disabledTab">
												                                        <a  class="nav-link show" id="profile-tab" data-toggle="tab" href="#profile5" role="tab" aria-controls="profile" aria-selected="false"><span class="hidden-sm-up"><i class="ti-user"></i></span> <span class="hidden-xs-down">PRODUCTOS </span>
												                                        </a>
												                                     </li>
												                             
												               </ul>

								<div class="tab-content tabcontent-border p-20" id="myTabContent">
                                    <div role="tabpanel" class="tab-pane fade active show" id="home5" aria-labelledby="home-tab">
                                    	<div class="col-md-12">

                                    		<div class="row">
                                    				<div class="table-responsive">
				                                    <table class="table color-bordered-table success-bordered-table">
				                                        <thead>
				                                            <tr>
				                                                <th width="5%">#</th>
				                                                <th width="30%">Nombre Producto</th>
				                                               

				                                                <th width="30%">Cantidad</th>
				                                            
				                                            </tr>
				                                        </thead>
				                                        <tbody id="cuerpo_agregar_plato">
				                                            
				                                        </tbody>
				                                    </table>
				                                </div>
                                    			</div>
                                    		
                                    	</div>
                                    </div>
                                    <div class="tab-pane fade" id="profile5" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="col-md-12">
                                    				<div class="row">
                                    				<div class="table-responsive">
				                                    <table class="table color-bordered-table primary-bordered-table">
				                                        <thead>
				                                            <tr>
				                                                <th width="10%">#</th>
				                                                <th width="30%">Nombre Producto</th>
				                                                <th width="40%">Unidad Medida</th>

				                                                <th width="20%">Cantidad</th>
				                                            
				                                            </tr>
				                                        </thead>
				                                        <tbody id="cuerpo_agregar_producto">
				                                            
				                                        </tbody>
				                                    </table>
				                                </div>
                                    			</div>
                                    	</div>
                                      </div>
                                </div>
                                                	
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-info waves-effect" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
 <script type="text/javascript">
 	
 	function mostrar_detalle(id) {
 		$("#mostrar_datos").modal();
 		$("#cargando").show();
 		$("#mostrar_datos_detalla").hide();
 		$.post(base_url+"Produccion/mostrar_produccion",{"id":id},function(data){
               
               var html_plato="";
               var html_producto="";
               for (var i = 0; i < data["plato"].length; i++) {
                   html_plato+="<tr>";
                   html_plato+="<td>"+(i+1)+"</td>";
                   html_plato+="<td>"+data["plato"][i]["producto_descripcion"]+"</td>";
                   html_plato+="<td>"+data["plato"][i]["produccion_plato_cantidad"]+"</td>";


                   html_plato+="</tr>";
               }

               $("#cuerpo_agregar_plato").empty().append(html_plato);

 for (var i = 0; i < data["producto"].length; i++) {
                   html_producto+="<tr>";
                   html_producto+="<td>"+(i+1)+"</td>";
                   html_producto+="<td>"+data["producto"][i]["producto_descripcion"]+"</td>";
                   html_producto+="<td>"+data["producto"][i]["produccion_producto_cantidad"]+"</td>";

                   html_producto+="<td>"+data["producto"][i]["unidad_medida_descripcion"]+"</td>";


                   html_producto+="</tr>";
               }

               $("#cuerpo_agregar_producto").empty().append(html_producto);

$("#cargando").hide();
	$("#mostrar_datos_detalla").show();


 		},"json");
 		// body...
 	}
 </script>

