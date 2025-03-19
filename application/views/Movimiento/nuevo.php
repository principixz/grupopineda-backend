<div class="panel panel-default card-view">
	<div class="panel-heading">
		<div class="pull-left">
			<h6 class="panel-title txt-dark">INGRESAR DATOS</h6>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="panel-wrapper collapse in">
		<div class="panel-body">
			<div class="form-wrap">
				<form role="form" id="formulario" onsubmit="return guardar();">
					<input type="hidden"  name="id" id="id">
					<input type="hidden" name="tipomovi" id="tipomovi" value="<?php echo $data['id']; ?>">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">

								<label class="control-label mb-10 text-left">CONCEPTO CAJA</label>
								<select onchange="mostrar_pago()"  class="form-control"  id="concepto" tipo="<?php echo $data["conceptos"][0]["id_tipo_movimiento"]; ?>" name="concepto" required="true">
									<option value="">Seleccionar</option>
									<?php

									foreach ($data["conceptos"] as $key => $value) {
										echo "<option value='".$value["con_id"]."'>".$value["con_descripcion"]."</option>";
									}
									?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">

								<label class="control-label mb-10 text-left">FORMA DE PAGO</label>
								<select class="form-control" id="formapago" name="formapago" required="true">
									<option value="">Seleccionar</option>
									<?php

									foreach ($data["formapagos"] as $key => $value) {
										echo "<option value='".$value["for_id"]."'>".$value["for_descripcion"]."</option>";
									}
									?>
								</select>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">

								<label class="control-label mb-10 text-left">CAJA</label>
								<select class="form-control" id="caja" name="caja" required="true">
									<option value="">Seleccionar</option>
									<?php

									foreach ($data["caja"] as $key => $value) {
										echo "<option value='".$value["id_caja"]."'>".$value["caja_descripcion"]."</option>";
									}
									?>
								</select>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">

								<label class="control-label mb-10 text-left">DESCRIPCION</label>
								<input type="text" name="descripcion" id="descripcion" class="form-control">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label mb-10 text-left">MONTO</label>
								<input type="number" name="monto" id="monto" step="0.01" class="form-control">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">

								<label class="control-label mb-10 text-left">COMPROBANTE</label>
								<?php if ($data['id'] == 1) {
									$variable = 'readonly';
								}else{
									$variable = '';
								} ?>
								<select class="form-control" id="id_tipo_comprobante" onchange="poner_comprobante(<?php echo $data['id']; ?>);" name="id_tipo_comprobante" required="true">
									<option value="0">SIN DOCUMENTO</option>
									<?php
									foreach ($data["tipo_comprobante"] as $key => $value) {
										echo "<option value='".$value["tipodoc_id"]."'>".$value["tipodoc_descripcion"]."</option>";
									}
									?>
								</select>
							</div>
						</div>


			</div>
			<div class="row">
				<div class="col-md-4">
					<label class="control-label mb-10 text-left">DESCRIPCION COMPROBANTE</label>
					<input class="form-control" id="descripcion_comprobante" name="descripcion_comprobante" <?php echo $variable; ?>>
				</div>
                <?php if($data['id']==2){ ?>
                <div class="col-md-4">
                    <label class="control-label mb-10 text-left">PROVEEDOR <a href="<?php echo base_url() ?>Proveedor/nuevo" target="_blank"><button type="button"  onclick="" style="background: #3aa0dc;color: #fff;border: 1px #3aa0dc;">
                                                     <i class="ti-plus text" aria-hidden="true"></i>
                                                    </button></a></label>
                    <div class="form-group" style="margin-bottom:5px;">
                    <div class="input-group">
                    <select name="id_proveedor" id="id_proveedor"  required="required" class="form-control " tabindex="-1" aria-hidden="true">
                    <option value="">Seleccionar proveedor</option>
                   <!-- <?php foreach ($data["proveedor"] as $key => $value) { ?>
                        <option value="<?php echo $value["proveedor_id"]; ?>"><?php echo $value["proveedor_razonsocial"]; ?></option>
                    <?php } ?>-->


                    </select>

                    </div>

                    </div>
                </div>
                <?php }else{ ?>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label mb-10 text-left">CLIENTE</label>
	                        <div class="form-group" style="margin-bottom:5px;">
	                    <div class="input-group">
	                    <select id="cliente" onchange="cambiar_razon();" class="form-control" name="cliente" tabindex="-1" aria-hidden="true">
	                    <option value="">Seleccionar Cliente</option>



	                    </select>
 
	                    </div>

	                    </div>
<!--                         <select id="cliente" onchange="cambiar_razon();" class="form-control" name="cliente" tabindex="-1" aria-hidden="true">
                            <option value="">Seleccionar Cliente</option>
                        </select>
                        <input type="hidden" name="razon_social" id="razon_social" value="">
                        <input type="hidden" name="documento" id="documento" value=""> -->
                    </div>
                </div>
                <?php } ?>
                <div class="col-md-2">
                    <label class="control-label mb-10 text-left">MONEDA</label>
                    <select class="form-control" id="moneda" name="moneda" required="true">
                        
                    <?php
            
                       foreach ($data["moneda"] as $key => $value) {
                      echo "<option value='".$value["moneda_id"]."'>".$value["moneda_descripcion"]."</option>";
                       }
                     ?>
                    </select>
                </div>
                <div class="col-md-2">
                <label class="control-label mb-10 text-left">CAMBIO DOLAR</label>
                <input type="text" value="" class="form-control" name="cambio" id="cambio">
            </div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<input type="checkbox" value="1" class="form-check-input" id="igv" name="igv">
    				<label class="form-check-label" for="igv">IGV</label>
				</div>
			</div>

			<div id="formulario_pago_tributo" class="row">
				<div class="col-md-2">
					<label>Anio Periodo</label>
					<input type="text" id="anio_periodo" maxlength="4" onkeypress="return solonumeros(event)" name="anio_periodo" class="form-control">

				</div>
				<div class="col-md-2">
					<label>Mes Periodo</label>
					<input type="text" id="mes_periodo" onkeypress="return solonumeros(event)" maxlength="2" name="mes_periodo" class="form-control">

				</div>
			</div>

			  <br>
			  <center><a href="<?php echo  base_url();?>movimiento"><button class="btn btn-danger" type="button" >Cancelar</button><a> <button class="btn btn-primary" id="guardar_boton" >Guardar</button></center>								
		   </form>
	    </div>
	 </div>
	</div>
