<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>Marca_producto/nuevo"><button id="nuevo_almacen" class="btn  btn-success" >Nuevo</button></a>
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
				  
					
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'Marca_producto',".$value["marca_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["marca_descripcion"]."</td>";
                     //echo "<td>".$value["almacen_direccion"]."</td>";

                     echo '<td> <a href="'.base_url().'Marca_producto/editar/'.$value["marca_id"].'"  title="Editar" ><button class="btn btn-success btn-xs"><i class="mdi mdi-pencil"></i></button></a> <a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><button class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></a></td>';

                    //echo '<td></td>';
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>