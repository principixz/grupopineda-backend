
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
    
        <script type="text/javascript">

           function load()
            {
          setTimeout(function()
                    {
                         window.print();
                      window.close();
                    }, 1000);

            }
          /*  $(document).ready(function(){
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
            });*/
        </script>
    </head>

    <body onload="  load()">


<?php 


 $aperturafisica = 0;
        $aperturavirtual = 0;

$total_efectivo=0;
        
      foreach($montocaja as $valores){
        if ($valores["tipo"] == 1) {
            
      }else{
        if ($valores["mov_formapago"] == 1) {
            $aperturafisica = $valores["monto"];
          }else{
            $aperturavirtual =  $valores["monto"];
          }
      }
    }


    $total_efectivo=$aperturafisica +$aperturafisica ;











?>












    
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
      <?php $fecha=$sesion_caja[0]->fecha_apertura; ?>

        <p>&nbsp;&nbsp;Arqueo de Caja</p>
        <p>&nbsp;&nbsp;FECHA:<?php echo  $fecha; ?> </p>
            <p>&nbsp;&nbsp;CAJERO:<?php echo  $empleado; ?> </p>
        <p style="border-top:1px solid #000;"></p><br>
      
 

    </div>
    <br/>

    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;CONCEPTO &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ING.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EGRE.</p>
    </div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <div id="datos">

<style type="text/css">
    .descripcion{
       
        position: relative;
           display:inline-table;
    }
    .descripcion_tabla{
         width: 135px;
         margin-left: 10px;
white-space: normal;
    }
    .ingreso_tabla{
        width: 60px;
        white-space: normal;
        text-transform: uppercase;
    }
    .egreso_tabla{
        width: 60px;
        white-space: normal;
        text-transform: uppercase;
    }
    .dentro{
       margin-top: 10px;
        margin-bottom: 10px;       
        display:block !importante;
        text-transform: uppercase;

    }
</style>


   <div  class="dentro">
<div class="descripcion descripcion_tabla" >
    <label style="font-weight: bold;">APERTURA DE CAJA</label>
</div>
<div class="descripcion ingreso_tabla">
<label  style="font-weight: bold;"><?php echo  number_format($aperturafisica+$aperturavirtual, 2, '.', '');  ?></label>
</div>
<div class="descripcion egreso_tabla">
<label style="font-weight: bold;">0.00</label>
</div>
</div>  


<?php 
$total_ingreso=0;
$total_egreso=0;





?>
<?php foreach($carga_movimiento["movimiento"] as $key => $value){
 
$estilo="";



if((int)$value["tipo"]==1)
{

   $estilo="font-weight: bold;font-size:12px"; 

   $total_ingreso=$total_ingreso+(double)$value["ingreso"]; 
$total_egreso= $total_egreso+(double)$value["egreso"]; ;;
}

 ?>

<?php /*print_r();*/?>
<div  class="dentro">
<div class="descripcion descripcion_tabla">
    <label style="<?php echo $estilo; ?>"><?php echo $value["descripcion"]; ?></label>
</div>
<div class="descripcion ingreso_tabla">
<label style="<?php echo $estilo; ?>"><?php echo $value["ingreso"]; ?></label>
</div>
<div class="descripcion egreso_tabla">
<label style="<?php echo $estilo; ?>"><?php echo $value["egreso"]; ?></label>
</div>
</div>       
      
<?php } ?>
      
                            </div>





    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
   


<?php foreach($movimiento_informacion["movimiento"] as $key => $value){
 
$estilo="";



if((int)$value["tipo"]==3)
{

   $estilo="font-weight: bold;font-size:12px"; 

  // $total_ingreso=$total_ingreso+(double)$value["ingreso"]; 
//$total_egreso= $total_egreso+(double)$value["egreso"]; ;;
}

 ?>

<?php /*print_r();*/?>
<div  class="dentro">
<div class="descripcion descripcion_tabla">
    <label style="<?php echo $estilo; ?>"><?php echo $value["descripcion"]; ?></label>
</div>
<div class="descripcion ingreso_tabla">
<label style="<?php echo $estilo; ?>"><?php echo $value["ingreso"]; ?></label>
</div>
<div class="descripcion egreso_tabla">
<label style="<?php echo $estilo; ?>"><?php echo $value["egreso"]; ?></label>
</div>
</div>       
      
<?php } ?>






<div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
















   <div  class="dentro">
<div class="descripcion descripcion_tabla" >
    <label style="font-weight: bold;">TOTALES</label>
</div>
<div class="descripcion ingreso_tabla">
<label  style="font-weight: bold;"><?php echo  number_format($total_ingreso, 2, '.', '');  ?></label>
</div>
<div class="descripcion egreso_tabla">
<label style="font-weight: bold;"><?php echo number_format($total_egreso, 2, '.', '') ;?></label>
</div>
</div>  
  


    <div id="cabecera" style="border-bottom:1px solid #000;text-decoration: none;">
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    
  <div  class="dentro">
<div class="descripcion descripcion_tabla" >
    <label style="font-weight: bold;">Monto Cierre Efectivo</label>
</div>
<div class="descripcion ingreso_tabla">
<label  style="font-weight: bold;">S/. </label>
</div>
<div class="descripcion egreso_tabla">
<label style="font-weight: bold;"><?php echo number_format($aperturafisica+$aperturavirtual+$total_ingreso-$total_egreso, 2, '.', '') ;?></label>
</div>
</div>  
 
  
</div>


    </body>
</html>