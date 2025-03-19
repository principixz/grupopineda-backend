
<html>
    <head>
        <meta charset="utf8">
        <title>Estilos de impresión</title>
        <style type="text/css">
            
*{
    margin:0px 0;
}
body{
    margin: 0px 0px 0px 0px;
    font: 9pt 'Lucida Console';
    color: #000000;
  
    width: 280px;

}
#titulo {
      font-weight: 700;
    text-align: center;
}
#ruc-serie {
        font-weight: 700;

}
#cabecera {
    font-weight: 700;
    text-decoration: underline;
    width: 100%;

}
#totales{

    text-align: right;
    margin-right: 16px;
}
#body{

    /*border-bottom:1px dashed black;*/
}
body { print-color-adjust: exact; }


#factuur, #factuur * { 
  -webkit-print-color-adjust: exact;
  color-adjust: exact;
}




.title {
    /*font-weight: bold;*/
    font-family: Arial, sans-serif;
    text-align: center;
}


        </style>
     <script src="<?php echo base_url(); ?>public1/lib/bower_components/jquery/dist/jquery.min.js"></script>
<link rel="stylesheet" media="print" href="<?php echo base_url(); ?>/public/css/styleprint.css" />
        <script type="text/javascript">
            $(document).ready(function(){
              var imprimir=$("#imprimir").val();
              if(imprimir=='S')
                {
                    
                   setTimeout(function()
                    {
                         window.print();
                      window.close();
                    }, 1000);
                }else
                {
                    window.close();
                }
               // window.print();
            });
        </script>

    </head>

    <body>
    
        <input type="hidden" id="imprimir" name="imprimir" value="S"/>
        <div id="contenedor">
    <div id="titulo">
        <center><img width="160px" height="130px" src="<?php echo $empresa[0]['empresa_icono']?>"></center>
        <br><br>
        <p><?php   echo strtoupper($empresa[0]["empresa_razon_social"]); ?></p>
        <p></p>
        <p><?php echo $empresa[0]["empresa_direccion"]; ?></p>
        <p>RUC: <?php echo $empresa[0]["empresa_ruc"]; ?></p>
       
        <!--<p><?php echo $sede[0]["sede_direccion"]; ?></p>-->


    </div>

        <br/>
    <div id="datos">
  
        <?php
          $tipo=$venta[0]["ventas_idtipodocumento"];
          $estado_pago = $venta[0]["venta_estado_pagado"];
          $mostra="0";
          if ($estado_pago == 2) {
            $mostra="NOTA DE CREDITO: ".$venta[0]["venta_serie_eliminado"]."-".$venta[0]["venta_correlativo_eliminado"];
          }else{
          if($tipo==6){
          $mostra="NOTA DE VENTA ".$venta[0]["venta_num_serie"]."-".$venta[0]["venta_num_documento"];
        }else{
          if ($tipo==1) {
            $mostra="FACTURA ELECTRONICA: ".$venta[0]["venta_num_serie"]."-".$venta[0]["venta_num_documento"];
          }
          if($tipo==2){
            $mostra="BOLETA ELECTRONICA: ".$venta[0]["venta_num_serie"]."-".$venta[0]["venta_num_documento"];
          }
          if($tipo==5){
            $mostra="TICKET: T".$venta[0]["venta_num_serie"]."-".$venta[0]["venta_num_documento"];
          }
        }
        }



         ?>
        <p>&nbsp;&nbsp;<?php echo $mostra; ?></p>
        <p>&nbsp;&nbsp;SERIE: FFCF287063</p>
        <p>&nbsp;&nbsp;AUTORIZACION: 0183845134239</p>
        <p style="border-top:1px solid #000;"></p><br>
        <p>&nbsp;&nbsp;CLIENTE: <?php echo $cliente[0]["cliente_nombres"]; ?></p>
                  

              <?php if(strlen($cliente[0]["cliente_dni"])==8){ ?>
                <p>&nbsp;&nbsp;DNI: <?php echo $cliente[0]["cliente_dni"]; ?></p>
                  <?php } ?>
                    
                          <?php if(strlen($cliente[0]["cliente_dni"])==11){ ?>
                <p>&nbsp;&nbsp;RUC: <?php echo $cliente[0]["cliente_dni"]; ?></p>
                  <?php } ?> 


                <p>&nbsp;&nbsp;DIRECCION:<?php echo $cliente[0]["cliente_direccion"]; ?></p>
        <p>&nbsp;&nbsp;TELEFONO: <?php echo $cliente[0]["cliente_celular"]; ?></p>
   <p>&nbsp;&nbsp;FORMA DE PAGO: <?php echo $venta[0]["for_descripcion"]; ?></p>

    </div>
    <br/>
    <div id="ruc-serie">
        <p>&nbsp;&nbsp;DESCRIPCION</p>
    </div>
    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;CANT &nbsp;&nbsp;&nbsp;&nbsp;U.M. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UNIT.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOTAL</p>
    </div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <div id="datos">
        <?php  
         $c=1;
         $total_venta=0;
         $arti=0;

    if($venta[0]["venta_estado_consumo"]==0)
    {

        foreach($detalle_venta as $value){
               $total=$value["cantidad"]*$value["precio"];
                 $total_venta+=$total;
                 $arti++;
          ?>                                     
        <p>&nbsp;&nbsp;<?php echo $value["producto_descripcion"] ?></p>
        <p>&nbsp;&nbsp;<?php echo $value["cantidad"];?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UND &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($value["precio"], 2, ',', ' '); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($total, 2, ',', ' '); ?>&nbsp;</p>
             <?php $c=$c+1; }


    }else
    {?>

  <p>POR CONSUMO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo number_format($venta[0]["venta_monto_sinigv"], 2, ',', ' ');?></p>

    <?php }

             $total_venta+=(float)($venta[0]["venta_monto_delivery"]);
              ?>           
      
