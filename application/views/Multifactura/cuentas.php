<!-- <?php print_r($cuentas);exit ?> -->
<style type="text/css">
  [data-title] {
  outline: red dotted 1px; /*optional styling*/
  font-size: 30px; /*optional styling*/
  
  position: relative;
  cursor: help;
}

[data-title]:hover::before {
  content: attr(data-title);
  position: absolute;
  bottom: -26px;
  display: inline-block;
  padding: 3px 6px;
  border-radius: 2px;
  background: #000;
  color: #fff;
  font-size: 12px;
  font-family: sans-serif;
  white-space: nowrap;
}
[data-title]:hover::after {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 8px;
  display: inline-block;
  color: #fff;
  border: 8px solid transparent;  
  border-bottom: 8px solid #000;
}
</style>
<div style="position: relative;">
<?php $h = 20 * $cuentas["total"] ;?>
<table width="100%" style="border-bottom: solid 2px #CCC;"   cellspacing="0" class="nombre_<?php echo $nombr_cuenta;  ?>">
                              <tr>
                                  <td colspan="6" >
                                      <table class="tb_cabecera<?php echo $nombr_cuenta;  ?> tb_general" width="100px" style="width: 16%;float:left;height: <?php echo $h ?>" cellspacing="0">
                                          
                                          <tr>
                                              <td align="center">
                                                  <span style="font-size: xx-large;" class="span-cuentas"<?php echo $nombr_cuenta;  ?>></span>
                          
                                                  <span class="p-cont" style="font-size: 14px;margin-left: 4px;">1</span>
                                                  <input type="hidden" value=" <?php echo $nombr_cuenta;  ?>" name="input_cuenta[]" id="input_cuenta[]">
                                                  <br>               
                                                  <?php if ($cuentas["estado"] == 1){  ?>
                                                    $es = '';
                                                    $dd='none'
                                                  <?php }else{ ?>
                                                    $es = 'disabled';
                                                    $dd='block'
                                                  <?php  } ?>
                                                    <p id="mensaje_<?php echo $nombr_cuenta;  ?>" style="font-size: 11px;font-weight: 700;text-align: center;background: rgb(42, 213, 110);width: 91px;margin-top: -5px; left: 35%;top: 60%;display: <?php echo $dd ?>">La cuenta ya fue Cancelada</p>
                                              </td>
                                          </tr>
                                      </table>
                                      <table width="83%" class="<?php echo $nombr_cuenta;  ?>" style="float:right;border-left: 2px solid #ccc;" index="<?php echo $nombr_cuenta;  ?>" cellspacing="0">
                                          <tr>
                                              <td style="width: 13%;"></td>
                                                <td style="width:35%;"></td>
                                                <td style="width:15%"></td>
                                                <td style="width: 20%"></td>
                                                <td style="width:10%"></td>
                                          </tr>
                                          <tbody class="productos_vta_cuentas_tbody<?php echo $nombr_cuenta;  ?>">
                                            <?php $totalc = 0 ?>           
                                            <?php for ($i=0; $i < count($_POST["cuentas"]) ; $i++) { ?>                                
                                               <?php if ($_POST["cuentas"][$i]["normal"] =='S' ){ 
                                                $t = $_POST["cuentas"][$i]['precio'] * $_POST["cuentas"][$i]['cantidad'];
                                                $cant=$_POST["cuentas"][$i]['cantidad'];
                                                }else{
                                                  $t = ($_POST["cuentas"][$i]['precio'] * $_POST["cuentas"][$i]['cantidad']*$cliente)/100;
                                                  $cant=($_POST["cuentas"][$i]['cantidad']*$_POST["cuentas"][$i])/100;
                                                }
                                                $totalc = $totalc + $t
                                                ?>

                                                <tr>
                                                    <td class="p-cantidad_cuenta" style="text-align: center;">
                                                      '.sprintf("%.2f",$cant).'
                                                    </td>
                                                    <td class="p-descripcion_cuenta" style="text-align: left;">
                          <input type="hidden" name="id_temp_<?php echo $nombr_cuenta;  ?>[]" id="id_temp<?php echo $nombr_cuenta;  ?>"
                          value="{$cc['id_temp']}" class='id_temp_cuenta'/>
                                                        <input type='hidden' name='codigo_producto_cuenta<?php echo $nombr_cuenta;  ?>[]' id='codigo_producto_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['codigo_producto']}" class='codigo_producto_cuenta'>
                                                                                                    
                                                        <input type='hidden' name='descripcion_cuenta<?php echo $nombr_cuenta;  ?>[]' id='descripcion_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['descripcion']}" class='descripcion_cuenta'>
                                                        <input type='hidden' name='precio_min_cuenta_<?php echo $nombr_cuenta;  ?>[]' id='precio_min_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['precio_min']}"  class='precio_min_cuenta' >
                                                        <input type='hidden' name='cantidad_cuenta_<?php echo $nombr_cuenta;  ?>[]' id='cantidad_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cant|string_format:'%.2f'}"class='cantidad_cuenta' >
                                                        <input type='hidden' name='precio_cuenta_<?php echo $nombr_cuenta;  ?>[]' id='precio_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['precio']}" class='precio_cuenta'>
                                                        <input type='hidden' name='importe_cuenta<?php echo $nombr_cuenta;  ?>[]' id='importe_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$t|string_format:'%.2f'}" class='importe_cuenta'>
                                                        <input type='hidden' name='obs_cuenta<?php echo $nombr_cuenta;  ?>[]' id='obs_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['obs']}" class='obs_cuenta'>
                                                        <input type='hidden' name='estado_pedido_cuenta<?php echo $nombr_cuenta;  ?>[]' id='estado_pedido_cuenta<?php echo $nombr_cuenta;  ?>[]' value="{$cc['estado_pedido']}" class='estado_pedido_cuenta'>
                                                        <input type='hidden' name='agrupado_cuenta_<?php echo $nombr_cuenta;  ?>[]' id='agrupado_cuenta<?php echo $nombr_cuenta;  ?>[]'  value="{$cc['agrupado']}" class="agrupado_cuenta">
                                                        <input type='hidden' name='id_detalle_producto_<?php echo $nombr_cuenta;  ?>[]' id='id_detalle_producto<?php echo $nombr_cuenta;  ?>[]'  value="{$cc['id_detalle_producto']}" class="id_detalle_producto_cuenta">
                                                        {$cc['descripcion']}</td>
                                                    <td style="text-align: right;">{$cc['precio']}</td>
                                                    <td class="p-precio_cuenta" style="text-align: right;">{$t|string_format:"%.2f"}</td>

                                                    <td style="text-align: center;" ><a    href="#" class="delete"><img src="{$HOST}images/delete_otro.png" /></a></td>
                                                 </tr>
                                                <?php } ?>
                                            </tbody> 
                                             <tr style="font-weight: 700;color: red;" >
                                                 <td colspan="2" style="text-align: right;" >Total S/&nbsp;&nbsp;</td>
                                                 <td class="td_tt_x_cuenta" style="text-align: right;">{$totalc|string_format:"%.2f"}</td>
                                                <td><input type="hidden" id="tt_x_cuenta_<?php echo $nombr_cuenta;  ?>" name="tt_x_cuenta<?php echo $nombr_cuenta;  ?>" class="tt_x_cuenta" value="{$totalc|string_format:'%.2f'}"></td>
                                             </tr>
                                             <tr>
                                                 <td colspan="3" align="right">
                                                     <button class="btn_guardar_cuentas" index="<?php echo $nombr_cuenta;  ?> <?php echo $es ?>">guardar</button>
                                                   </td>
                                             </tr>
                                      </table>
                                  </td>
                              </tr> 
</table>

<div class="fblock" id="fblock_<?php echo $nombr_cuenta;  ?>"  style="display: {$dd}"></div>
 </div>

   