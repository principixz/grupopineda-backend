<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src = "https://code.highcharts.com/highcharts.src.js"> </script>
<form id="formulario" onsubmit="return generar_data()" name="formulario">
<div class="row">
    <div class="col-md-12">
    <div class="col-md-3">
       <div class="form-group">
        <label>Fecha de Inicio</label>
        <!--<input type="text" name="daterange" autocomplete="off" value="01/01/2018 - 01/15/2018" class="form-control">-->
        <input type="date" id="fecha_inicio" value="<?php echo date('Y-m-d') ?>" name="fecha_inicio" class="form-control">
    </div>
</div>
     <div class="col-md-3">
       <div class="form-group">
        <label>Fecha de Fin</label>
        <!--<input type="text" name="daterange" autocomplete="off" value="01/01/2018 - 01/15/2018" class="form-control">-->
        <input type="date" value="<?php echo date('Y-m-d') ?>" id="fecha_fin" name="fecha_fin" class="form-control">
    </div>
   </div>
   <div class="col-md-3"><br>
       <button type="submit" class="btn btn-success" id="boton_guardar">Guardar</button>
   </div>
</div>
  </div>
</form>
<div class="row">
    <div class="col-md-12">
        <div id="container">
            
        </div>
    </div>
</div>

<script>

    function generar_data()
    {
        if($("#fecha_inicio").val()!=$("#fecha_fin").val()){
            $("#boton_guardar").text("Generando...");
            $("#boton_guardar").attr("disabled",true);
       $.post(base_url+"RGraficosm/mostrar_movimiento",$("#formulario").serialize(),function(data){

       
         ver(data);
         $("#boton_guardar").text("Guardar");
            $("#boton_guardar").attr("disabled",false);
       },"json");
        }else{

            alert("Tienes que poner fechas diferentes por favor");
        }
        return false;
    }
$(function() {
 /* $('input[name="daterange"]').daterangepicker({showDropdowns:!0,showWeekNumbers:!0,autoApply:!0,ranges:{
    Hoy:[moment(),moment()],
    Ayer:[moment().subtract(1,"days"),moment().subtract(1,"days")],
    "Esta semana":[moment().startOf("isoWeek"),moment().endOf("isoWeek")+1],
        "Semana pasada":[moment().subtract(1,"weeks").startOf("isoWeek"),moment().subtract(1,"weeks").endOf("isoWeek")+1],
        "Este mes":[moment().startOf("month"),moment().endOf("month")],"Mes pasado":[moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")],
        "Este año":[moment().startOf("years"),moment().endOf("years")]},
        locale:{format:"DD/MM/YYYY",separator:" - ",applyLabel:"Apply",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",customRangeLabel:"Fechas",daysOfWeek:["Do","Lu","Mar","Mie","Jue","Vie","Sa"],monthNames:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],firstDay:1},linkedCalendars:!1,startDate:moment().subtract(5,"days"),endDate:moment()}, 
        function(start, end, label) {
            if(label=="Hoy"){
                   
                    $.post("<?php echo base_url(); ?>RGraficosm/moviento_dia",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
            }
            else if(label=="Ayer"){
                   
                    $.post("<?php echo base_url(); ?>RGraficosm/moviento_dia",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
            }
            else if(label=="Esta semana"){
                

                    $.post("<?php echo base_url(); ?>RGraficosm/moviento_semana",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

            }
             else if(label=="Semana pasada"){

                    $.post("<?php echo base_url(); ?>RGraficosm/moviento_semana",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");

            }
             else if(label=="Este año")
            {
               $.post("<?php echo base_url(); ?>RGraficosm/moviento_anio",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
            }
            else{
                $.post("<?php echo base_url(); ?>RGraficosm/moviento_mes",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
                 
            }
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});*/



Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Detalle de Movimientos'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
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
        name: 'Dias - Ingresos',
        data: [0,0,0,0,0,0,0,0,0,0,0,0]
    },{
        name: 'Dias - Egresos',
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
        text: 'Detalle de Movimientos'
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
        name:  "EGRESO EN SOLES(DIA)",
        data: datos["ingreso"]
    },{
        name:  "INGRESO EN SOLES(DIA)",
        data: datos["egreso"]
    }]
});


}


</script>

