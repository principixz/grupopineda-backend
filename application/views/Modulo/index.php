<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>modulo/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="40%">Modulo</th>
				    <th width="20%">Url</th>
					<th width="20%">Icono</th>
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'modulo',".$value["modulo_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["modulo_nombre"]."</td>";
                     echo "<td>".$value["modulo_url"]."</td>";

                     echo "<td>".$value["modulo_icono"]."</td>";

                      echo '<td><a href="'.base_url().'modulo/editar/'.$value["modulo_id"].'"  title="Editar" ><button  class="btn btn-success btn-xs"> <i class="mdi mdi-pencil"></i></button></a> <a  onclick="eliminar('.$a.')" title="Eliminar" ><button class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button></a> </td>';
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>
