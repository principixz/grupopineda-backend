<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src = "https://code.highcharts.com/highcharts.src.js"> </script>
<form id="formulario" onsubmit="return traer_rendimiento()">
<div class="row">
	<div class="col-md-3">
		<div class="form-group">
			<label>Selecionar Empleado</label>
		<select class="form-control" id="id_empleado" name="id_empleado" required="true">
			<option value="">Seleccionar</option>
			
		</select>
	</div>
	</div>
	<div class="col-md-2">
		<div class="form-group">
      <label>Inicio</label>
      <input type="date" name="inicio" id="inicio" required="true" value="<?php echo date('Y-m-d'); ?>"  max="<?php echo date('Y-m-d'); ?>" class="form-control" >
    </div>
	</div>
	<div class="col-md-2">
		  <div class="form-group">
      <label>Fin</label>
      <input type="date" name="fin" id="fin" required="true"  value="<?php echo date('Y-m-d'); ?>"  max="<?php echo date('Y-m-d'); ?>" class="form-control" >
    </div>
	</div>
  <div class="col-md-2">
    <br>
    <button class="btn btn-success" id="boton_buscar">Buscar</button>
  </div>
</div>
</form>
<div class="row">
    <div class="col-md-12">
        <div id="container">
            
        </div>
    </div>
</div>

<script type="text/javascript">
function traer_rendimiento()
{
  $("#boton_buscar").attr("disabled",true);
  $("#boton_buscar").text("Buscando...");

  $.post(base_url+"Venta_empleado/buscar_empleado",$("#formulario").serialize(),function(data){
      $("#boton_buscar").attr("disabled",false);
  $("#boton_buscar").text("Buscar");
      graficar(data);
  },"json");
  return false;
}




	  $(function(){

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
        name: 'Cantidad de Venta',
        data: [0,0,0,0,0,0,0,0,0,0,0,0]
    },{
        name: 'Monto de Venta',
        data: [0,0,0,0,0,0,0,0,0,0,0,0]
    }]
});
















       $('#id_empleado').select2({
   ajax: {
    url: base_url+'Venta_empleado/traer_personal',

        dataType: "json",
    data: function (params) {
      var query = {
        search: params.term,
        type: 'public'
      }

      // Query parameters will be ?search=[term]&type=public
      return query;
    },
  processResults: function (data) {
    return {
        results: $.map(data.results, function(obj) {
            return { id: obj.id, text: obj.text };
        })
    };
  }
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
   });


    function graficar(data)
    {
      


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
        categories: data["fecha"]
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
        name: 'Cantidad de Venta',
        data: data["cantidad"]
    },{
        name: 'Monto de Venta',
        data: data["suma"]
    }]
});


    }
</script>