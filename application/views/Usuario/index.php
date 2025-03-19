<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>usuario/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="5%">#</th>
				    <th width="10%">DNI</th>
				    <th width="30%">Nombre</th>
					<th width="10%">telefono</th>
			
					<th width="20%">correo</th>
                    <th width="10%">Perfil</th>
					<th width="20%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'usuario',".$value["empleado_id"];
			 		$b="'".$value["empleado_nombres"]." ".$value["empleado_apellidos"]."',".$value["empleado_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["empleado_dni"]."</td>";
                     echo "<td>".$value["empleado_nombres"]." ".$value["empleado_apellidos"]."</td>";
                     //echo "<td>".$value["empleado_direccion"]."</td>";

                     echo "<td>".$value["empleado_telefono"]."</td>";
                      echo "<td>".$value["empleado_email"]."</td>";
                      echo "<td>".$value["perfil_descripcion"]."</td>";
                      
                                         
                      echo '<td>';
                      if($value["perfil_id"]!="8"){
                       echo '<a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="fa fa-trash"></i></a> ';
                       
                       echo '<a href="'.base_url().'usuario/editar/'.$value["empleado_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="fa fa-pencil-square-o"></i></a>'; 
                                 echo '</td>';



                       } 
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>


<div id="modal_contrato"  class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
											<div class="modal-dialog modal-lg">
												<div class="modal-content ">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h5 class="modal-title" id="modal_titulo_nombre"></h5>
													</div>
													<div class="modal-body">
														<input type="hidden" name="id" id="name">
														<div id="crear_contrato">
                                                          
															<div class="row">
																<div class="col-md-3">
																	<div class="form-group">
																		<label>Fecha inicial de contrato</label>
																		<input type="date" value="<?php echo date("Y-m-d") ?>" class="form-control" name="fecha_inicio" id="fecha_inicio">
																	</div>
																</div>
																<div class="col-md-3">
																	<div class="form-group">
																		<label>fecha final de contrato</label>
																		<input type="date" value="<?php echo date("Y-m-d") ?>"  class="form-control" name="fecha_fin" id="fecha_fin">
																	</div>
																</div>
																<div class="col-md-2">
																	<div class="form-group">
																		<label>Notificacion</label>
																		<input type="number" id="notificacion" min="1" max="30" value="30" class="form-control" name="notificacion">
																	</div>
																	<!--<div class="form-group">
																		<label>Motivo</label>
																		<select   id="motivo" class="form-control" name="motivo">
																			<option value="">Seleccionar</option>
																			<?php foreach($data["contrato"] as $value){ ?>
                                                                               <option value="<?php  echo $value['motivo_contrato_id'] ?>"><?php echo $value['motivo_contrato_descripcion']?></option>
																		<?php } ?>
																		</select>
																	</div>-->
																</div>
																<div class="col-md-4">
																	<br>
																	<button class="btn btn-success btn-xs" id="guardar">Guardar</button>
																	<button class="btn btn-danger btn-xs"  id="cancelar_boton">Cancelar</button>

																</div>
															</div>
														</div>
														<button id="nuevo_boton" class="btn btn-success">Nuevo</button>
														<div id="cuerpo_contrato">
															
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-info" data-dismiss="modal">cerrar</button>
													</div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->

</div>




<div id="modal_actualizar_baja" class="modal fade bs-example-modal-sm in" tabindex="1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-sm">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
														<h5 class="modal-title" id="mySmallModalLabel">DAR DE BAJA</h5>
													</div>
													<div class="modal-body">
														
                                                             <div class="row">
                                                             	<form id="formulario_baja" onsubmit="return guardar_dar_baja()">
                                                             <input type="hidden" id="id_contrato" name="id_contrato">
                                                             	<div class="col-md-12">
                                                             		<div class="form-group">
																		<label>Motivo</label>
																		<select required="true"  id="motivo" class="form-control" name="motivo">
																			<option value="">Seleccionar</option>
																			<?php foreach($data["contrato"] as $value){ ?>
                                                                               <option value="<?php  echo $value['motivo_contrato_id'] ?>"><?php echo $value['motivo_contrato_descripcion']?></option>
																		<?php } ?>
																		</select>
																	</div>
                                                             	</div>
                                                             	<div class="col-md-12">
                                                             		<div class="form-group">
                                                             			<label>Fecha de baja</label>
                                                             			<input required="true" type="date" class="form-control" value="<?php echo date("Y-m-d"); ?>" name="fecha_baja" id="fecha_baja">
                                                             		</div>
                                                             	</div>
                                                             	<div class="col-md-12">
                                                             		 <center>
                                                             		 	<button class="btn btn-danger" onclick="$('#modal_actualizar_baja').modal('hide')" type="button">Cancelar</button>
                                                             		 	<button class="btn btn-success" id="boton_dar_baja" type="submit">Guardar</button>
                                                             		 </center>
                                                             	</div>
                                                             </form>


                                                             		
                                                             	</div>
                                                             </div>
													 </div>
												</div>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->
									

<script type="text/javascript">

	function guardar_dar_baja()
	{

		$("#boton_dar_baja").text("Guardando...");
		$("#boton_dar_baja").attr("disabled",true);

                $.post(base_url+"usuario/actualizar_baja_datos",$("#formulario_baja").serialize(),function(data){
                     	if(parseInt(data)==1){
                     		$("#boton_dar_baja").text("Guardar");
						$("#boton_dar_baja").attr("disabled",false);
						$("#modal_actualizar_baja").modal("hide");
						actualizar();   

					}else{
                          alert("error");

					}

                });


		return false;
	}
	$("#guardar").click(function(){

           if($("#fecha_inicio").val()=="")
           {
           		alert("ingrese por favor la fecha de inicio");
           	return false;
           }
 if($("#fecha_fin").val()=="")
           {
           	alert("ingrese por favor la fecha de fin");
           	return false;
           }
 


          $(this).attr("disabled",true);
          $.post(base_url+"usuario/guardar_contrato",{
          	"id":$("#id").val(),
          	"inicio":$("#fecha_inicio").val(),
          	"fin":$("#fecha_fin").val(),
          	"notificacion":$("#notificacion").val(),
          	"id_contrato":""
           
          },function(data){

          	  if(parseFloat(data)==3)
          	  {
                        alert("Error por el momento existe un contrato vigente");
          	  }
               $("#guardar").attr("disabled",false);
                actualizar();
                  $("#crear_contrato").hide();
   				 $("#nuevo_boton").show();

          });
	});

	function contrato(nombre,id) {
		$("#modal_contrato").modal();
		$("#modal_titulo_nombre").text(nombre);
		$("#id").val(id);
        actualizar();
	}
	$(function(){
		$("#crear_contrato").hide();

	});
   $("#nuevo_boton").click(function(){
   	 $("#crear_contrato").show();
   	 $(this).hide();
   });
  $("#cancelar_boton").click(function(){
   	 $("#crear_contrato").hide();
   	 $("#nuevo_boton").show();
   });

  function actualizar()
  {
  	var id=$("#id").val();
  	 $("#cuerpo_contrato").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
  	$.post(base_url+"usuario/generar_tabla_contrato",{"id":id},function(data){
  		//alert(data);
         $("#cuerpo_contrato").empty().append(data);
  	});
  	$("#fecha_inicio").val("");
          $("#fecha_fin").val("");
          	$("#motivo").val("");
            //$("#id_contrato").val("");
             $("#id_contrato option[value='']").attr("selected",true);
  }

  function eliminar_contrato(id)
  {
	
		var r = confirm("¿Estas seguro que sea eliminar ?");
		if (r == true) {
		  $.post(base_url+"usuario/eliminar_contrato",{"id":id},function(data)
		  	{
               if(parseFloat(data)==1){
                 actualizar();   
               }
		  	});
		} 
  }

  function actualizar_baja(id)
  {
 
  $("#modal_actualizar_baja").modal();
  $("#fecha_baja").val("");
  $("#motivo").val("");
  $("#id_contrato").val(id);
  }
</script>