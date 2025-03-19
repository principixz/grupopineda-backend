<div class="row">
    <form id="formulario" name="formulario" onsubmit="return buscar()">
    <div class="col-md-3">
        <div class="form-group">
            <label>Fecha Inicio</label>
            <input type="date" name="inicio" id="inicio" class="form-control" required="true">
        </div>
    </div>
        <div class="col-md-3">
        <div class="form-group">
            <label>Fecha Fin</label>
            <input type="date" name="fin" id="fin" class="form-control"  required="true">
        </div>

    </div>
    <div class="col-md-3">
        <center>
            <br>
            <button type="submit" class="btn btn-success">Buscar</button>
        </center>
    </div>
</form>
</div>
<div class="row">
   <div class="col-md-12">
      <table id="example" class="display nowrap" style="width:100%">
        <thead>
            <tr>
                <th>#</th>
                <th>Caja</th>
                <th>Tipo</th>
                <th>Concepto</th>
                <th>Monto</th>
                <th>Descripcion</th>
                <th>Fecha</th>
                <th>Empleado</th>



            </tr>
        </thead>
        <tbody id="cuerpo">
            
        </tbody>
    </table>
   </div>
</div>
<script type="text/javascript">
   $(document).ready(function() {
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
function buscar()
{

    $.post("<?php echo base_url(); ?>Reporte_movimiento/buscar_movimiento",$("#formulario").serialize(),function(data){
        $('#example').DataTable().destroy();
         $("#cuerpo").empty().append(data);  
         $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
    });

    return false;
}

</script>