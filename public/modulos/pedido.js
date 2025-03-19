$( function() {
  //alert();
    
 $("#direccion_descripcion").autocomplete({

      source: function( request, response ) {
         let valor_cliente=$("#cliente").val();
        // alert(valor_cliente);
         let arrar_datos=valor_cliente.split("/");
        $.ajax( {
          url: base_url+"pedido/mostrar_direccion_cliente",
          dataType: "json",
          data: {
            term: request.term,
            cliente:arrar_datos[0]
          },
          success: function( data ) {
            response( data );
          }
        } );
      },
      clearButton: true,
      minLength:0,
      select: function( event, ui ) {
        //console.log( "Selected: " + ui.item.value + " aka " + ui.item.id );
        //alert(ui.item.id);
         $("#direccion_id").val(ui.item.id);
      }
    } );
  } );


function cargar_informacion_sunat()
{
   let tipo_documento_id=$("#tipo_documento_id").val();
   let num=$("#ruc").val();
   if(tipo_documento_id=="1")
   {

    fetch('https://api.selvafood.com/api/consultaruc/10752705866', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body:{}

          }).then(res => res.json())
    .then(data => console.log(data.json));

   }else{

   }


}

 function generar_venta()
    {
      estado_impresion=0;
      if($("#comprobante_imprimir").prop("checked"))
      {
        estado_impresion=1;
      }

      if( $('#igv').prop('checked'))
      {
        impuesto= parseFloat($("#igv").val());   
      }
      else
      {
        impuesto=0;
      }


      $("#monto_venta").val($("#total_pagar_modal").text());
      $.post(base_url+"Pedido/procesar_venta",
        $("#formulario_pago").serialize(),function(data){
          
      if(parseInt(data["estado"])!=2){
        if( estado_impresion==0) { 
          var url=base_url+"Ventas/mostrar_comprobante/"+$("#id_modal_venta").val();
          var a = document.createElement("a");
          a.target = "_blank";
          a.href = url;
          a.click(); 
        }
        generar_notificacion("EXCELENTE",data["texto"],"success","")
        $("#submit-sale").attr("disabled",false);
        $("#submit-sale").text("Guardar"); 
        $("#cobrar_modal").modal("hide");
        $("#panel"+$("#id_modal_venta").val()).hide();
        $("#panel"+$("#id_modal_venta").val()).remove();
      
/*
        $.post(base_url+"Pedido/facturar_electronica_venta",{"id_venta":$("#id_modal_venta").val()},function(data){

          //alert(data);
        if(data["status"])
          {
                       generar_notificacion("EXCELENTE",data["mensaje"],"info","") ;  
          }

                     
        },"json");*/
          $("#id_modal_venta").val("");
        limpiar();
      }
      else{
        generar_notificacion("ERROR",data["texto"],"error","");
        $("#submit-sale").attr("disabled",false);
        $("#submit-sale").text("COBRAR"); 
      }
    },"json");
    }





function crear_direccion_cliente()
{
   let valor_cliente=$("#cliente").val();
// alert(valor_cliente);
 let arrar_datos=valor_cliente.split("/");
/// alert(arrar_datos[2].toUpperCase());
 $("#modal_nombre_direccion").text(arrar_datos[2].toUpperCase());
 $("#id_cliente_direccion").val(arrar_datos[0]);

  $("#modal_direccion_cliente").modal();
}



function cargar_direccion()
{
 let valor_cliente=$("#cliente").val();
// alert(valor_cliente);
 let arrar_datos=valor_cliente.split("/");
 $("#direccion_id").val(arrar_datos[3]);
 $("#direccion_descripcion").val(arrar_datos[4]);

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