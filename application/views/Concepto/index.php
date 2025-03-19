<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>concepto/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			  <th width="10%">#</th>

				    <th width="20%">descripcion </th>
				 
				     <th width="5%">Tipo de movimiento </th>
				    
                         
			          
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["lista_concepto"] as $key => $value) {
			 		$a="'concepto',".$value["con_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["con_descripcion"]."</td>";
                     echo "<td>".$value["tipo_movimiento_descripcion"]."</td>";
                    echo "<td>";
                    if($value["con_cuenta_contable"] == null){
                        echo '<a  onclick="eliminar('.$a.')" class="text-inverse" title="Eliminar" data-toggle="tooltip"><i class="fa fa-trash"></i></a> <a href="'.base_url().'concepto/editar/'.$value["con_id"].'" class="text-inverse" title="Editar" data-toggle="tooltip"><i class="fas fa-edit"></i></a>';
                    }
                    echo "</td>";
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>
