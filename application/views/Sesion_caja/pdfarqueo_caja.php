<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Arqueo Caja</title>
</head>
<style type="text/css">
.clearfix:after {
  content: "";
  display: table;
  clear: both;
}

a {
  color: #5D6975;
  text-decoration: underline;
}

body {
  position: relative;
  width: 21cm;  
  height: 29.7cm; 
  margin: 0 auto; 
  color: #001028;
  background: #FFFFFF; 
  font-family: Arial, sans-serif; 
  font-size: 12px; 
  font-family: Arial;
}

header {
  padding: 10px 0;
  margin-bottom: 30px;
}

#logo {
  text-align: center;
  margin-bottom: 10px;
}

#logo img {
  width: 90px;
}

h1 {
  border-top: 1px solid  #5D6975;
  border-bottom: 1px solid  #5D6975;
  color: #5D6975;
  font-size: 2.4em;
  line-height: 1.4em;
  font-weight: normal;
  text-align: center;
  margin: 0 0 20px 0;
  background: url(dimension.png);
}

#project {
  float: left;
}

#project span {
  color: #5D6975;
  text-align: right;
  width: 52px;
  margin-right: 10px;
  display: inline-block;
  font-size: 0.8em;
}

#company {
  float: right;
  text-align: right;
}

#project div,
#company div {
  white-space: nowrap;        
}

table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  margin-bottom: 20px;
}

table tr:nth-child(2n-1) td {
  background: #F5F5F5;
}

table th,
table td {
  text-align: center;
}

table th {
  padding: 5px 20px;
  color: #5D6975;
  border-bottom: 1px solid #C1CED9;
  white-space: nowrap;        
  font-weight: normal;
}

table .service,
table .desc {
  text-align: left;
}

table td {
  padding: 20px;
  text-align: right;
}

table td.service,
table td.desc {
  vertical-align: top;
}

table td.unit,
table td.qty,
table td.total {
  font-size: 1.2em;
}

table td.grand {
  border-top: 1px solid #5D6975;;
}

#notices .notice {
  color: #5D6975;
  font-size: 1.2em;
}

footer {
  color: #5D6975;
  width: 100%;
  height: 30px;
  position: absolute;
  bottom: 0;
  border-top: 1px solid #C1CED9;
  padding: 8px 0;
  text-align: center;
}
</style>
<body>
  <?php $fecha=date("Y/m/d h:i:s");
              //$ingresoventas = $tiventas[0]["monto_ingresoventas"] ;
              //$ingresoconcepto= $ticonceptos[0]["monto_ingresoconceptos"]; ;
              //$egresoventas =$tecompras[0]["monto_egresacompras"] ;
              //$egresoconcepto= $teconceptos[0]["monto_egresosconceptos"];
  $saldocaja = ($ingresos+$ingresosc+$deliverytotal) + ($egresos+$egresosc); 

  $dat=intval($saldocaja); 
  $fl=$saldocaja-$dat;
  $flotante=(string)(round($fl*100));
  $letras= NumeroALetras::convertir($dat);
          $ingresovirtual = 0;
        $ingresofisico = 0;
        $egresofisico = 0;
        $egresovirtual = 0;
        $totalfisico = 0;
        $totalvirtual = 0;
  ?>
  <header class="clearfix">
    <div id="logo">
      <img src="<?php echo $empresa[0]['empresa_icono']?>" style="width: 100px;height: 100px">
    </div>
    <h1>ARQUEO DE CAJA DIARIA</h1>
    <div id="company" class="clearfix">
      <div>Cajero Encargado</div>
      <div> <?php echo $empleado;?> <br /></div>
      <div>Fecha Apertura</div>
      <div> <?php echo $sesion_caja[0]->fecha_apertura;?> <br /></div>
    </div>
