<div class="">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>C_producto/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="">
	<div class="col-md-12">
		<div class="">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="40%">Descripcion </th>
			
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'categoria_producto',".$value["categoria_producto_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["categoria_producto_descripcion"]."</td>";
                   

            

                      echo '<td><a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="fa fa-window-close"></i></a> <a href="'.base_url().'C_producto/editar/'.$value["categoria_producto_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="fa fa-pencil-square-o"></i></a></td>';
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>
