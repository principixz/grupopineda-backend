<script src = "https://code.highcharts.com/highcharts.src.js"> </script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<style type="text/css">



    #top_cliente::-webkit-scrollbar {
    width: 5px;
}

#top_cliente::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
}

#top_cliente::-webkit-scrollbar-thumb {
  background-color: black;
  outline: 1px solid slategrey;
}
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div style="margin:0px !important;padding-bottom:0px !important;" class="row">
   <div style="margin:0px !important;padding-bottom:0px !important;" class="col-md-12">
     <div style="margin:0px !important;padding-bottom:0px !important;" id="notificacion">

     </div>
   </div>
</div>
<!-- Row -->
<div class="row">
   <div class="col-lg-8 col-md-6 col-sm-12 col-xs-12">
    <div class="panel panel-default card-view">
     <div class="panel-heading">
        <div class="pull-left">
           <h6 class="panel-title txt-dark">Analisis de Ventas</h6>
       </div>
       <div class="pull-right">

           <a href="#" class="pull-left inline-block full-screen">
              <i class="zmdi zmdi-fullscreen"></i>
          </a>
      </div>
      <div class="clearfix"></div>
  </div>
  <div class="panel-wrapper collapse in">
    <div class="panel-body">

       <div id="e_chart_1" class="" style="height:400px;"></div>
   </div>
</div>
</div>
</div>
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">


  <div class="panel panel-default card-view panel-refresh">
     <div class="refresh-container">
        <div class="la-anim-1"></div>
    </div>
    <div class="panel-heading">
        <div class="pull-left">
           <h6 class="panel-title txt-dark">Productos Más Vendidos</h6>
       </div>
       <div class="clearfix"></div>
   </div>
   <div class="panel-wrapper collapse in">
    <div id="container_top"></div>
</div>
</div>
</div>
</div>

<div class="row">
  <div class="col-lg-4">


      <div class="panel panel-default card-view panel-refresh">
         <div class="refresh-container">
            <div class="la-anim-1"></div>
        </div>
        <div class="panel-heading">
            <div class="pull-left">
 
               <h5><i class=" fa fa-star tblDeud__starCliente"></i> Clientes con mayor consumo</h5>
 
           </div>
           <div class="clearfix"></div>
       </div>
       <div class="panel-wrapper collapse in">
 
        <div id="top_cliente" style="height: 300px;overflow-y: scroll;overflow-x: hidden;">
         
       </div>
   </div>
</div>
</div>
 
<div class="col-lg-8">


    <div class="panel panel-default card-view panel-refresh">
        <div class="refresh-container">
            <div class="la-anim-1"></div>
        </div>
        <div class="panel-heading">
            <div class="pull-left">
                <h5><i class="fa fa-cart-plus"></i> Ganancia Neta</h5>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="panel-wrapper collapse in">
            <div id="ganancia_neta">

            </div>
        </div>
    </div>
</div>
</div>
 
 <div class="row">
    <div class="col-lg-12">
<div class="panel panel-default card-view panel-refresh">
        <div class="refresh-container">
            <div class="la-anim-1"></div>
        </div>
        <div class="panel-heading">
            <div class="pull-left">
                <h5><i class="fa fa-cart-plus"></i> Productos mas vendidos</h5>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="panel-wrapper collapse in">
          <div class="row">
  <div class="col-md-4">
       <div class="form-group">
    <label>Rango de Fecha</label>
    <input type="text" name="daterange" autocomplete="off" value="01/01/2018 - 01/15/2018" class="form-control">
  </div>
  </div>

</div>
            <div id="container_top1">

            </div>
        </div>
    </div>
    </div>
 </div>

 


<script type="text/javascript">






	

	$(function(){
        $.post("<?php echo base_url() ?>Control/mov_sede",function(data){
            Highcharts.chart('ganancia_neta', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: data["total"]
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>S/.{point.y:.1f}</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: S/.{point.y:.1f}',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Movimientos',
                    colorByPoint: true,
                    data: [{
                        name: 'I. Caja Física',
                        y: data["hingresosf"],
                        sliced: true,
                        selected: true
                    }, {
                        name: 'I. Caja Virtual',
                        y: data["hingresosv"]
                    }, {
                        name: 'E. Caja Física',
                        y: data["hegresosf"]
                    }, {
                        name: 'E. Caja Virtual',
                        y: data["hegresosv"]
                    }]
                }]
            });
        },"json");
 
 