<?php if((float)($venta[0]["venta_id_delivery"])!=0){ 
     //echo "<br><p>Pago por Delivery :".$venta[0]["venta_monto_delivery"]."</p>";

 } ?>



                            </div>
    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <br/>
    <div id="totales" style="margin-right: 3px;">
        <p style="float:left;width: 65%;">SUB TOTAL</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;"><?php echo number_format($venta[0]["venta_monto_sinigv"], 2, ',', ' '); ?></p>
        <p style="clear: both"></p>
        <p style="float:left;width: 65%;">DESCUENTO</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;">0.00</p>
        <p style="clear: both"></p>
        <p style="float:left;width: 65%;">IGV </p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;"><?php echo number_format($venta[0]["venta_igv_monto"], 2, ',', ' '); ?></p>
        <p style="clear: both"></p>
        <p style="float:left;width: 65%;">**** TOTAL</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;"><?php echo number_format($total_venta, 2, ',', ' '); ?></p>
        <p style="clear: both"></p>
      </div>
    <br>
<?php 
$tan="";
$tam=strlen($flotante);
if($tam==1){
   $tan="0".$flotante."/100  SOLES"; 
}else{
  $tan=$flotante."/100  SOLES"; 

}




?>

    <p style="width: 100%;border-top: 1px solid #000;padding: .6em 0 .6em 0;text-align: left">
        &nbsp;SON: <?php echo $letras." con ".$tan ?>    
    </p>
    <p style="width: 100%;border-top: 1px solid #000;"></p>
    <div id="totales" style="margin-right: 3px;">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p style="float:left;width: 65%;">**** EFECTIVO</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;"><?php echo number_format($venta[0]["venta_monto_entregado"], 2, '.', ''); 
             $vuelto=0;
             $vuelto=abs($total_venta-$venta[0]["venta_monto_entregado"]);

        ?> </p>
        <p style="clear: both"></p>
        <p style="float:left;width: 65%;">**** VUELTO</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 20%;"><?php  echo number_format( $vuelto, 2, '.', '');   ?></p>
        <p style="clear: both"></p>
            </div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <div  id="datos">
        <?php
           $fecha_pedido = explode(" ", $venta[0]["venta_pedidofecha"]);
           $fecha_venta = explode(" ", $venta[0]["venta_fecha_pago"]);

             $fecha2 = date_create($fecha_venta[0]);

  $tiemponuevo1=date_format($fecha2, 'd/m/Y');
          

         ?>
        <p>&nbsp;&nbsp;NUM. TOTAL ART. VENDIDOS = <?php echo $arti; ?></p>
      <!--  <p>IGV (0.0%):&nbsp;&nbsp;S/ 0.00</p>-->
        <p>&nbsp;&nbsp;FECHA: <?php echo $tiemponuevo1;?>&nbsp;&nbsp; HORA: <?php echo $fecha_venta[1];  ?></p>
        <p>&nbsp;&nbsp;HORA DE PEDIDO: <?php echo $fecha_pedido[1]?></p>
        <p>&nbsp;&nbsp;VENDEDOR:<?php echo $vendedor[0]["empleado_nombres"]; ?></p>



        <?php
        $nombre="";

              $nombre=$venta[0]["mesa_numero"];
           if($venta[0]["mesa_id"]!="1"){
                  $te="";
              if($venta[0]["mesa_tipo"]=="0") {$te="MESA ";}
              else{ $te="LLEVAR ";}
               
             
         ?>
        <P>&nbsp;&nbsp;MESA:  <?php echo $te." ".$nombre; ?></p>

             <?php }else{ ?>
  <P>&nbsp;&nbsp;MESA: DELIVERY</p>

             <?php } ?>

<?php if(count($delivery)>0){?>


<p>&nbsp;&nbsp;NOMBRE DELIVERY:<?php echo $delivery[0]["nombre"]; ?></p>
<p>&nbsp;&nbsp;CELULAR DELIVERY:<?php echo $delivery[0]["numero_celular"]; ?></p>
<p>&nbsp;&nbsp;DIRECCIÓN DELIVERY:<?php echo $delivery[0]["direccion"]; ?></p>

<?php } ?>



            </div>
</div>
<?php if($tipo!=6){ ?>
<center id="">
  
  <img  style="margin-left: 45px;width: 150px;height: 150px;" src="data:image/png;base64,<?php echo $venta[0]["venta_qr"];?>" >

</center>
<center id="">
  <label>Para consultar el comprobante ingresar http://facturacion.selvafood.com/buscar</label>
</center>

<?php } ?>



    </body>
</html>
