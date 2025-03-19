<div class="row">

	<div class="col-md-12">
	<a href="<?php echo base_url();?>proveedor/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="myTable">
			 <thead>
				<tr>
			    	<th width="10%">#</th>
				    <th width="20%">RUC</th>
				    <th width="30%">RAZON SOCIAL</th>
					<th width="20%">TELEFONO</th>
					<th width="20%">DIRECCION</th>
					<th width="20%">CORREO</th>
                
					<th width="10%">Acciones</th>
				</tr>
			 </thead>
			 <tbody id="cuerpo_tabla">
			 <?php  $c=1; foreach ($data["tabla"] as $key => $value) {
			 		$a="'proveedor',".$value["proveedor_id"];
                    echo "<tr>";
                    echo "<td>".$c."</td>";
                     echo "<td>".$value["proveedor_ruc"]."</td>";
                     echo "<td>".$value["proveedor_razonsocial"]."</td>";
                        echo "<td>".$value["proveedor_telefono"]."</td>";
                     echo "<td>".$value["proveedor_direccion"]."</td>";

                  
                      echo "<td>".$value["proveedor_email"]."</td>";
                     
                                         
                      echo '<td>';
                       echo '<a href="'.base_url().'proveedor/editar/'.$value["proveedor_id"].'" class="text-inverse"  data-toggle="tooltip"><button title="Editar" class="btn btn-success btn-xs"><i class="mdi mdi-pencil zmdi-hc-2x txt-primary"></i></button></a> ';
                       echo '<a  onclick="eliminar('.$a.')" class="text-inverse"  data-toggle="tooltip"><button title="Eliminar" class="btn btn-danger btn-xs"><i class="mdi mdi-delete zmdi-hc-2x txt-danger"></i></button></a> ';
                       echo '</td>';
                     
                      
                       echo "</tr>";
                $c++;
			 	}?>
			 </tbody>
			</table>
	</div>

</div>
</div>


