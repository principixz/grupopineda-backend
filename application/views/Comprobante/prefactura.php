
<html>
    <head>
        <meta charset="utf8">
        <title>Estilos de impresión</title>
        <style type="text/css">
            /*body{
   margin: 5px 0px 0px 50px;
   font: 10pt 'Lucida Console';
   color: #000000;
   background-color: #ffffff;
   width: 320px;
   line-height: 3px;
}
#titulo {
    width: 280px;
    font-weight: bold;
    text-align: center;
}
#ruc-serie {
    font-weight: bold;
}
#cabecera {
    font-weight: bold;
    text-decoration: underline;
}
#totales{
    width: 280px;
    text-align: right;
}

@page{
   margin: 0;
}*/

*{
    margin:0px 0;
}
body{
    margin: 0px 0px 0px 0px;
    font: 9pt 'Lucida Console';
    color: #000000;
    background-color: #ffffff;
    width: 280px;

}
#titulo {
    font-weight: bold;
    text-align: center;
}
#ruc-serie {
    font-weight: bold;
}
#cabecera {
    font-weight: bold;
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

@page{
    margin: 0;
}
.title {
    /*font-weight: bold;*/
    text-align: center;
}
        </style>
     <script src="<?php echo base_url(); ?>public1/lib/bower_components/jquery/dist/jquery.min.js"></script>

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
   
        <br><br>
        <p><?php   echo strtoupper($empresa[0]["empresa_razon_social"]); ?></p>
        <p></p>
        <p><?php echo $empresa[0]["empresa_direccion"]; ?></p>
        <p>RUC: <?php echo $empresa[0]["empresa_ruc"]; ?></p>
       
        <!--<p><?php echo $sede[0]["sede_direccion"]; ?></p>-->


    </div>

        <br/>

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
               $total=$value["cant_total"]*$value["precio"];
                 $total_venta+=$total;
                 $arti++;
          ?>                                     
        <p>&nbsp;&nbsp;<?php echo $c."-".$value["producto_descripcion"] ?></p>
        <p>&nbsp;&nbsp;<?php echo $value["cant_total"];?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UND &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($value["precio"], 2, ',', ' '); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($total, 2, ',', ' '); ?>&nbsp;</p>
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
        
        <p style="clear: both"></p>
        <p style="float:left;width: 45%;">**** TOTAL</p>
        <p style="float:left;width: 11%;">&nbsp;&nbsp;S/&nbsp;</p>
        <p style="float:left;width: 25%;"><?php echo number_format($total_venta, 2, ',', ' '); ?></p>
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
       
            </div>
    <p></p>
    <div  id="datos">
        <?php
           $fecha_pedido = explode(" ", $venta[0]["venta_pedidofecha"]);
           $fecha_venta = explode(" ", $venta[0]["venta_fecha_pago"]);

             $fecha2 = date_create($fecha_venta[0]);

  $tiemponuevo1=date_format($fecha2, 'd/m/Y');
          

         ?>
        <p>&nbsp;&nbsp;NUM. TOTAL ART. VENDIDOS = <?php echo $arti; ?></p>
      



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


<?php } ?>



 <p style="width: 100%;border-top: 1px solid #000;padding: .6em 0 .6em 0;text-align: left">
  RUC:
 <p style="width: 100%;border-top: 1px solid #000;padding: .6em 0 .6em 0;text-align: left">
 FORMA DE PAGO:
 <p style="width: 100%;border-top: 1px solid #000;padding: .6em 0 .6em 0;text-align: left">


            </div>
</div>
<center id="">

</center>

    </body>
</html>
