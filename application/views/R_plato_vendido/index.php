<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<form id="formulario_reporte_paltos_vendidos" onsubmit="return traer_insumo_datos()">
<div class="row">
        <div class="col-md-5">
            <div class="form-group">
                <label>Seleccionar Productos y/o Platos<span hidden="true" id="mensaje_proveedor" style="color:red;"> /Seleccione un plato</span></label>
            <select name="platos[]" id="ms" class="selectpicker" multiple="multiple" >
            <?php foreach ($data["platos"] as $key => $value) { ?>
                <option value="<?php echo $value["producto_id"]; ?>"><?php echo $value["producto_descripcion"]; ?></option>
            <?php } ?>
            </select>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group">
            <ul class="icheck-list">
                      <li>
                        <input type="checkbox" class="check"   id="exampleCheck1"   >
                        <label for="exampleCheck1">Todos</label>
                      </li>
                    </ul> 
 
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-group">
            <label>Fecha Inicio</label>
            <input type="date" max="<?php echo date('Y-m-d'); ?>" value="<?php echo date('Y-m-d'); ?>" class="form-control" name="inicio" name="inicio">
        </div>
    </div>
    <div class="col-md-2">
       <div class="form-group">
            <label>Fecha Fin</label>
            <input type="date" max="<?php echo date('Y-m-d'); ?>" value="<?php echo date('Y-m-d'); ?>" class="form-control" name="fin" name="fin">
        </div>
    </div>
    <div class="col-md-2">
               <br>
            <center>
                <button class="btn btn-success" id="buscar">Buscar</button>
            </center>
        </div>
</div>
 </form>
 
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table display product-overview mb-30" id="datos_">
                <thead>
                    <tr>
                    
                        <th width="20%">Nombre de Producto y Plato</th>
                        <th width="10%">Fecha</th>
                        <th width="10%">Cantidad</th>
                        <th width="10%">Precio</th>
                    </tr>
                </thead>
                <tbody id="cuerpo_tabla">

                </tbody>
            </table>
        </div>

    </div>
</div>
<script type="text/javascript">

    $(function(){

$('#datos_').DataTable( {
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
 
        $("#exampleCheck1").click(function () {

            if( $('#exampleCheck1').is(':checked') ) {
                $('#ms').selectpicker('selectAll');   
                $('.borrar').selectpicker('refresh');
            }else{
                $('#ms').selectpicker('deselectAll');
                $('.borrar').selectpicker('refresh');
            }
        }); 

        $(".selectpicker").selectpicker({
                noneSelectedText : 'Seleccione'
        }); 

    });

    $("select").change(function(){
        $(".check-mark").attr("class","glyphicon fa fa-check-circle check-mark");
    });
    

    function traer_insumo_datos(){
        if(!$("#ms").val()){
            $("#mensaje_proveedor").removeAttr("hidden");
            return false;
        }else{
            $("#mensaje_proveedor").attr("hidden","true");
        }
        $("#buscar").attr("disabled",true);
      $("#buscar").text("Buscando...");
   $.post(base_url+"R_plato_vendido/traer_reporte_platos_vendidos",$("#formulario_reporte_paltos_vendidos").serialize(),function(data){

    $("#buscar").attr("disabled",false);
      $("#buscar").text("Buscar");
               $('#datos_').DataTable().destroy();
            $("#cuerpo_tabla").empty().append(data);

            $('#datos_').DataTable( {
                pageLength: 100,
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
   });

return false;
    }
</script>