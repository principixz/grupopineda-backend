<link rel="stylesheet" type="text/css" href="<?php echo base_url() ?>public/snackbar.css">

<script type="text/javascript" src="<?php echo base_url() ?>public/snackbar.min.js"></script>

<!--<div class="row" style="background-image: url('public/fondo_cocina_1.jpg');" id="cargar_fondo">-->
  <div class="row" style="background-image: url('public/abstract-flower-white-texture-background-vector.jpg');" id="cargar_fondo">
  <div class="col-md-12" style="display: flex;align-items: flex-end;
  justify-content: flex-end;"><button
  
   onclick="full()">
    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrows-fullscreen" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M5.828 10.172a.5.5 0 0 0-.707 0l-4.096 4.096V11.5a.5.5 0 0 0-1 0v3.975a.5.5 0 0 0 .5.5H4.5a.5.5 0 0 0 0-1H1.732l4.096-4.096a.5.5 0 0 0 0-.707zm4.344 0a.5.5 0 0 1 .707 0l4.096 4.096V11.5a.5.5 0 1 1 1 0v3.975a.5.5 0 0 1-.5.5H11.5a.5.5 0 0 1 0-1h2.768l-4.096-4.096a.5.5 0 0 1 0-.707zm0-4.344a.5.5 0 0 0 .707 0l4.096-4.096V4.5a.5.5 0 1 0 1 0V.525a.5.5 0 0 0-.5-.5H11.5a.5.5 0 0 0 0 1h2.768l-4.096 4.096a.5.5 0 0 0 0 .707zm-4.344 0a.5.5 0 0 1-.707 0L1.025 1.732V4.5a.5.5 0 0 1-1 0V.525a.5.5 0 0 1 .5-.5H4.5a.5.5 0 0 1 0 1H1.732l4.096 4.096a.5.5 0 0 1 0 .707z"/>
</svg>
  </button></div>
  <div class="col-md-12">
	<ul class="cuerpo_pedido_cocina" style="width: 100%; height: 700px; overflow: auto !important;overflow-x: hidden!important;" id="cuerpo_pedido">	
	</ul>
    <div id="no_pedido">
	</div>
	</div>
</div>


 <script type="text/javascript">


  var elem =  document.getElementById("cargar_fondo");
  function openFullscreen() {
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.webkitRequestFullscreen) { /* Safari */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE11 */
    elem.msRequestFullscreen();
  }
}

function closeFullscreen() {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.webkitExitFullscreen) { /* Safari */
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) { /* IE11 */
    document.msExitFullscreen();
  }
}


var es=1; 
function full()
{
  if(es==1)
  {
   openFullscreen();
    es=2;
  }else{
    closeFullscreen();
    es=1;
  }
}
    
      var refreshIntervalId;
function sonido()
{
  
   var audio = new Audio(base_url+"/public/timbre_recepcion.mp3");

                audio.play();
}

$(function(){
//sonido(); 
ver();

});

refreshIntervalId=setInterval(function(){
 ver() ;

}, 2500);

  function ver()
  {

  
    $.post(base_url+"Cocina/generar_ventas",function(data){
            
             $('input[name="numero_venta[]"]').map(function () {
               //alert($(this).val());
               var id=$(this).val();
                 valor=0;
                   for (var i=0; i < data.length; i++) {
                   
                    if(parseInt(id)==parseInt(data[i]["venta_idventas"])){

                     valor=1;
                    }
                }

                   if(valor==0)
              {
                   $("#nota_"+id).hide( "slow" );
                 $("#nota_"+id).remove();
              }

            }).get();



      for (var i=0; i < data.length; i++) 
      {
                                   
                                  



            

              if($("#nota_"+data[i]["venta_idventas"]).text()!=""){ 

                          //$("#nota_"+data[i]["venta_idventas"]).show( "slow" );
                        tiempo=data[i]["venta_pedidofecha"];
                        tiem= moment(tiempo, "YYYY-MM-DDTHH:mm:ss").fromNow();
                        $("#tiempo_"+data[i]["venta_idventas"]).text("("+tiem+")");
                         html1="";
                        for (var j=0; j < data[i]["lista"].length; j++) {

                            descripcion="";
                         if(data[i]["lista"][j]["descripcion"]!="")
                         {
                           descripcion="("+data[i]["lista"][j]["descripcion"]+")<br>";

                         }
                    html1+='<p style="font-size:11px !important;">'+
                    '<label style=" background-color:'+data[i]["lista"][j]["producto_color_cocina"]+' !important;font-weight:bold;">'+data[i]["lista"][j]["producto_descripcion"]+'</label><br>'+
                    'Cantidad: <b  style="font-weight:bold;color:black;">'+data[i]["lista"][j]["cantidad"]+'</b><br> '+descripcion+'---------------------------------------</p>';
                    }

                    $("#nota_cuerpo_"+data[i]["venta_idventas"]).empty().append(html1);

              }else{


                sonido(); 
                           html='';
                  if(parseInt(data[i]["mesa_id"])==1)
                    {
                                      mesa_nombre="Delivery";
                    }
                  else{
                    nombre_mesa="";
                    if(parseInt(data[i]["mesa_tipo"])==0)
                    {
                        nombre_mesa="Mesa";
                    }
                   else{
                      nombre_mesa="LLevar";
                   }
                    mesa_nombre=nombre_mesa+"-"+data[i]["mesa_numero"]+data[i]["mesas_agrupas"]+"("+data[i]["lugar"]+")";
                    
                  }


                  html+='<li  id="nota_'+data[i]["venta_idventas"]+'">';
                  html+='<input type="hidden" name="numero_venta[]" id="numero_venta[]" value="'+data[i]["venta_idventas"]+'">';
                      html+='<a ondblclick="preparar('+data[i]["venta_idventas"]+')">'
                      html+='<label style="font-size:13px;font-weight: bold;">'+mesa_nombre+' </label><label style="font-size:10px;" id="tiempo_'+data[i]["venta_idventas"]+'"> </label>';
                        
                      if(data[i]["nombre_delivery"]!=""){
           html+='<label style="font-size:12px;font-weight:bold;text-transform: uppercase;">'+data[i]["nombre_delivery"]+'</label><br>';
                      }

                        html+='<div id="nota_cuerpo_'+data[i]["venta_idventas"]+'">';

                       for (var j=0; j < data[i]["lista"].length; j++) {

                         descripcion="";
                         if(data[i]["lista"][j]["descripcion"]!="")
                         {
                           descripcion="("+data[i]["lista"][j]["descripcion"]+")<br>";

                         }



                    html+='<p style="font-size:11px !important;">'+
                    '<label style=" background-color:'+data[i]["lista"][j]["producto_color_cocina"]+' !important;font-weight:bold;">'+data[i]["lista"][j]["producto_descripcion"]+'</label><br>'+
                    'Cantidad: <b  style="font-weight:bold;color:black;">'+data[i]["lista"][j]["cantidad"]+'</b><br> '+descripcion+'---------------------------------------</p>';
                    }
                      
                        html+='</div>';

                     html+='</a>';
                   html+='</li>';

                   $("#cuerpo_pedido").append(html);
                           
              }




     }
    },"json");


  }

  function preparar(id)
{
  

   $("#nota_"+id).hide( "slow" );

   $.post(base_url+"Cocina/actividad_venta",{"id":id},function(data){
        if(parseFloat(data)==1){

        }else{
            $("#nota_"+id).show( "slow" );
            generar_notificacion("Error","Se produjo un error","error","#fec107");
        }
   });
   

   Snackbar.show({
    text: 'Se Preparo Correctamente',
    pos: 'bottom-center',
    actionText: 'Deshacer',
    duration:10000, 
    onActionClick: function(element) { 
       //Set opacity of element to 0 to close Snackbar 

      $("#nota_"+id).show( "slow" );

      $.post(base_url+"Cocina/deshacer_preparar",{"id":id},function(data){
            if(parseFloat(data)==1){

            }else{
                $("#nota_"+id).show( "slow" );
                generar_notificacion("Error","Se produjo un error","error","#fec107");
            }
       });
   

   }


  }); 

  
}
  </script>

