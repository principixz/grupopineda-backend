
<html>
    <head>
        <meta charset="utf8">
        <title>Estilos de impresión</title>
   
        <link href="/restaurantes/css/print.css" rel="stylesheet" type="text/css" >
        <style type="text/css">
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
        <script src="/restaurantes/js/jquery.min.js" type="text/javascript"></script>
     <script src="<?php echo base_url(); ?>public/lib/bower_components/jquery/dist/jquery.min.js"></script>

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
      
     


    </div>

        <br/>
    <div id="datos">  
        <?php $fecha=$sesion_caja[0]->fecha_apertura;
              //$ingresoventas = $tiventas[0]["monto_ingresoventas"] ;
              //$ingresoconcepto= $ticonceptos[0]["monto_ingresoconceptos"]; ;
              //$egresoventas =$tecompras[0]["monto_egresacompras"] ;
              //$egresoconcepto= $teconceptos[0]["monto_egresosconceptos"];
             $saldocaja = ($ingresos+$ingresosc+$deliverytotal) + ($egresos+$egresosc); 

    $ingresovirtual = 0;
        $ingresofisico = 0;
        $egresofisico = 0;
        $egresovirtual = 0;
        $totalfisico = 0;
        $totalvirtual = 0;
        ?>
        <?php   
      foreach($montocaja as $valores){
        if ($valores["tipo"] == 1) {
                  if ($valores["id_tipo_movimiento"] == 1) { // ingreso
                    if ($valores["mov_formapago"] == 1) {
                      $ingresofisico = $ingresofisico + $valores["monto"];
                    }else{
                      $ingresovirtual = $ingresovirtual + $valores["monto"];
                    }
        }else{ // egreso
          if ($valores["mov_formapago"] == 1) {
            $egresofisico = $egresofisico + $valores["monto"];
          }else{
            $egresovirtual = $egresovirtual + $valores["monto"];
          }
        }
      }else{
        if ($valores["mov_formapago"] == 1) {
            $aperturafisica = $valores["monto"];
          }else{
            $aperturavirtual =  $valores["monto"];
          }
      }
    }

    ?>

        <p>&nbsp;&nbsp;Arqueo de Caja</p>
        <p>&nbsp;&nbsp;FECHA: <?php echo $fecha;?></p>
        <p style="border-top:1px solid #000;"></p><br>
        <p>&nbsp;&nbsp;INGRESO VIRTUAL: <?php echo number_format($ingresovirtual,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;INGRESO FÍSICO: <?php echo number_format($ingresofisico,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;EGRESO VIRTUAL: <?php echo number_format($egresovirtual,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;EGRESO FÍSICO: <?php echo number_format($egresofisico,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;APERTURA VIRTUAL : <?php echo number_format($aperturavirtual,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;APERTURA FÍSICO: <?php echo number_format($aperturafisica,2, ',',''); ?></p>
       <!-- <p>&nbsp;&nbsp;DELIVERY COBROS: <?php echo number_format($deliverytotal,2, ',',''); ?></p> -->
        <?php   $totalfisico = $ingresofisico - $egresofisico + $aperturafisica  ;  
        $totalvirtual = $ingresovirtual - $egresovirtual + $aperturavirtual;?>

        <p style="border-top:1px solid #000;"></p><br>
        <p>&nbsp;&nbsp;SALDO FÍSICO: <?php echo number_format($totalfisico,2, ',',''); ?></p>
        <p>&nbsp;&nbsp;SALDO VIRTUAL: <?php echo number_format($totalvirtual,2, ',',''); ?></p>
        <?php   
    $dat=intval($totalfisico); 
    $fl=$totalfisico-$dat;
    $flotante=(string)(round($fl*100));
    $letras= NumeroALetras::convertir($dat);
         ?>

    </div>
    <br/>
    <div id="ruc-serie">
        <p>&nbsp;&nbsp;DESCRIPCION</p>
    </div>
    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;CANT &nbsp;&nbsp;&nbsp;U.M. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UNIT.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOTAL</p>
    </div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <div id="datos">
        <?php  
         $c=1;
         $total_venta=0;
         $arti=0;
         $data["otros"] = array(); 
         foreach ($traermovimientos  as $key => $value) {   
          if ($value['venta_idventas'] != '') { 
            $data["venta"]["categoria"][$key] = $value["categoria"];
            $data["venta"][$value["categoria"]][$key]["producto"] = $value["producto_descripcion"];
            $data["venta"][$value["categoria"]][$key]["cantidad"] = $value["cantidad"];
            $data["venta"][$value["categoria"]][$key]["precio"] = $value["precio"];
            $data["venta"][$value["categoria"]][$key]["total"] = $value["total"];
            $data["venta"][$value["categoria"]][$key]["unidadmedida"] = $value["unidadmedida"];
            $data["venta"][$value["categoria"]][$key]["estado_descuento"] = $value["estado_descuento"]; 
            $data["venta"][$value["categoria"]][$key]["formapago"] = $value["formapago"];
            $data["venta"][$value["categoria"]][$key]["tipomov"] = $value["tipomov"];
          }else{   
            $data["otros"][$key]["producto"] = $value["producto_descripcion"];
            $data["otros"][$key]["cantidad"] = $value["cantidad"];
            $data["otros"][$key]["precio"] = $value["precio"];
            $data["otros"][$key]["total"] = $value["total"];
            $data["otros"][$key]["unidadmedida"] = $value["unidadmedida"];
            $data["otros"][$key]["estado_descuento"] = $value["estado_descuento"]; 
            $data["otros"][$key]["formapago"] = $value["formapago"]; 
            $data["otros"][$key]["tipomov"] = $value["tipomov"]; 
          }
          

        }   
        if (isset($data["venta"])) {
          $ventas = array_unique($data["venta"]["categoria"]);
        }else{
          $ventas = array();
        }
          $contador = 0;
        foreach ($ventas as $key1 => $categorias) { ?>
<div id="ruc-serie">
        <p>&nbsp;&nbsp;<?php echo strtoupper($categorias) ?></p>
    </div>
        <?php    foreach ($data["venta"][$categorias]  as $key => $value) {
          
                switch ($value["estado_descuento"]) {

            case 'SD':
            $estadodes = '';
            break;
            case 'DC':
            $estadodes = '(Cortesia)';
            break;
            case 'DP':
            $estadodes = '(Descuento)';
            break;
            case 'DS':
            $estadodes = '(Descuento)';
            break; 
            default:
            $estadodes = '';
            break;
          } 
            $contador = $contador + $value["cantidad"];
              $total=$value["total"];
              $total_venta+=$total;
              $arti++;
          ?>                                     
        <p>&nbsp;&nbsp;<?php echo $c."-".strtoupper($value["producto"].' '.$estadodes.'' )?></p>
        <p>&nbsp;&nbsp;<?php echo $value["cantidad"];?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UND &nbsp;&nbsp;&nbsp;<?php echo number_format($value["precio"], 2, ',', ''); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($value["total"], 2, ',', ''); ?>&nbsp;</p>
        <?php $c=$c+1; 
         }} ?>

      <?php   
        $c=1;
         $total_venta=0;
         $arti=0;
        if (count($data["otros"])) { ?>
<div id="ruc-serie">
        <p>&nbsp;&nbsp;<?php echo strtoupper('VENTAS/COMPRAS/MOVIMIENTOS/OTROS') ?></p>
    </div>
       <?php } 
        foreach ($data["otros"]   as $key => $value) { ?>
		<p>&nbsp;&nbsp;<?php echo $c."-".strtoupper($value["producto"] )?></p>
        <p>&nbsp;&nbsp;<?php echo $value["cantidad"];?>&nbsp;&nbsp;&nbsp;UND &nbsp;&nbsp;&nbsp;<?php echo number_format($value["precio"], 2, ',', ''); ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($value["total"], 2, ',', ''); ?>&nbsp;</p>
        <?php }  ?>
        <?php  
         $c=1;
         $total_venta=0;
         $arti=0;
        foreach($consulta_delivery as $value){
 
          ?>                                     
        <p><?php echo $c."-".strtoupper($value["descripcion"]).' '.$estadodes.'' ?></p>
        <p>1&nbsp;&nbsp;&nbsp;&nbsp;UND&nbsp;&nbsp;<?php echo number_format($value["venta_monto_delivery"], 2, ',', ''); ?>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($value["venta_monto_delivery"], 2, ',', ''); ?>&nbsp;</p>
        <?php $c=$c+1; } ?>
      

      
                            </div>





    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <br/>
 
    <div id="totales" style="margin-right: 3px;">
        <p style="clear: both"></p>
        <p style="float:left;width: 29%;">T. FÍSICO</p>
        <p style="float:left;width: 25%;">S/</p>
        <p style="float:left;width: 20%;"><?php echo number_format($totalfisico,2, ',',''); ?></p>
        <p style="clear: both"></p>
      </div>
    <div id="totales" style="margin-right: 3px;">
        <p style="clear: both"></p>
        <p style="float:left;width: 32%;">T. VIRTUAL</p>
        <p style="float:left;width: 22%;">S/</p>
        <p style="float:left;width: 18%;"><?php echo number_format($totalvirtual,2, ',',''); ?></p>
        <p style="clear: both"></p>
      </div>
        <div id="totales" style="margin-right: 3px;">
        <p style="clear: both"></p>
        <p style="float:left;width: 34%;">T. VENDIDOS</p>
        <p style="float:left;width: 20%;">&nbsp;&nbsp;&nbsp;</p>
        <p style="float:left;width: 18%;"><?php echo number_format($contador,2, ',',''); ?></p>
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
     &nbsp;&nbsp;   SON: <?php echo $letras." con &nbsp;&nbsp;&nbsp;".$tan ?>    
    </p>
  
</div>


    </body>
</html>