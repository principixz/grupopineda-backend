<div class="">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>R_producto/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="">
	<div class="col-md-12">
		<div class="">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="40%">Descricpion</th>
					<th width="10%">Precio</th>
					<th width="10%">Marca</th>
					<th width="10%">Clase</th>
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 	<?php
                  foreach ($data["tabla"] as $key => $value) {
                   echo "<tr>";
                   echo "<td>".($key+1)."</td>";
                   echo "<td>".$value["producto_descripcion"]."</td>";
                   echo "<td>".$value["producto_precio"]."</td>";
                   echo "<td>".$value["marca_descripcion"]."</td>";
                   echo "<td>".$value["clase_descripcion"]."</td>";
                   echo '<td><button onclick="editar_producto('.$value["producto_id"].')" type="button" class="btn btn-primary btn-xs"><i class="mdi mdi-pencil"></i></button> <button onclick="eliminar_producto('.$value["producto_id"].')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></td>';


                   echo "</tr>";


                  }


			 	?>
			 </tbody>
			</table>
	</div>

</div>
</div>

<script type="text/javascript">
	function editar_producto(id) {
		location.href=base_url+"R_producto/editar/"+id;
	}
	function eliminar_producto(id)
	{
        res=confirm("¿Estas seguro que desea elimanar este producto?");
        if(res)
        {
           $.post(base_url+"Registrar_plato/eliminar",{"id":id},function(data){
                if(parseFloat(data)==1)
                {
                	location.reload(true);
                }
           })
        }

	}
</script>