<!--     <div id="project">
      <div><span>INGRESO VENTAS     :</span> <?php echo  number_format($ingresos,2, ',','');?></div>
      <div><span>INGRESO CONCEPTOS  :</span> <?php echo  number_format($egresos,2, ',','');?></div>
      <div><span>EGRESO COMPRAS     :</span> <?php echo  number_format($ingresosc,2, ',','');?></div>
      <div><span>EGRESO CONCEPTOS   :</span> <?php echo  number_format($egresosc,2, ',','');?></div>
      <div><span>DELIVERY COBROS    :</span><?php echo  number_format($deliverytotal,2, ',','') ?></div>

      <div id="notices">
        <div><span>TOTAL</span> <?php echo number_format($saldocaja,2, ',','');?> </div>
      </div>
    </div> -->
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
    <div id="project">
      <div><span>INGRESO VIRTUAL     :</span> <?php echo  number_format($ingresovirtual,2, ',','');?></div>
      <div><span>INGRESO FÍSICO  :</span> <?php echo  number_format($ingresofisico,2, ',','');?></div>
      <div><span>EGRESO VIRTUAL     :</span> <?php echo  number_format($egresovirtual,2, ',','');?></div>
      <div><span>EGRESO FÍSICO   :</span> <?php echo  number_format($egresofisico,2, ',','');?></div>
      <div><span>APERTURA VIRTUAL     :</span> <?php echo  number_format($aperturavirtual,2, ',','');?></div>
      <div><span>APERTURA FÍSICO   :</span> <?php echo  number_format($aperturafisica,2, ',','');?></div>
      <!--<div><span>DELIVERY COBROS    :</span><?php echo  number_format($deliverytotal,2, ',','') ?></div>-->
        <?php   $totalfisico = $ingresofisico - $egresofisico + $aperturafisica;
        //+ $deliverytotal;  
        $totalvirtual = $ingresovirtual - $egresovirtual + $aperturavirtual;?>
      <div id="notices">
        <div><span>TOTAL FISICO</span> <?php echo number_format($totalfisico,2, ',','');?> </div>
        <div><span>TOTAL VIRTUAL</span> <?php echo number_format($totalvirtual,2, ',','');?> </div>
      </div>
    </div>
  </header>
  <main>
    <table>
      <thead>
        <tr>
          <th class="desc">DESCRICCIÓN</th>
          <th class="service">CANT.</th>            
          <th>U.M</th>
          <th>P.UNI</th>
          <th>TOTAL</th>
        </tr>
      </thead>

      <tbody>
        <?php  
        $c=1;
        $total_venta=0;
        $total_venta+=0;
        $arti=0;
        $idventaan = $traermovimientos[0]["venta_idventas"]; 
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

        foreach ($ventas as $key1 => $categorias) {   ?>  
        <tr>
          <td class="service"><h3><?php echo strtoupper($categorias) ?></h3></td>
          <td class="desc"></td>
          <td class="unit"></td>
          <td class="unit"></td>
          <td class="total"></td>
        </tr> 
        <?php foreach ($data["venta"][$categorias]  as $key => $value) {
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
          ?>  
          <tr>
            <td class="service"><?php echo ($key+1)."-".strtoupper($value["producto"]).' '.$estadodes.''; ?></td>
            <td class="desc"><?php echo $value["cantidad"];?></td>
            <td class="unit">UND</td>
            <td class="unit"><?php echo number_format($value["precio"], 2, ',', ''); ?></td>
            <td class="total"><?php echo number_format($value["total"], 2, ',', ''); ?></td>
          </tr>
          <?php }  
        }  ?> 
<?php   if (count($data["otros"])) { ?>
         <tr>
          <td class="service"><h3><?php echo strtoupper('VENTAS/COMPRAS/MOVIMIENTOS/OTROS') ?></h3></td>
          <td class="desc"></td>
          <td class="unit"></td>
          <td class="unit"></td>
          <td class="total"></td>
        </tr> 
<?php } ?>

        <?php   foreach ($data["otros"]   as $key => $value) {
          $estadodes = '';
          ?>  
          <tr>
            <td class="service"><?php echo ($key+1)."-".strtoupper($value["producto"]).' '.$estadodes.''; ?></td>
            <td class="desc"><?php echo $value["cantidad"];?></td>
            <td class="unit">UND</td>
            <td class="unit"><?php echo number_format($value["precio"], 2, ',', ''); ?></td>
            <td class="total"><?php echo number_format($value["total"], 2, ',', ''); ?></td>
          </tr>
          <?php } ?>


          <?php   foreach($consulta_delivery as $valores){ ?>
          <tr>
            <td class="service"><?php echo $c."-".strtoupper($valores["descripcion"]); ?></td>
            <td class="desc">1</td>
            <td class="unit">UND</td>
            <td class="unit"><?php echo number_format($valores["venta_monto_delivery"]); ?></td>
            <td class="total"><?php echo  number_format($valores["venta_monto_delivery"]); ?></td>
          </tr>
          <?php   $c++;} ?>

        </tbody>
      </table>







  </main>
  <footer>
    Relación de todo los movimientos realizados
  </footer>
</body>
</html>

