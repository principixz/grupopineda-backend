<div class="row">

<!--<div class="col-md-12">
		<a href="<?php echo base_url();?>Ventas/nuevo"><button class="btn  btn-success" >Nuevo</button></a>
 	</div>-->
</div>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table display product-overview mb-30" id="my_Table">
				<thead>
					<tr>


						<th width="20%">Mozo </th> 
						<th width="10%">Tipo Caja</th>
						<th width="10%">Monto </th> 
						<th width="10%">Fecha</th>
						<th width="10%">Acciones</th>
					</tr>
				</thead>
				<tbody >

				</tbody>
			</table>
		</div>

	</div>
</div>






<script type="text/javascript">
	$(function () {
		llamarfuncion();
	});

	function llamarfuncion(){
		$("#my_Table").DataTable().destroy();
		$("#my_Table").DataTable(

		{

			"language": {
				"sProcessing":     "Procesando...",
				"sLengthMenu":     "Mostrar _MENU_ registros",
				"sZeroRecords":    "No se encontraron resultados",
				"sEmptyTable":     "Ningún dato disponible en esta tabla",
				"sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
				"sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
				"sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
				"sInfoPostFix":    "",
				"sSearch":         "Buscar:",
				"sUrl":            "",
				"sInfoThousands":  ",",
				"sLoadingRecords": "Cargando...",
				"oPaginate": {
					"sFirst":    "Primero",
					"sLast":     "Último",
					"sNext":     "Siguiente",
					"sPrevious": "Anterior"
				},
				"oAria": {
					"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
				}
			},
			"processing": true,
			"serverSide": true,
			"ajax":{
				"url": "<?php echo base_url() ?>HSesion_caja/buscar_tabla",
				"dataType": "json",
				"type": "POST",
				"data":{  '<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }
			},
			"columns": [ 
			{ "data": "mozo" },
			{ "data": "tipocaja" },

			{ "data": "monto" },
			{ "data": "fecha" },
			{ "data": "acciones" }, 
			],


		}




		);
	}
      function eliminarventa(nombre_tabla,id){

     swal({   
      title: "¿Estás seguro que desea eliminar?",   
      text: "no se podrá recuperar nada una vez eliminado",   
      type: "warning",   
      showCancelButton: true,   
      cancelButtonText:'Cancelar',
      confirmButtonColor: "red",   
      confirmButtonText: "Si, Deseo eliminarlo",   
      closeOnConfirm: false 
    }, function(){   
     $.post(base_url+nombre_tabla+"/eliminarventa/"+id,{},function(data){
      if (data["estado"] == 1) {
        swal(data["texto"], "exitoso ", "success");
        llamarfuncion();
        //location.reload(true);
      }else{
        swal(data["texto"], "ERROR ", "info"); 
      }
      
       
    },'json');
     
   });
     return false;
     
   }

  
</script>