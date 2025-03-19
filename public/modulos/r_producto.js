$(function() {
	// body...

	//alert();
});

function mostrar_precio()
{
    var producto_id=$("#producto_id").val();
    if(producto_id!=""){
   $.post(base_url+"R_producto/mostrar_precio",{"producto_id":producto_id},function(data){
       var html="";
     for (var i = 0; i < data.length; i++) {
     
        html+="<tr>";
        html+="<td>"+data[i]["unidad_medida_descripcion"]+"X"+data[i]["detalle_unidad_producto_factor"]+"</td>";
        html+="<td>"+data[i]["precio_unitario_producto_descripcion"]+"</td>";
        html+="<td>"+data[i]["precio_unitario_producto_valor"]+"</td>";
        html+="<td>"+data[i]["precio_unitario_producto_utilidad"]+"</td>";
        html+="<td>"+data[i]["precio_unitario_producto_descuento"]+"</td>";
        html+='<td>';
     if(parseFloat(data[i]["precio_unitario_producto_fijo"])==0){
         html+='<button onclick="eliminar_precio_equivalencia('+data[i]["precio_unitario_producto_id"]+')" type="button" class="btn btn-danger btn-xs"><i class="mdi mdi-delete"></i></button> ';
           }


        html+='<button onclick="vista_precio_equivalencia('+data[i]["precio_unitario_producto_id"]+')" type="button" class="btn btn-success btn-xs"><i class="mdi mdi-eye"></i></button>';
         html+='</td>';


        html+="</tr>";

     }
 
        $("#tabla_precio_unidad").empty().append(html);

   },"json");
}
}

function traer_stock()
{ 
    var producto_id=$("#producto_id").val();
      if(producto_id!=""){
            

            $.post(base_url+"R_producto/mostrar_stock",{"producto_id":producto_id},function(data){
             for (var i = 0; i < data.length; i++) {
               $("#cantidad_almacen"+data[i]["detalle_almacen"]).val(data[i]["detalle_stock"]);
               $("#no_contabilidad"+data[i]["detalle_almacen"]).val(data[i]["detalle_stock_temporal"]);

             }

            },"json");
      }

}
 
function guardar_datos()
{
  $("#boton_guardar_datos").text("Guardando...");
  $("#boton_guardar_datos").attr("disabled",true);
  if($("#descripcion").val()==""){
     $("#boton_guardar_datos").text("Aceptar");
  $("#boton_guardar_datos").attr("disabled",false);
    alert("ingresar descripcion del producto");
     return false;
  }
   if($("#moneda").val()==""){
     $("#boton_guardar_datos").text("Aceptar");
  $("#boton_guardar_datos").attr("disabled",false);
    alert("ingresar el precio");
     return false;
  }
 guardar_producto();

}