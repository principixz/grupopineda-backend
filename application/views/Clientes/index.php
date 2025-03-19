<div class="row">

	<div class="col-md-12">

		<a href="<?php echo base_url();?>Clientes/nuevo"><button class="btn  btn-success" >Nuevo</button></a>

	</div>

</div>

<div class="row">

	<div class="col-md-12">

		<div class="table-responsive">

			<table class="table display product-overview mb-30" id="myTable">

			 <thead>

				<tr>

			    	<th width="10%">#</th>

				    <th width="20%">D.N.I</th>

				    <th width="30%">NOMBRES</th>

					<th width="20%">TELEFONO</th>

					<th width="20%">DIRECCION</th>

					<th width="20%">CORREO</th>                

					<th width="10%">Acciones</th>

				</tr>

			 </thead>

			 <tbody id="cuerpo_tabla">

			 	<?php  $c=1; foreach ($data["tabla"] as $key => $value) {

			 		$a="'Clientes',".$value["cliente_id"];

                    echo "<tr>";

                    echo "<td>".$c."</td>";

                    echo "<td>".$value["cliente_dni"]."</td>";

                    echo "<td>".$value["cliente_nombres"]."</td>";

                    echo "<td>".$value["cliente_telefono"]."</td>";

                    echo "<td>".$value["cliente_direccion"]."</td>";                  

                    echo "<td>".$value["cliente_email"]."</td>"; 

                    echo '<td>';

                    echo '<a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="fa fa-trash"></i></a> ';

                    echo '<a href="'.base_url().'Clientes/editar/'.$value["cliente_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="fa fa-pencil-square-o"></i></a></td>';

                    echo "</tr>";

                	$c++;

			 	}?>

			 </tbody>

			</table>

	</div>



</div>

</div>

