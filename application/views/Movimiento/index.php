<div class="row">
	<div class="col-md-8">

	</div>
	<div class="col-md-4">
		<a href="<?php echo base_url();?>movimiento/new_movimiento/1"><button class="btn  btn-success" >Nuevo Ingreso</button></a>
		<a href="<?php echo base_url();?>movimiento/new_movimiento/2"><button class="btn  btn-danger" >Nuevo Egreso</button></a>

	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="datos">
				<thead>
					<tr>
						<th width="10%">#</th>
						<th width="10%">Caja</th>
						<th width="20%">Fecha </th>
						<th width="20%">Concepto</th>
						<th width="10%">Tipo Movimiento </th>
						<th width="10%">Monto </th>
						<th width="20%">Descripcion </th>
						<th width="20%">Acciones </th>





						
					</tr>
				</thead>
				<tbody id="cuerpo_tabla">
					<?php



					$c=1; foreach ($data["tabla"] as $key => $value) {
						$vari = "eliminar('movimiento',".$value["mov_id"].")";
						$date=date_create($value["mov_fecha"]." ".$value["mov_hora"]); 
						$a="'movimiento',".$value["mov_id"];
						echo "<tr>";
						echo "<td>".$c."</td>";
						echo "<td>".$value["caja_descripcion"]."</td>";
						echo "<td>".date_format($date, 'd/m/Y H:i:s')."</td>";

						echo "<td>".$value["con_descripcion"]."</td>";

						echo "<td>".$value["tipo_movimiento_descripcion"]."</td>";
						echo "<td>".$value["mov_monto"]."</td>";
						echo "<td>".$value["mov_descripcion"]."</td>";
						if($value["venta_idventas"] == null && $value["compra_id"] == null ){
							echo '<td> 
			        			<a style="cursor:pointer" onclick="'.$vari.'"  class="text-inverse" title="Eliminar" data-toggle="tooltip">
			        			<i style="color:red;" class="fa fa-trash txt-danger"></i>
			        			</a>  
		        			  </td>';
						}else{
							echo '<td></td>';
						}
						




						
						echo "</tr>";
						$c++;
					}?>
				</tbody>
			</table>
		</div>

	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#datos').DataTable( {
			dom: 'Bfrtip',
			buttons: [
			'copy', 'csv', 'excel', 'pdf', 'print'
			],
			"language": {
				"sProcessing":    "Procesando...",
				"sLengthMenu":    "Mostrar _MENU_ registros",
				"sZeroRecords":   "No se encontraron resultados",
				"sEmptyTable":    "Ningún dato disponible en esta tabla",
				"sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
				"sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
				"sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
				"sInfoPostFix":   "",
				"sSearch":        "Buscar:",
				"sUrl":           "",
				"sInfoThousands":  ",",
				"sLoadingRecords": "Cargando...",
				"oPaginate": {
					"sFirst":    "Primero",
					"sLast":    "Último",
					"sNext":    "Siguiente",
					"sPrevious": "Anterior"
				},
				"oAria": {
					"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
				}
			}
		} );
	} );


function eliminarventa(nombre_tabla,id){ 
      let confir=confirm("¿Estas seguro que desea eliminar?");
      	if(confir) {
	      	$.post(base_url+nombre_tabla+"/eliminarmovimiento/"+id,{},function(data){
	      		if (data["estado"] == 1) { 
	      			swal(data["texto"], "exitoso ", "success"); 
	      		}else{ 
	      			swal(data["texto"], "ERROR ", "error");  
	      		}
	      	},'json');
      	}
  	}	
	$(function () { 
	validarcaja(); 
	


	}); 
</script>