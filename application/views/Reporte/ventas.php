 
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" />

<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label>Tipo</label>
            <select class="form-control" id="tipo" name="tipo"  >
                <option value="1">TODOS</option>
                <option value="2">ACTIVOS</option>
                <option value="3">ELIMINADOS</option>

            </select>
        </div>

    </div>
	<div class="col-md-4">
       <div class="form-group">
		<label>Rango de Fecha</label>
		<input type="text" name="daterange" autocomplete="off" value="01/01/2018 - 01/15/2018" class="form-control">
	</div>
	</div>

    <div class="col-md-3">
       <button class="btn btn-success" onclick="tableToExcel('datable', 'W3C Example Table')" style="margin-top: 20px;">Exportar</button>
  </div>

</div>
<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label>total de venta</label>
            <input type="number" value="0.00" readonly="true" step="0.01" name="input_total" id="input_total" class="form-control">
        </div>
    </div>
</div>
<div class="row">
	<div class="col-md-12">
	
        <div class="table-responsive">

            <table class="table display product-overview mb-30" id="datable">

             <thead>

                <tr>

                    <th width="10%">#</th>

                    <th width="20%">Documento</th>

                    <th width="10%">Serie</th>

                    <th width="10%">Número</th>

                    <th width="10%">Fecha</th>
                    <th width="10%">FORMA PAGO</th>
                    <th width="10%">CAJERO</th>


                    <th width="10%">Monto</th>                

                    <th width="20%">N° doc</th>
                    <th width="20%">Cliente</th>
                    <th width="20%">Motivo eli.</th>

                </tr>

             </thead>

             <tbody id="cuerpo_tabla">

                
             </tbody>

            </table>

    </div>

	</div>
</div>



<script>


var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
     datable.destroy();

let html="<tr id='total_tabla'><td colspan='7'></td><td>"+total.toFixed(2)+"</td><td colspan='3'></td></tr>";
$("#cuerpo_tabla").append(html);

    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))


$("#total_tabla").remove();
       datable=$("#datable").DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
        }
    });
  }
})()

























    var datable;
$(function() {

     datable=$("#datable").DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
        },
         dom: 'Bfrtip',
        buttons: [
            'copy',
            {
                extend: 'excel',
                messageTop: 'The information in this table is copyright to Sirius Cybernetics Corp.'
            },
            {
                extend: 'pdf',
                messageBottom: null
            },
            {
                extend: 'print',
                messageTop: function () {
                    printCounter++;
 
                    if ( printCounter === 1 ) {
                        return 'This is the first time you have printed this document.';
                    }
                    else {
                        return 'You have printed this document '+printCounter+' times';
                    }
                },
                messageBottom: null
            }
        ]
    });

  $('input[name="daterange"]').daterangepicker({showDropdowns:!0,showWeekNumbers:!0,autoApply:!0,ranges:{
  	Hoy:[moment(),moment()],
	Ayer:[moment().subtract(1,"days"),moment().subtract(1,"days")],
	"Esta semana":[moment().startOf("isoWeek"),moment().endOf("isoWeek")+1],
		"Semana pasada":[moment().subtract(1,"weeks").startOf("isoWeek"),moment().subtract(1,"weeks").endOf("isoWeek")+1],
		"Este mes":[moment().startOf("month"),moment().endOf("month")],"Mes pasado":[moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")],
		"Este año":[moment().startOf("years"),moment().endOf("years")]},
		locale:{format:"DD/MM/YYYY",separator:" - ",applyLabel:"Apply",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",customRangeLabel:"Custom",daysOfWeek:["Do","Lu","Mar","Mie","Jue","Vie","Sa"],monthNames:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],firstDay:1},linkedCalendars:!1,startDate:moment().subtract(5,"days"),endDate:moment()}, 
		function(start, end, label) {
			if(label=="Hoy"){
                   
                    $.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else if(label=="Ayer"){
                   
                    $.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else if(label=="Esta semana"){
				

                    $.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

			}
			 else if(label=="Semana pasada"){

                    $.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

			}
			 else if(label=="Este año")
			{
               $.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else{
				$.post("<?php echo base_url(); ?>Reporteventa/cargar_reporte_venta",{"tipo":$("#tipo").val(),"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
                 
			}
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
});

 let total=0;


function ver(info)
{

 let html="";

   for (var i = 0; i < info.length; i++) {
    total=total+parseFloat(info[i]["monto"]);
      // info[i]
      html+="<tr>";
      html+="<td>"+(i+1)+"</td>";
      html+="<td>"+info[i]["codigo_documento"]+"</td>";
      html+="<td>"+info[i]["serie"]+"</td>";
      html+="<td>"+info[i]["documento"]+"</td>";
      html+="<td>"+info[i]["fecha"]+"</td>";
      html+="<td>"+info[i]["formapago"]+"</td>";
      html+="<td>"+info[i]["nombre"]+"</td>";
      html+="<td>"+info[i]["monto"]+"</td>";

      html+="<td>"+info[i]["nro_documento"]+"</td>";
      html+="<td>"+info[i]["cliente"]+"</td>";

      html+="<td>"+info[i]["motivo_eliminacion"]+"</td>";


       

      html+="</tr>";
    //  console.log(i);

   }

//alert(total);

$("#input_total").val(total.toFixed(2));
    datable.destroy();
  $("#cuerpo_tabla").empty().append(html);
   datable=$("#datable").DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
        }
    });

}


</script>





