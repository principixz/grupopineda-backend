<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>almacen/nuevo"><button id="nuevo_almacen" class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="40%">descripcion </th>
				    <th width="20%">direccion</th>
					
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'almacen',".$value["almacen_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["almacen_descripcion"]."</td>";
                     echo "<td>".$value["almacen_direccion"]."</td>";

                     echo '<td> <button class="btn btn-success btn-xs"><a href="'.base_url().'almacen/editar/'.$value["almacen_id"].'"  title="Editar" ><i class="mdi mdi-pencil"></i></a></button></td>';

                   /*   echo '<td><a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="zmdi zmdi-delete zmdi-hc-2x txt-danger"></i></a> <a href="'.base_url().'almacen/editar/'.$value["almacen_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="zmdi zmdi-brush zmdi-hc-2x txt-primary"></i></a></td>';*/
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>


 <div class="modal fade in" id="validar_caja" data-keyboard="false" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4 class="modal-title">Atención Usuario !</h4>
                <h5>
                    <p id="mensaje"></p> <b id="fechacerrar"></b>
                </h5>
                                <div id="botonestado">
                  
                </div>
                            </div>
                        
        </div>
    </div>
</div> 

<script type="text/javascript">
	$(function(){
	$.post(base_url+"Almacen/verificar_almacen",function(data){
            if(parseInt(data["estado"])==1)
            {
            	$("#nuevo_almacen").hide();
                  swal({   
						title: "ALERTA",   
            text: "Solo se puede agregar un solo almacen",
			confirmButtonColor: "#2196F3"  
			        });
						return false;


            }
		},"json");
	});
</script>