$.post("<?php echo base_url(); ?>Control/top_cliente",function(data){

    html="<br>";
    for(i=0;i<data.length;i++)
    {
        html+='<span class="pull-left inline-block capitalize-font txt-dark">'+data[i]["cliente_nombres"]+'</span>';
        html+='<span class="label label-success pull-right">S/ '+data[i]["suma"]+'</span>';
        html+='<div class="clearfix"></div>';
        html+='<hr class="light-grey-hr row mt-10 mb-10">';
    }
    $("#top_cliente").empty().append(html);
},"json");

$.post("<?php echo base_url() ?>Control/top_5_producto",function(data){

    Highcharts.chart('container_top', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Los productos Con Mayor Ventas'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Cantidad',
            colorByPoint: true,
            data: data
        }]
    });


},"json");

  $('input[name="daterange"]').daterangepicker({showDropdowns:!0,showWeekNumbers:!0,autoApply:!0,ranges:{
    Hoy:[moment(),moment()],
  Ayer:[moment().subtract(1,"days"),moment().subtract(1,"days")],
  "Esta semana":[moment().startOf("isoWeek"),moment().endOf("isoWeek")+1],
    "Semana pasada":[moment().subtract(1,"weeks").startOf("isoWeek"),moment().subtract(1,"weeks").endOf("isoWeek")+1],
    "Este mes":[moment().startOf("month"),moment().endOf("month")],"Mes pasado":[moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")],
    "Este año":[moment().startOf("years"),moment().endOf("years")]},
    locale:{format:"DD/MM/YYYY",separator:" - ",applyLabel:"Apply",cancelLabel:"Cancel",fromLabel:"From",toLabel:"To",customRangeLabel:"Custom",daysOfWeek:["Do","Lu","Mar","Mie","Jue","Vie","Sa"],monthNames:["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],firstDay:1},linkedCalendars:!1,startDate:moment().subtract(5,"days"),endDate:moment()}, 
    function(start, end, label) {
        $.post("<?php echo base_url(); ?>Control/top_5_producto_dia",{"fecha_inicio":start.format('YYYY-MM-DD'),"fecha_fin": end.format('YYYY-MM-DD')},function(data){
                           ver(data);
                    },"json");
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});

function ver(data){

Highcharts.chart('container_top1', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Los productos Con Mayor Ventas'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Cantidad',
            colorByPoint: true,
            data: data
        }]
    });
}

$.post("<?php echo base_url() ?>Control/top_5_producto",function(data){

    Highcharts.chart('container_top1', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Los productos Con Mayor Ventas'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.y}</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Cantidad',
            colorByPoint: true,
            data: data
        }]
    });


},"json");












$.post("<?php echo base_url() ?>Control/venta_anual",function(data){

  var eChart_1 = echarts.init(document.getElementById('e_chart_1'));
  var option = {
     color: ['#0FC5BB', '#92F2EF','#D0F6F5'],		
     tooltip: {
        trigger: 'axis',
        backgroundColor: 'rgba(33,33,33,1)',
        borderRadius:0,
        padding:10,
        axisPointer: {
           type: 'cross',
           label: {
              backgroundColor: 'rgba(33,33,33,1)'
          }
      },
      textStyle: {
       color: '#fff',
       fontStyle: 'normal',
       fontWeight: 'normal',
       fontFamily: "'Open Sans', sans-serif",
       fontSize: 12
   }	
},
toolbox: {
    show: true,
    orient: 'vertical',
    left: 'right',
    top: 'center',
    showTitle: false,
    feature: {
       mark: {show: true},
       magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
       restore: {show: true},
   }
},
grid: {
    left: '3%',
    right: '10%',
    bottom: '3%',
    containLabel: true
},
xAxis : [
{
   type : 'category',
   data : data["extension"],
   axisLine: {
      show:false
  },
  axisLabel: {
      textStyle: {
         color: '#878787',
         fontFamily: "'Open Sans', sans-serif",
         fontSize: 12
     }
 },
}
],
yAxis : [
{
   type : 'value',
   axisLine: {
      show:false
  },
  axisLabel: {
      textStyle: {
         color: '#878787',
         fontFamily: "'Open Sans', sans-serif",
         fontSize: 12
     }
 },
 splitLine: {
  show: false,
}
}
],
series : [
{
   name:'1',
   type:'bar',
   data:data["monto"]
}
]
};

eChart_1.setOption(option);
eChart_1.resize();
},"json");
});

</script>


 