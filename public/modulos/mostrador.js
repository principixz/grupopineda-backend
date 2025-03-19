$(function() {
	// body...
	//alert();

//alert();

});

function mostrar_modal_nuevo_cliente()
{

  $("#nuevo_cliente").modal();
}

function crear_direccion_cliente()
{
   let valor_cliente=$("#idcliente").val();
   if(valor_cliente!="")
   {
    //alert(valor_cliente);return false;
 let arrar_datos=valor_cliente.split("/");
/// alert(arrar_datos[2].toUpperCase());
 $("#modal_nombre_direccion").text(arrar_datos[2].toUpperCase());
 $("#id_cliente_direccion").val(arrar_datos[0]);

  $("#modal_direccion_cliente").modal();
   }else{


            generar_notificacion("Error","Ingresa un cliente primero","error","");
   }
 
}

function guardar_direccion_cliente()
{

    $("#btn_guardar_direccion_cliente").text("Guardando...");
    $("#btn_guardar_direccion_cliente").attr("disabled",true);
    $.post(base_url+"Pedido/guardar_cliente_direccion",$("#formulario_direccion_cliente").serialize(),function(data){
        //  alert(data["estado"]);
      if(data["estado"])
      {
        generar_notificacion("Se guardo correctamente","La dirección se guardado correctamente","success","");

             $("#direccion_id").val(data["direccion_id"]);
           $("#direccion_descripcion").val(data["direccion_descripcion"]);
           $("#formulario_direccion_cliente")[0].reset();
      }else{
        generar_notificacion("Error","Se genero un error al eliminar","error","");

      }
      $("#modal_direccion_cliente").modal("hide");
      $("#btn_guardar_direccion_cliente").text("Guardar");
      $("#btn_guardar_direccion_cliente").attr("disabled",false);
    },"json");

    return false;
}
function limpiar_informacion()
{
	//alert();
//alert();""
  if($("#ntelefono").val()==""){
  		$("#nombre").val("");
        $("#direccion").val("");
        $("#dnidelivery").val("");
        $("#idcliente").val("");
  }
       

}

$("#ntelefono").change(function(){
	if($(this).val()=="")
	{
		limpiar();
	}
});

$("#ntelefono").keyup(function(){
	alert();
	if($(this).val()=="")
	{
		limpiar();
	}
});

function sololetras(e){
    key= e.keyCode || e.which;
    teclado=String.fromCharCode(key).toLowerCase();
    letras=" abcdefghijklmnñopqrstuvwxyz";
    especiales="8-37-38-46-164";
    teclado_especial=false;
    for(var i in especiales){
      if(key==especiales[i]){
        teclado_especial= true;
        break;
      }
    }
    if (letras.indexOf(teclado)==-1 && !teclado_especial){

      return false;

    }
  }


  function solonumeros(e){
    key=e.keyCode || e.which;
    teclado=String.fromCharCode(key);
    numeros=" 0123456789";
    especiales="8-37-38-46";
    teclado_especial=false;

    for(var i in especiales){
      if(key==especiales[i]){
        teclado_especial=true;
      }
    }
    if(numeros.indexOf(teclado)==-1 && !teclado_especial){
      return false;
    }
  }


  function cargar_direccion_nueva()
{
 let valor_cliente=$("#cliente").val();
// alert(valor_cliente);
 let arrar_datos=valor_cliente.split("/");
 $("#direccion_id1").val(arrar_datos[3]);
 $("#direccion_descripcio").val(arrar_datos[4]);

}