</div>
<script src="<?php echo base_url(); ?>public1/js/select2.min.js"></script>
<script type="text/javascript">
    $(function(){
    	var globalvariable = 0;
    	 concepto= $("#concepto").val();
        $("#anio_periodo").attr("required",false);
        $("#mes_periodo").attr("required",false);
       $("#formulario_pago_tributo").hide();
       $("#descripcion").attr("readonly",false);
       $("#anio_periodo").val("");
        $("#mes_periodo").val("");
        $.post(base_url+"Compra/ultimo_cambio",function(data){
        	poner_comprobante(<?php echo $data['id']; ?>);
             $("#cambio").val(parseFloat(data));
      });

        $('#id_proveedor').select2({
            ajax: {
                url: base_url+'Movimiento/buscar_proveedor',
                dataType: 'json',
                placeholder: 'Buscar Proveedor',
                maximumSelectionLength: 10
                // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
            },
            language: {
                noResults: function() {
                    return "No hay resultado";
                },
                searching: function() {
                    return "Buscando..";
                }

            }

        });

    })
  function nuevo_clienter(){
    $("#nuevo_cliente").modal();
  }

    function mostrar_pago() {
     }
	function guardar()
	{
		$("#guardar_boton").text("Procesando...");
		$("#guardar_boton").attr("disabled",true);
		var id=$("#concepto").val();
		

			$.post(base_url+"movimiento/save_movimiento",$("#formulario").serialize(),function(data){
				if(parseInt(data)!=0){
						generar_notificacion("movimiento Exitoso","se genero correctamente el movimiento","success","#fec107");
						location.href=base_url+"movimiento";
					
              	
              }
              else{
              	generar_notificacion("movimiento erroneo","No hay dinero suficiente","error","#fec107");
              }

              $("#guardar_boton").text("Guardar");
              $("#guardar_boton").attr("disabled",false);
          });
			return false;
		}

		$('#cliente').select2({
			ajax: {
				url: base_url+'pedido/buscar_cliente1',
				dataType: 'json',
				placeholder: 'Buscar Cliente',
				maximumSelectionLength: 10,

				data: function (params) {
					return {
                    q: params.term, // search term
                    page: params.page,
                    id: $("#tipo_comprabante").val(),
                    tipo_pago:$("#tipo_pago").val(),
                    totalpago: $("#total_pagar_modal").text()
                };
            },
            processResults: function (data, params) {

                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used


                return {
                	results: data.results

                };
            },
            cache: true
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
},
     escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection, // omitted for brevity, see the source of this page
        language: {

        	noResults: function() {

        		return "No hay resultado";
        	},
        	searching: function() {

        		return "Buscando..";
        	}
        }});


		function ptr(callback) {
			setTimeout(function () {
				var div = document.createElement('div'),
				feedTmpl = document.getElementById('feed-type-01').textContent;
				div.innerHTML = (feedTmpl + feedTmpl);
				callback(null, div.children);
			}, 1500);
		}

		function formatRepo (repo) {
			if (repo.loading) return repo.text;
			var markup="";
			markup += "<h5 style='font-size:15px;'>"+repo.text + "</h5>" ;
			markup += "<h6 style='font-size:12px;'>"+repo.documento + "</h6>" ;




			return markup;
		}
		function formatRepoSelection (repo) {
			return repo.text || repo.documento;
		}

		function cambiar_razon(){
			var data = $('#cliente').select2('data');
			$("#razon_social").val(data[0].text);
			$("#documento").val(data[0].documento);
		}

function poner_comprobante(tipo){
	if (tipo == 1) {
var dat=$("#id_tipo_comprobante").val();
  globalvariable = dat;
 // $("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
  if(dat!=0){
    $.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){
      if (data["estado"] == 1) {
        //$("#comprobante").text("Nº "+data["correlativo"]);
        $("#descripcion_comprobante").val(data["correlativo"]);
        $("#submit-sale").attr("disabled",false);
        $("#submit-sale").text("Guardar");
      }else{
        generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
        $("#submit-sale").attr("disabled",true);
        $("#submit-sale").text("Guardar");
      }
      //$("#comprobante").text("Nº "+data);
    },'json');
  }else{
    $("#submit-sale").attr("disabled",false);
    $("#submit-sale").text("Guardar");
    $("#descripcion_comprobante").val('001-1');
    //$("#comprobante").text("Nº 001-1");
  }
	}else{

	}

}

	</script>

