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


						<th width="20%">Cliente </th>
						<th width="10%">Mozo</th>
						<!--<th width="10%">Mesa</th>-->
						<th width="10%">Correlativo </th>

						<th width="10%">Monto </th>
						<th width="10%">Fecha </th>
						<th width="10%">Acciones</th>
					</tr>
				</thead>
				<tbody >

				</tbody>
			</table>
		</div>

	</div>
</div>



<div id="modal_eliminar" class="modal fade bs-example-modal-sm in" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h5 class="modal-title" id="mySmallModalLabel">Eliminar venta</h5>
			</div>
			<form id="formulario_eliminar" onsubmit="return guardar_eliminar_venta()">
				<div class="modal-body"> 
					<div class="row">
						<input type="hidden" name="id_detalle_venta_modal" value="" id="id_detalle_venta_modal">
                    
             	<div class="col-md-12">
             		<div class="form-group">
             			<label>motivo</label>
             			<input type="text" id="motivo" name="motivo" required="true" class="form-control">
             			
             		</div>
             	</div>

             	<div class="col-md-6" id="eliminar_div_usuario">
             		<div class="form-group">
             			<label>Usuario</label>
             			<input type="text" name="eliminar_usuario" autocomplete="off" id="eliminar_usuario" class="form-control" required="true">
             		</div>
             	</div>
             	<div class="col-md-6" id="eliminar_div_contrasena">
             		<div class="form-group">
             			<label>Contraseña</label>
             			<input type="password" name="eliminar_contrasena" autocomplete="off" id="eliminar_contrasena" class="form-control" required="true">
             		</div>
             	</div>

             </div>

         </div>
         <div class="modal-footer">
         	<button type="submit" class="btn btn-success" id="guardar_eliminar" >Guardar</button>

         	<button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
         </div>
     </form>
 </div>
 <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

</div>



<script type="text/javascript">





	function enviar_correo(id)
	{
		Swal.fire({
				  title: 'Ingresar un correo',
				  input: 'email',
				  inputAttributes: {
				    autocapitalize: 'off'
				  },
				  showCancelButton: true,
				  confirmButtonText: 'Enviar',
				  showLoaderOnConfirm: true,
				  preConfirm: (login) => {
				      var payload = {
					          "id": id,
					          "correo": login
					      };
					      
					        return fetch(base_url+'Ventas/ws_enviar_factura',{
					          method: 'post',
					          headers: {
					            'Accept': 'application/json, text/plain, */*',
					            'Content-Type': 'application/json'
					          },
					          body: JSON.stringify(payload)
					        })
					          .then(response => {
					            if (!response.ok) {
					              throw new Error(response.statusText)
					            }
					            return response.json()
					          })
					          .catch(error => {
					            Swal.showValidationMessage(
					              `Request failed: ${error}`
					            )
					          })
				  },
				  allowOutsideClick: () => !Swal.isLoading()
				}).then((result) => {
			      if (result.isConfirmed) {

			        Swal.fire(
			          'Excelente',
			          'Se envio correctamente el correo',
			          'success'
			        );
			       /* Swal.fire({
			          title: `${result.value.login}'s avatar`,
			          imageUrl: result.value.avatar_url
			        })*/
			      }
			    })
	}

	function descargar_pdf(url){
		let url1=url.replace("http://", "https://");
		//alert(url1)
    window.open(url1);

  }







	
	$(function () {
		llamarfuncion();
	});



	function guardar_eliminar_venta()
	{

        $("#guardar_eliminar").text("Eliminando...");
        $("#guardar_eliminar").attr("disabled",true);

		 $.post(base_url+"ventas/eliminarventa",$("#formulario_eliminar").serialize(),function(data){
      				if (data["estado"] == 1) {
      					//swal("SE GENERO LA TRANSACCION EXITOSA", "COBRO EXITOSA ", "success"); 
				      //  swal(data["texto"], "exitoso ", "success");
   					$("#modal_eliminar").modal('hide');
				     swal(data["texto"], "exitoso ", "success");
				setTimeout(function(){  location.reload(true); }, 1000);
				       
				      }else{
				        //swal(data["texto"], "ERROR ", "info"); 
				     	$("#modal_eliminar").modal('hide');

				         $("#formulario_eliminar")[0].reset();
  						 swal(data["texto"], "ERROR ", "error");  
				      }
				      
				       
        $("#guardar_eliminar").text("Guardar");
        $("#guardar_eliminar").attr("disabled",false);

				    },'json');

		return false;
	}

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
				"url": "<?php echo base_url() ?>ventas/buscar_tabla",
				"dataType": "json",
				"type": "POST",
				"data":{  '<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }
			},
			"columns": [
			{ "data": "cliente" },
			{ "data": "mozo" },
			/*{ "data": "mesa" },*/

			{ "data": "correlativo" },
			{ "data": "monto" },
			{ "data": "fecha" },

			{ "data": "acciones" },
			],


		}




		);
	}
      function eliminarventa(nombre_tabla,id){
        $("#id_detalle_venta_modal").val(id);
      	$("#modal_eliminar").modal();
     /* let confir=confirm("¿Estas seguro que desea eliminar?");
      if(confir)
      {

      	    $.post(base_url+nombre_tabla+"/eliminarventa/"+id,{},function(data){
      				if (data["estado"] == 1) {
      					//swal("SE GENERO LA TRANSACCION EXITOSA", "COBRO EXITOSA ", "success"); 
				      //  swal(data["texto"], "exitoso ", "success");
				     swal(data["texto"], "exitoso ", "success");
				        //location.reload(true);
				      }else{
				        //swal(data["texto"], "ERROR ", "info"); 

				         
  						 swal(data["texto"], "ERROR ", "error");  
				      }
				      
				       
				    },'json');
      }*/

      

/*
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
    alert();  
  
     
   });*/
     return false;
     
   }

	$(function () { 
		//validarcaja(); 
	}); 
</script>