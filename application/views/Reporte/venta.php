 
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<script src = "https://code.highcharts.com/highcharts.src.js"> </script>

<div class="row">
	<div class="col-md-4">
       <div class="form-group">
		<label>Rango de Fecha</label>
		<input type="text" name="daterange" autocomplete="off" value="01/01/2018 - 01/15/2018" class="form-control">
	</div>
	</div>

</div>

<div class="row">
	<div class="col-md-12">
		<div id="container">
			
		</div>
	</div>
</div>

<script>
$(function() {

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
                   
                    $.post("<?php echo base_url(); ?>Reporte_venta/venta_dia",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else if(label=="Ayer"){
                   
                    $.post("<?php echo base_url(); ?>Reporte_venta/venta_dia",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else if(label=="Esta semana"){
				

                    $.post("<?php echo base_url(); ?>Reporte_venta/venta_semana",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

			}
			 else if(label=="Semana pasada"){

                    $.post("<?php echo base_url(); ?>Reporte_venta/venta_semana",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

			}
			 else if(label=="Este año")
			{
               $.post("<?php echo base_url(); ?>Reporte_venta/venta_anio",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
			}
			else{
				$.post("<?php echo base_url(); ?>Reporte_venta/venta_mes",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
                 
			}
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});



Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Detalle de Ventas'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: 'Soles (S/.)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: 'Dias',
        data: [0,0,0,0,0,0,0,0,0,0,0,0]
    }]
});
});


function ver(datos){
Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Detalle de Ventas'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: datos["extension"]
    },
    yAxis: {
        title: {
            text: 'Soles (S/.)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name:  datos["cronologia"],
        data: datos["monto"]
    }]
});


}


</script>