<style type="text/css">
label{
  margin-bottom: 0px !important;
}

p {
    margin-top: 0 !important;
    margin-bottom: 0rem !important;
}
.col-md-12> h2,p{
 
  font-weight:normal;
}
.col-md-12>  ul,li{
  list-style:none;
}
.col-md-12>  ul{
  overflow:hidden;
  padding:3em;
}
.col-md-12> ul li a{
  text-decoration:none;
  background:#ffc;
  display:block;
  min-height: 20em !important;
  width:14em !important;
  padding:1em;
  -moz-box-shadow:5px 5px 7px rgba(33,33,33,1);
  -webkit-box-shadow: 5px 5px 7px rgba(33,33,33,.7);
  box-shadow: 5px 5px 7px rgba(33,33,33,.7);
  -moz-transition:-moz-transform .15s linear;
  -o-transition:-o-transform .15s linear;
  -webkit-transition:-webkit-transform .15s linear;
  cursor: pointer;
}
.col-md-12>  ul li{
  margin:1em;
  /*float:left;*/
  display:inline-flex;

}
.col-md-12>  ul li h2{
  font-size:140%;
  font-weight:bold;
  padding-bottom:0px;
}
.col-md-12>  ul li p{
  font-family:"Reenie Beanie",arial,sans-serif;
  font-size:180%;
}
.col-md-12> ul li a{
  -webkit-transform: rotate(-6deg);
  -o-transform: rotate(-6deg);
  -moz-transform:rotate(-6deg);
}
.col-md-12> ul li:nth-child(even) a{
  -o-transform:rotate(4deg);
  -webkit-transform:rotate(4deg);
  -moz-transform:rotate(4deg);
  position:relative;
  top:5px;
  background:#cfc;
}
.col-md-12> ul li:nth-child(3n) a{
  -o-transform:rotate(-3deg);
  -webkit-transform:rotate(-3deg);
  -moz-transform:rotate(-3deg);
  position:relative;
  top:-5px;
  background:#ccf;
}
.col-md-12> ul li:nth-child(5n) a{
  -o-transform:rotate(5deg);
  -webkit-transform:rotate(5deg);
  -moz-transform:rotate(5deg);
  position:relative;
  top:-10px;
}

.col-md-12> ul li a:hover{
  box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -moz-box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);
  -webkit-transform: scale(1.25);
  -moz-transform: scale(1.25);
  -o-transform: scale(1.25);
  position:relative;
  z-index:5;
}
/*.col-md-12> ul li a:hover,ul li a:focus{
  box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -moz-box-shadow:10px 10px 7px rgba(0,0,0,.7);
  -webkit-box-shadow: 10px 10px 7px rgba(0,0,0,.7);
  -webkit-transform: scale(1.25);
  -moz-transform: scale(1.25);
  -o-transform: scale(1.25);
  position:relative;
  z-index:5;
}*/
.col-md-12> ol{text-align:center;}
.col-md-12> ol li{display:inline;padding-right:1em;}
.col-md-12> ol li a{color:#fff;}

#cuerpo_pedido::-webkit-scrollbar {
    width: 5px;
}
 
#cuerpo_pedido::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
}
 
#cuerpo_pedido::-webkit-scrollbar-thumb {
  background-color: black;
  outline: 1px solid slategrey;
}
  </style>



