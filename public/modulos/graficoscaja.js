    $("#abrir_caja").click(function(){
    $("#abrir_caja").text("Procesando...");
    $(this).attr("disabled",true);

    $.post(base_url+"sesion_caja/apertura_caja",$("#formulario_caja").serialize(),function(data){
     window.location.href = base_url+'sesion_caja';
     $("#abrir_caja").text("Abrir caja");
     $("#abrir_caja").attr("disabled",false);
   });
  });

  function cerrarcaja(){
    $("#btn_cierrecaja").text("Procesando...");
    $("#btn_cierrecaja").attr("disabled",true);

    $.post(base_url+"sesion_caja/close_sesioncaja",{"ingresosv": $("#ingresosv").val() ,"ingresosf":$("#ingresosf").val() },function(data){
     $("#cerrar_caja_modal").modal('hide');
         window.location.href = base_url+'sesion_caja';
      });
  };


function cajafisica() { 
    var JSON=$.ajax({
    type: "POST",
    url:base_url+"sesion_caja/traerfisica",
    data: {"cajafisica" : $("#cajafisica").val(), "cajavirtual" :  $("#cajavirtual").val()},
    dataType: 'json',
    async: false}).responseText;
    var Respuesta=jQuery.parseJSON(JSON); 
    Highcharts.chart('container', {
    chart: {
        type: 'spline'
    },
    title: {
        text: 'Reporte de Caja Fisica del día'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: { // don't display the dummy year
            minute: '%H:%M',
            hour: '%H:%M',
            month: '%e. %b',
            year: '%b'
        },
        title: {
            text: 'Date'
        }
    },
    yAxis: {
        title: {
            text: 'Soles (S/.)'
        },
        min: 0
    },
    tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%e. %b %H:%M}: S/. {point.y:.2f}'
    },

    plotOptions: {
        spline: {
            marker: {
                enabled: true
            }
        }
    },

    colors: ['#6CF', '#39F', '#06C', '#036', '#000'],

    // Define the data points. All series have a dummy year
    // of 1970/71 in order to be compared on the same x axis. Note
    // that in JavaScript, months start at 0 for January, 1 for February etc.
    series: [
        Respuesta["data"]["compras"]
    , 
        Respuesta["data"]["ventas"]
    ]
});
  

}

function cajavirtual() { 
    var JSON=$.ajax({
    type: "POST",
    url:base_url+"sesion_caja/traervirtual",
    data: {"cajafisica" : $("#cajafisica").val(), "cajavirtual" :  $("#cajavirtual").val()},
    dataType: 'json',
    async: false}).responseText;
    var Respuesta=jQuery.parseJSON(JSON); 
    Highcharts.chart('container2', {
    chart: {
        type: 'spline'
    },
    title: {
        text: 'Reporte de Caja Virtual del día'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: { // don't display the dummy year
            minute: '%H:%M',
            hour: '%H:%M',
            month: '%e. %b',
            year: '%b'
        },
        title: {
            text: 'Date'
        }
    },
    yAxis: {
        title: {
            text: 'Soles (S/.)'
        },
        min: 0
    },
    tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%e. %b %H:%M}: S/. {point.y:.2f} '
    },

    plotOptions: {
        spline: {
            marker: {
                enabled: true
            }
        }
    },

    colors: ['#6CF', '#39F', '#06C', '#036', '#000'],

    // Define the data points. All series have a dummy year
    // of 1970/71 in order to be compared on the same x axis. Note
    // that in JavaScript, months start at 0 for January, 1 for February etc.
    series: [
        Respuesta["data"]["compras"]
    , 
        Respuesta["data"]["ventas"]
    ]
});
  


}

cajafisica();
cajavirtual();
