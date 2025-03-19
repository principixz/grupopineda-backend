<div class="row">

    <div class="col-md-12">
        <a href="<?php echo base_url();?>Compra/nuevo"><button class="btn  btn-success" >Nuevo</button></a>

    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table display product-overview mb-30" id="my_Table">
                <thead>
                <tr>

                    <th width="5%">id </th>
                    <th width="20%">Proveedor</th>

                    <th width="10%">Comprobante</th>

                    <th width="10%">monto </th>
                    <th width="10%">tipo </th>
                    <th width="10%">fecha </th>
                    <th width="10%">Acciones</th>
                </tr>
                </thead>
                <tbody >

                </tbody>
            </table>
        </div>

    </div>
</div>





<div id="modal_detalle_compra" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title" id="myModalLabel">DETALLE DE COMPRA</h5>
            </div>
            <div class="modal-body">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="tabla_detalle"></div>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<div id="modal_eliminar_compra" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h5 class="modal-title" id="myModalLabel">NOTA DE CREDITO</h5>
            </div>
            <form id="formulario_nota_credito">
                <div class="modal-body">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="monto_compra_modal">Monto</label>
                                <input type="text" id="monto_compra_modal" class="form-control" disabled="" >
                                <input type="hidden" id="monto_compra_h" name="monto_compra_h"  >
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="tipo_pago">Descripcion</label>
                                    <select class="form-control" id="tipo_pago" name="tipo_pago">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="forma_pago">forma pago</label>
                                    <select class="form-control" id="forma_pago" name="forma_pago">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>fecha</label>
                                    <input type="date" max="<?php echo date("Y-m-d"); ?>" value="<?php echo date("Y-m-d"); ?>" class="form-control" name="fecha_nota" id="fecha_nota">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label for="nota_serie">Serie</label>
                                <input type="text" name="nota_serie" id="nota_serie" class="form-control"  >
                            </div>
                            <div class="col-md-4">
                                <label for="exampleInputEmail1">Correlativo</label>
                                <input type="text" name="nota_correlativo" id="nota_correlativo" class="form-control" onkeypress="return solonumeros(event)" >
                            </div>
                        </div>
                        <div id="codigo_correlativo"></div>
                        <br>
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="sin_notacredito()">Sin Nota Credito</button>
                <button type="button" class="btn btn-primary" onclick="con_notacredito()">Con Nota Credito</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>



<script type="text/javascript">
    $(function () {


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
                    "url": "<?php echo base_url() ?>compra/buscar_tabla",
                    "dataType": "json",
                    "type": "POST",
                    "data":{  '<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>' }
                },
                "columns": [
                    { "data": "id" },
                    { "data": "proveedor" },
                    { "data": "comprobante" },
                    { "data": "monto" },

                    { "data": "tipo" },
                    { "data": "fecha" },

                    { "data": "acciones" },
                ],


            }




        );


    });
    $(function () {
        //validarcaja();
    });


    function mostrar_detalle_compra(id)
    {
         $("#modal_detalle_compra").modal();
           $("#tabla_detalle").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
        $.post(base_url+"Compra/extraer_detalle_compra",{"id":id},function(data){

            html="";
            if(parseFloat(data[0]["tipo_moneda"])==2)
            {
                html+='<label>tipo de cambio : '+data[0]["cambio_dolar"]+'</label>';
            }
            html+='<table class="table table-striped table-bordered mb-0">';

            html+='<thead>';
            html+='<tr>';
            html+='<th>#</th>';
            html+='<th>PRODUCTO</th>';
            html+='<th>UNIDAD M.</th>';
            html+='<th>CANT.</th>';
            

            html+='<th>PRECIO</th>';
            html+='<th>DESC.</th>';
            html+='<th>SUBTOTAL</th>';
            html+='</tr>';
            html+='</thead>';
            html+='<tbody>';
            var cont=0;
            for (var i = 0; i < data.length; i++) {
                var cantidad=parseFloat(data[i]["cantidad"]);
                var precio=parseFloat(data[i]["precio"]);
                var descuento=parseFloat(data[i]["descuento"]);
                var total=(cantidad*precio)-descuento;
                cont=cont+total;
                html+='<tr>';
                html+='<td>'+(i+1)+'</td>';
                html+='<td>'+data[i]["producto"]+'</td>';
                html+='<td>'+data[i]["unidad_medida"]+'</td>';

                html+='<td>'+precio.toFixed(2)+'</td>';
                html+='<td>'+cantidad.toFixed(2)+'</td>';
                html+='<td>'+descuento.toFixed(2)+'</td>';
                html+='<td>'+total.toFixed(2)+'</td>';

                html+='</tr>';

            }

            html+='<tr>';
            html+='<td colspan="6">TOTAL</td>';

            html+='<td>'+(Math.round(cont*10)/10).toFixed(2)+'</td>';
            html+='</tr>';

            html+='</tbody>';
            html+='</table>';

            $("#tabla_detalle").empty().append(html);
        },"json");
       

    }

    function eliminar_compra(id)
    {
        html="";
        html+="<input type='hidden' id='id_nota_credito' name='id_nota_credito' value='"+id+"'>";
        $("#codigo_correlativo").empty().append(html);
        $("#modal_eliminar_compra").modal();

        $.post(base_url+"Compra/datos_eliminar_compra",{"id":id},function(data){
            var html1="";
            $.each( data["foram_pago"], function( key, value ) {
                html1+="<option value='"+value["for_id"]+"'>"+value["for_descripcion"]+"</option>";
            });
            $("#forma_pago").html(html1);
            var html2="";
            $.each( data["tipo_pago"], function( key, value ) {
                html2+="<option value='"+value["motivo_nota_credito_descripcion"]+"'>"+value["motivo_nota_credito_descripcion"]+"</option>";
            });
            $("#tipo_pago").html(html2);
            $("#monto_compra_modal").val(data["monto_compra"][0]["compra_total"]);
            $("#monto_compra_h").val(data["monto_compra"][0]["compra_total"]);

        },'json')

    }

    function sin_notacredito(){
        var codigo=$("#id_nota_credito").val();
        $.post(base_url+"Compra/anular_compra",{'id':codigo},function(data){
            if(data==1){
                location.reload();
            }else{
                alert("Surgio un error")
            }

        })
    }

    function con_notacredito(){
        if($("#nota_serie").val()==""){
            alert("ingrese una serie");
        }else{
            if($("#nota_correlativo").val()==""){
                alert("ingrese un correlativo");
            }else{
                var datos=$("#formulario_nota_credito").serialize();
                $.post(base_url+"Compra/nota_credito",datos,function(data){
                    if(data == 1){
                      //  location.reload();
                    }else{
                        alert("No se pudo guardar los datos");
                    }

                })
            }
        }

    }

</script>