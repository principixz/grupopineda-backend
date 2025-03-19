<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>perfiles/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="70%">Descricpion</th>

					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 	<?php $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'perfiles',".$value["perfil_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["perfil_descripcion"]."</td>";
                      echo '<td><a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="zmdi zmdi-delete zmdi-hc-2x txt-danger"></i></a> <a href="'.base_url().'perfiles/editar/'.$value["perfil_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="zmdi zmdi-brush zmdi-hc-2x txt-primary"></i></a></td>';
                       echo "</tr>";
                $c++;
			 	}  ?>
			 </tbody>
			</table>
	</div>

</div>
</div>


