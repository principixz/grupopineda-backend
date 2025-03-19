<script type="text/javascript">
  $('#borrar99').remove();
</script>
<link href="/restaurante/public/js/style.css" rel="stylesheet" type="text/css">
<link href="/restaurante/public/css/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<?php 
$token="";
if(count($data["empresa"])>0)
{
 // $token=$data["empresa"][0]["empresa_culqi_publico"]; 
}
?>
<style>
.navigation1.active {
  opacity: 1;
  visibility: visible;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

.navigation1 {
  position: fixed;
  width: 260px;
  height: 335px;
  top: 485px;
  overflow-y: auto;
  overflow-x: hidden;
  opacity: 0;
  visibility: hidden;
  z-index: 99;
  -webkit-transition-delay: 300ms;
  transition-delay: 300ms;
  /* left: 0; */
  right: 52px;
}
.claseproducto{
  width:auto;
  height:auto;
  padding:20px;
  -webkit-box-orient: vertical;
  display: -webkit-box;
  font-family: sans-serif;
  -webkit-line-clamp: 3;
  overflow: hidden;
  text-overflow: ellipsis; 

}
.claseproducto:hover {
  width: auto;
  height: auto;
  display: block /* Fallback for non-WebKit */;
  white-space: initial;
  overflow:visible;
  cursor: pointer;
}
.btn-calculadora{
  background: #0fc5bb;
  border: solid 1px #0fc5bb;
}
.boton_calculadora {
  position: fixed;
  right: 10px;
  bottom: 88px;
  z-index: 1031;
}

#contenedorcalculadora{
  width:80%;
  height:auto;
  margin:4px auto;
}
#calculadora{
  width: 234px;
  height: 230px;
  padding:2px;
  background-color: #65D277;
}
.input-valor{
  margin:8px auto;
  width:95%;
  height:30px;
  font-size: 16px;
  overflow:hidden;
  text-align: right;
  color:#48484D;
  padding: 4px;
  background-color:#fff;
  box-shadow: inset -1px -1px 4px 1px #eee;
}
.key li{
  width:50px;
  height:30px;
  border-radius:3px;
  color:#fff;
  background-color:#6C73FA;
  cursor:pointer;
  float:left;
  margin: 0px -3px 5px 8px;
  line-height: 30px;
  text-align: center;
  box-shadow: 0px 3px 1px 0px #444651;
}
.key li:hover{
  background-color: #BEF9F0;
  color: #6C73FA;
  transition:0.2s;
}
.key li:active{
  box-shadow: 0px 1px 1px 0px #444651;
}
.verificar{
  width: 93.4% !important;
}

</style>

<?php include("ventascss.php"); ?>
<div id="tabs" class="tabs">
  <div class="navbar-fixed-top1" >
    <nav id="navegadorflotante">
      <ul>
        <li><a href="#section-1"><i class="zmdi zmdi-shopping-cart"><span>&nbsp;Productos</span></i></a></li>
        <li><a href="#section-2"><i class="zmdi zmdi-equalizer"><span>&nbsp;Detalle</span></i></a></li>
      </ul>
    </nav>
  </div> 
  <div id="contentenido" class="content">
    <section id="section-1">
      <div class="col-md-12">
        <div class="contents" id="" style="height: none;">
          <div id="scroll_div1" class="scroll"></div>
          <div id="scroll_div2" style="display: block;overflow-y: scroll;height: 500px;"></div>                 
        </div>
      </div>
    </section>
    <section id="section-2">
      <div class="row">
        <form id="formulario_venta">
          <div class="col-xs-12 col-md-9" id="pos">
            <input type="hidden" name="id_perfil" id="id_perfil" value="<?php echo $_COOKIE["usuario_perfil"]; ?>">
            <input type="hidden" name="id_usuario" id="id_usuario" value="<?php echo $_COOKIE["usuario_id"]; ?>">
            <input type="hidden" name="nombre_mozo" id="nombre_mozo" value="<?php echo $_COOKIE["usuario_nombre"]; ?>">
            <input type="hidden" name="estado_venta" id="estado_venta" value="0">
            <input type="hidden" name="productos_vendidos" id="productos_vendidos" value="0">
            <input type="hidden" name="productos_por_vender" id="productos_por_vender" value="0">
            <?php if(isset($data["data_actualizar"])){ ?> 
            <input type="hidden" name="idventa" id="idventa" value="<?php echo $data["data_actualizar"][0];  ?>">  
            <input type="hidden" name="idvendedor" id="idvendedor" value="<?php echo $data["data_actualizar"][1];  ?>">  
            <?php } ?> 
            <div class="well well-sm" id="leftdiv">
              <div id="printhead" class="print">
                <?php $dias = array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sábado");
                $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"); ?>
                <p>FECHA: <?php echo  $dias[date('w')]." ".date('d')." de ".$meses[date('n')-1]. " del ".date('Y'); ?></p>
              </div>
              <div id="print" class="fixed-table-container">
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 250px;">
                  <div id="list-table-div" style="overflow: hidden; width: auto; height: 255px;">
                    <input type="hidden" name="idsilla" id="idsilla" value="<?php if(isset($data['data_envio'][0])){echo $data['data_envio'][0];}  ?>">
                    <input type="hidden" name="estadoubicacion" id="estadoubicacion" value="">
                    <input type="hidden" name="identificador" id="identificador" value="">
                    <table id="posTable" class="table table-striped table-condensed table-hover list-table" style="margin:0px;" data-height="100">
                      <thead>
                        <tr class="success">
                          <th style="width: 30%;"><span id="prod">PRODUCTO</span></th>
                          <th style="width: 15%;text-align:center;"><span id="pre">Precio</span></th>
                          <th style="width: 15%;text-align:center;"><span id="cant">Cant.</span></th>
                          <th style="width: 20%;text-align:right;padding-right: 0px;"><span id="subt">Subtotal</span></th>
                          <th style="width: 20%;text-align:center;" class="satu"><i class="fa fa-trash-o"></i></th>
                        </tr>
                      </thead>
                    </table>
                    <div id="cuerpo" style=" height: 190px !important;
                    overflow: auto !important;
                    overflow-x:hidden!important;">
                    <table class="table table-striped table-condensed table-hover list-table" style="margin:0px;" data-height="100">
                      <tbody id="cuerpo_venta" >

                      </tbody>
                      <tbody id="cuerpotraidos" >
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div id="totaldiv">
                <table id="totaltbl" class="table table-condensed totals" style="margin-bottom:10px;">
                  <tbody>
                    <tr class="info">
                      <td width="25%"  style="font: oblique bold 120% cursive;color: black;" >Cant.</td>
                      <td class="text-right" style="color: black;font-family: fantasy;"><span id="count">0 (0)</span></td>
                      <td width="25%"  style="color: black;font: oblique bold 120% cursive;" >Total</td>
                      <td class="text-right" style="color: black;font-family: fantasy;" colspan="2"><span id="total">0.00</span></td>
                    </tr>
                    <?php if ($_COOKIE["usuario_perfil"] == 5) { ?>
                    <tr class="info">
                      <td style="color: black;font: oblique bold 120% cursive;" width="25%"><a href="#" id="add_discount">Descuento</a></td>
                      <td style="color: black;font-family: fantasy;" class="text-right" ><span id="ds_con">(0.00) 0.00</span></td>
                      <td style="color: black;" width="25%"><a href="#" id="add_tax"> </a> </td>
                      <td style="color: black;font-family: fantasy;" class="text-right"><span id="impuesto">0.00</span></td>
                    </tr>
                    <?php } ?>
                    <tr class="success">
                      <td  style="color: black;font: oblique bold 120% cursive;" colspan="2">
                        Total a pagar <a role="button" data-toggle="modal" data-target="#noteModal">
                          <i class="fa fa-comment"></i>
                        </a>
                      </td>
                      <input type="hidden" id="total_pagaroc" name="total_pagaroc" value="0.00">
                      <td style="color: black;font-family: fantasy;" class="text-right" colspan="2" style="font-weight:bold;"><span id="total_pagar">0.00</span></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div id="identrega" class="col-xs-12 col-md-9">
          <div class="form-group">
            <label>Seleccionar Tip. Entrega</label>
            <select class="form-control" id="perfil" name="perfil" onchange="tipoentrega(this.value)">
              <option value="">Seleccionar</option>
              <?php foreach ($data["tipo_entrega"] as $key => $value) {
                echo "<option value='".$value["tipoentrega_idtipoentrega"]."'>".$value["tipoentrega_descripcion"]."</option>";
              } ?>
            </select>
          </div>
          <div id="tipoentregad" class="col-md-12"></div>
        </div>

      </form>
    </div>
  </section>
  <div class="row flotante" id="flotante">
    <div class="form-group">
      <div id="botbuttons" class="col-xs-12 text-center">
        <div class="row">
          <?php if ($_COOKIE["usuario_perfil"] == 2){ ?>
          <div class="col-xs-3" style="padding: 0;">
            <button type="button" onclick="cancelar()"  class="btn btn-danger btn-block btn-flat payment" id="" style="height:35px;">Cancelar</button>
          </div>
          <div class="col-xs-3" style="padding: 0;">
            <button type="button" class="btn btn-warning btn-block btn-flat payment" onclick="generar_ventapedido()" id="payment" style="height:35px;">Procesar</button>
          </div>
          <div class="col-xs-6" style="padding: 0;">
            <input type="text" name="buscar_producto" autocomplete="off" id="buscar_producto" class="form-control" placeholder="Buscar producto">
          </div>    
          <?php }else {?> 
          <div class="col-xs-2" style="padding: 0;">
            <button type="button" onclick="cancelar()"  class="btn btn-danger btn-block btn-flat payment" id="" style="height:35px;">Cancelar</button>
          </div>
          <div class="col-xs-2" style="padding: 0;">
            <button type="button" class="btn btn-warning btn-block btn-flat payment" onclick="generar_ventapedido()" id="payment" style="height:35px;">Procesar</button>
          </div>     
          <div class="col-xs-2" style="padding: 0;">
            <button type="button" class="btn btn-success btn-block btn-flat payment" onclick="generar_pago()" id="payment" style="height:35px;">Pagar</button>
          </div>
          <div class="col-xs-6" style="padding: 0;">
            <input type="text" name="buscar_producto" autocomplete="off" id="buscar_producto" class="form-control" placeholder="Buscar producto">
          </div>
          <?php } ?> 
        </div>
      </div>          
    </div>
  </div>
</div><!-- /content -->
</div><!-- /tabs -->
<!-- <div id="ventanaflotante">
  <div id="nav" class="navigation">
    <div class="navigation__inner">
      <div> 
        <div onclick="traerproductos('');" class="categoriaproducto">
          <img src="<?php echo base_url();?>public/categorias/img_504591.png?>" alt="" class="categoriaproducto__photo" />
          <span  class="categoriaproducto_nombre">Todos</span>
        </div>
        <?php foreach ($data["categoriaproducto"] as $key => $value) { ?>
        <div onclick="traerproductos(<?php echo $value['categoria_producto_id'] ?>);" class="categoriaproducto">
          <?php $file = @fopen('public/categorias/'.$value['categoria_imagen'], "r"); 
 
          if (!$file) {
             $file = base_url().'public/categorias/img_504591.png';
          }else{
             $file = base_url().'public/categorias/'.$value['categoria_imagen'];
          }?>
          <img src="<?php echo $file?>" alt="" class="categoriaproducto__photo" />
          <span  style="line-height: 15px;font-size: 16px;"" class="categoriaproducto_nombre"><?php echo $value['categoria_producto_descripcion'] ?></span>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
  <div class="boton_categorias">
    <button id="show" class="btn btn-info btn-circle setting-panel-btn shadow-2dp abrir-cerrar"><i class="zmdi zmdi-view-dashboard"></i></button>
  </div>
</div> -->

<!-- <div id="ventanacalculadora">
  <div id="nav1" class="navigation1">
    <center>
      <div id="contenedorcalculadora">
        <header class="header">
          <hgroup> 
          </hgroup>
        </header>
        <section id="calculadora"> 
          <header class="top">
            <div class="input-valor"></div>
          </header>
          <ul class="key">
            <li>7</li>
            <li>8</li>
            <li>9</li>
            <li class="operador">/</li>
            <li>4</li>
            <li>5</li>
            <li>6</li>
            <li class="operador">*</li>
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li class="operador">-</li>
            <li>0</li>
            <li>.</li>
            <li class="operador">+</li>
            <li>c</li>
            <li class="verificar">=</li>
          </ul>
        </section>
      </div>
    </center>
  </div>
  <div class="boton_calculadora">
    <button id="show_calculadora" class="btn btn-calculadora btn-circle setting-panel-btn shadow-2dp abrir-cerrar"><i class="zmdi zmdi-keyboard"></i></button>
  </div>
</div> -->

<div class="modal fade" id="modalproducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>

<div id="traer_un_cliente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;"></div>
<div id="traer_ventas_modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;"></div>
 
<div class="modal fade" id="cobrar_modal"  role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " >
    <div class="modal-content"> 
      <div class="modal-header" style="    background-color: #008d4c!important;">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="payModalLabel" style="color:white;">
        PAGAR VENTA </h4>
      </div>
      <div class="modal-body" style="    background-color: #00a65a!important;">


        <form id="formulario_pago">
          <input type="hidden" name="id_modal_venta" id="id_modal_venta" value="">
          <input type="hidden" name="monto_venta" id="monto_venta" value="">
          <div class="row">
           <div class="col-xs-4">
            <div class="form-group">
              <label for="note" style="color:white;">Tipo de Comprobante </label> 
              <select id="tipo_comprabante" name="tipo_comprabante" class="form-control " tabindex="-1" aria-hidden="true">
                <?php
                foreach ($data["tipo_documento"] as $key => $value) {
                  echo "<option value='".$value["tipodoc_id"]."'>".$value["tipodoc_descripcion"]."</option>";
                } ?>
                <option value="0">SIN DOCUMENTO</option>
              </select>
            </div>
          </div>

          <div class="col-xs-4">
                             <div class="col-xs-4"><br> <label style="color:white;">IMPRESION POR CONSUMO</label></div>
                <div class="col-xs-4">
                  <br>
                  <input value="1" id="comprobante_detalle" name="comprobante_detalle" type="checkbox" data-size="small"  class="js-switch js-switch-1" data-color="#8BC34A"/>
                </div>
            </div>

          <div class="col-xs-4">
            <br>
            <h3 id="comprobante" style="color:#fff">Nº 001-1 </h3>
          </div>
        </div>








        <div class="row">
          <div class="col-xs-12">
            <div class="font16">
              <table class="table table-bordered table-condensed" style="margin-bottom: 0;">
                <tbody>
                  <tr>
                    <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black ;font-weight: bold;">Articulos totales</td>
                    <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;" class="text-right"><span id="item_count" style="color: black;">1</span></td>
                    <td width="25%" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Total a Pagar</td>
                    <td width="25%" class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="total_pagar_modal" style="color: black;">0.00 </span></td>
                  </tr>
                  <tr>
                    <td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Dinero Entrego</td>
                    <td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="total_paying" style="color: black;">3,163.65</span></td>
                    <td style=" border: 1px solid #00a65a;background: #FFF !important;color: black;font-weight: bold;">Vuelto</td>
                    <td class="text-right" style=" border: 1px solid #00a65a;background: #FFF !important;color: black;"><span id="balance" style="color: black;font-weight: bold;">0.00</span></td>
                  </tr>
                </tbody>
              </table>

            </div>

            <div class="row">
              <div class="col-xs-4">
                <div class="form-group">
                  <label for="amount" style="color:white;">Monto Entregado</label> <input  onkeyup="generar_vuelto()" name="dinero_entregado" type="number" id="dinero_entregado" class="pa form-control kb-pad amount ui-keyboard-input ui-widget-content ui-corner-all" aria-haspopup="true" role="textbox">
                </div>
              </div>

              <input name="fecha" id="fecha" value="<?php echo date('Y-m-d'); ?>" max="<?php echo date('Y-m-d'); ?>" class=" form-control " type="hidden" aria-haspopup="true" role="textbox">
              <div class="col-xs-4">
                <div class="form-group">
                  <label for="paid_by" style="color:white;">Tipo de Pago</label>
                  <select id="tipo_pago" name="tipo_pago" class="form-control " onchange="tipo_pago_mostrar()" tabindex="-1" aria-hidden="true">
                    <?php foreach ($data["tipopago"] as $key => $value) {
                      echo "<option value='".$value["tipo_pago_id"]."'>".$value["tipo_pago_descripcion"]."</option>";
                    } ?>

                  </select>
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label for="paid_by" style="color:white;">Forma de Pago</label>
                  <select id="forma_pago" name="forma_pago" class="form-control " tabindex="-1" aria-hidden="true">
                    <?php foreach ($data["formapago"] as $key => $value) {
                      echo "<option value='".$value["for_id"]."'>".$value["for_descripcion"]."</option>";
                    } ?>

                  </select>
                </div>
              </div>

            </div>

            <div class="row">
              <div class="col-xs-6">
                <div class="form-group">
                  <label style="color:white;">Seleccionar Cliente</label>
                  <select id="cliente" class="form-control" name="cliente" tabindex="-1" aria-hidden="true">
                    <option value="">Seleccionar Cliente</option>
                  </select>
                </div>
              </div>
              <div class="col-xs-1"><br>
                <button id="nuevo" class="btn btn-default btn-icon-anim btn-square" type="button"><i class="fa fa-pencil"></i></button>
              </div>  
              <div class="col-xs-1">
                <div class="form-group mb-30">
                 <label class="control-label mb-10 text-left" style="color:white;">IGV</label>
                 <div class="checkbox checkbox-primary">
                   <input onchange="chek_igv()" value="0.18" type="checkbox" class="form-control" name="igv" id="igv">
                   <label for="igv">                
                   </label>
                 </div>
               </div>
             </div>
             <div class="col-xs-4">
              <div class="form-group">
                <label for="note" style="color:white;">Nota de pago</label>
                <input type="text" name="note" id="note" class="form-control">
              </div>
            </div>
          </div>


          <div class="row">
            <div class="col-xs-2"> <label style="color:white;">Impresion Manual</label></div>
            <div class="col-xs-1">
              <input value="1" id="comprobante_imprimir" name="comprobante_imprimir" type="checkbox" data-size="small"  class="js-switch js-switch-1" data-color="#8BC34A"/>
            </div>
            <div class="row" id="credito">
              <div class="col-xs-4">
                <div class="form-group">
                  <label style="color:white;">Cuotas</label>
                  <input type="text" autocomplete="off" name="cuotas" id="cuotas" onkeyup="crear_cronograma()" class="form-control">
                </div>
              </div>
              <div class="col-xs-4">
                <div class="form-group">
                  <label style="color:white;">Intervalo de tiempo</label>     
                  <select class="form-control" id="intervalo" onchange="crear_cronograma()" name="intervalo" >
                   <option value="">Seleccionar</option>
                   <option value="1">Diario</option>
                   <option value="2">Semanal</option>
                   <option value="3">Quincenal</option>
                   <option value="4" >Mensual</option>
                 </select>   
               </div>
             </div>
             <div class="col-xs-12">
              <div id="cronograma"></div>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </form>


</div>

<div class="modal-footer" style="    background-color: #008d4c!important;">
  <button type="button" class="btn btn-default pull-left" data-dismiss="modal"> Cerrar </button>
  <button class="btn btn-success" id="submit-sale" onclick="cobrar_venta()">COBRAR</button>
</div>
</div>
</div>
</div>


<div id="nuevo_cliente" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h5 class="modal-title" id="myModalLabel">Agregar cliente</h5>
      </div>
      <div class="modal-body">

        <div class="tab-struct custom-tab-1 ">
          <ul role="tablist" class="nav nav-tabs" id="myTabs_7">
            <li class="active" role="presentation"><a aria-expanded="true" data-toggle="tab" role="tab" id="home_tab_7" href="#home_7">RUC</a></li>
            <li role="presentation" class=""><a data-toggle="tab" id="profile_tab_7" role="tab" href="#profile_7" aria-expanded="false">DNI</a></li>

          </ul>
          <div class="tab-content" id="myTabContent_7">

            <div id="home_7" class="tab-pane fade active in" role="tabpanel">
              <form id="formulario_empresa">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Razon Social</label>
                      <input type="text" autocomplete="off" name="nombre" id="nombre" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>RUC</label>
                      <input type="text" autocomplete="off" maxlength="11"  onkeypress="return solonumeros(event)" name="ruc" id="ruc" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Celular</label>
                      <input type="text" autocomplete="off" maxlength="9"  onkeypress="return solonumeros(event)" name="celular" id="celular" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Direccion</label>
                      <input type="text" autocomplete="off" name="direccion" id="direccion" class="form-control">
                    </div>
                  </div>
                </div>
              </form>
              <div class="row">
                <center><button id="guardar_empresa" class="btn btn-primary">Guardar</button></center>
              </div>
            </div>


            <div id="profile_7" class="tab-pane fade" role="tabpanel">
              <form id="formulario_cliente">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Nombre Completo</label>
                      <input type="text" autocomplete="off" name="nombre" id="nombre" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>DNI</label>
                      <input type="text" autocomplete="off" name="ruc" id="ruc" maxlength="8"  onkeypress="return solonumeros(event)"  class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Celular</label>
                      <input type="text" autocomplete="off" name="celular" maxlength="9"  onkeypress="return solonumeros(event)" id="celular" class="form-control">
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label>Direccion</label>
                      <input type="text" autocomplete="off" name="direccion" id="direccion" class="form-control">
                    </div>
                  </div>
                </div>
              </form>
              <div class="row">
                <center><button class="btn btn-primary" id="guardar_cliente">Guardar</button></center>
              </div>
            </div>

          </div>
        </div>


      </div>
      <div class="modal-footer">

      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<!-- milton-->
<div class="modal fade" id="stock_insuficiente_modal"  tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg " >
    <div class="modal-content"> 
      <div class="modal-header" style="    background-color:red!important;">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
        <h4 class="modal-title" id="payModalLabel" style="color:white;">
        STOCK INSUFICIENTE </h4>
      </div>
      <div id="cuerpo_stock_insuficiente" class="modal-body" style="font-size:16px;color: black;background-color: red!important;">

      </div>

      <div class="modal-footer" style="    background-color: red!important;">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal"> Cerrar </button>
      </div>
    </div>
  </div>
</div>
<!-- fin milton-->


<script src="<?php echo base_url(); ?>public/js/select2.min.js"></script>
<script src="<?php echo base_url(); ?>public/libg/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" >
  var btn     = document.querySelectorAll(".key li"),
  input     = document.querySelector(".input-valor"),
  operador  = document.querySelectorAll(".operador");
  for(var i = 0; i < btn.length; i++){
    document.onkeypress = function(){
      var key = event.keyCode;
      for(var e = 0; e <= 10; e++){
        if(key === (48+e)){
          input.innerHTML += e;
        }
      }
      switch (key){
        case 42:
        input.innerHTML += "*";
        break;
        case 43:
        input.innerHTML += "+";
        break;
        case 45:
        input.innerHTML += "-";
        break;
        case 46:
        input.innerHTML += ".";
        break;
        case 47:
        input.innerHTML += "/";
        break;
        case 13:
        case 61:
        var equacao = input.innerHTML;
        if(equacao){
          try {
            input.innerHTML = eval(equacao);
          } catch (e) {
            alert('Error calcular');

          } 
        }
        break;
        case 67:
        case 99:
        input.innerHTML = "";
        break;            
        default:
        break;
      }
    };
    btn[i].addEventListener('click',function(){
      var btnVal   = this.innerHTML,
      inputVal = input.innerHTML;
      switch (btnVal){
        case "c":
        input.innerHTML = "";
        break;
        case "=":
        var equacao = inputVal;

        if(equacao){
          try {
            input.innerHTML = eval(equacao);
          } catch (e) {
            alert('Error calcular');

          } 
        }
        break;
        default:
        input.innerHTML += btnVal;
        break;  
      }
    });
  }
</script> 

<script>
  $(function () { 
    $('#borrar1').remove();
    $('#borrar2').remove();
    
    $('.navbar-static-top').remove()
    $('.content-header').remove()
    validarcaja(); 
  }); 

  <?php if ($data["estadostock"] == 1 ) { ?>
  function stok_validacion(stock, t){
    cantidad=$(t).val();
    if(cantidad >stock){
      if (cantidad == 0) {
        $(t).val(stock)
      }else{
        $(t).val(0);
      }
      
    }else if(cantidad==0){
      $(t).val(1);
    }
  };
  <?php }  ?> 
 
</script>
<script>
  $(function(){
   traerproductos('');
   var datos_array  = [];
    var datos_array_temp  = [];

 });
  $(window).resize(function(){
   var resolucion = $(document).width();
   if (resolucion <=800) {
    $("#prod").text('produc.');
    $("#pre").text('pre.');
    $("#cant").text('cant.');
    $("#subt").text('sub.');
  }
  if (resolucion >= 1200) {
    $('#contentenido').removeClass('content').addClass('content1'); 
  }else{
    if (resolucion<1200) {
      $('#contentenido').removeClass('content1').addClass('content');
    }
  }
});

</script>
<!-- <script>
  var btn = document.getElementById('show');
  var nav = document.getElementById('nav');

  btn.addEventListener('click', function() {
    nav.classList.toggle('active');
  });

  var btn1 = document.getElementById('show_calculadora');
  var nav1 = document.getElementById('nav1');

  btn1.addEventListener('click', function() {
   nav1.classList.toggle('active');
 });
</script> -->
<script type="text/javascript">

  ;( function( window ) {

    'use strict';

    function extend( a, b ) {
      for( var key in b ) { 
        if( b.hasOwnProperty( key ) ) {
          a[key] = b[key];
        }
      }
      return a;
    }

    function CBPFWTabs( el, options ) {
      this.el = el;
      this.options = extend( {}, this.options );
      extend( this.options, options );
      this._init();
    }

    CBPFWTabs.prototype.options = {
      start : 0
    };

    CBPFWTabs.prototype._init = function() {
    // tabs elemes
    this.tabs = [].slice.call( this.el.querySelectorAll( 'nav > ul > li' ) );
    // content items
    this.items = [].slice.call( this.el.querySelectorAll( '.content > section' ) );
    // current index
    this.current = -1;
    // show current content item
    this._show();
    // init events
    this._initEvents();
  };

  CBPFWTabs.prototype._initEvents = function() {
    var self = this;
    this.tabs.forEach( function( tab, idx ) {
      tab.addEventListener( 'click', function( ev ) {
        ev.preventDefault();
        self._show( idx );
      } );
    } );
  };

  CBPFWTabs.prototype._show = function( idx ) {
    if( this.current >= 0 ) {
      this.tabs[ this.current ].className = '';
      this.items[ this.current ].className = '';
    }
    // change current
    this.current = idx != undefined ? idx : this.options.start >= 0 && this.options.start < this.items.length ? this.options.start : 0;
    this.tabs[ this.current ].className = 'tab-current';
    this.items[ this.current ].className = 'content-current';
  };

  // add to global namespace
  window.CBPFWTabs = CBPFWTabs;

})( window );
new CBPFWTabs( document.getElementById( 'tabs' ) );
</script>

<script>
  var cantidad_productoapoyo = 0;
  var vendidos_apoyo = 0;
  $("#buscar_producto").keyup(function(e){
    event.preventDefault();
    num = event.keyCode;

    if(num!=86){
     valor=$(this).val();


     $("#cargar").removeClass("zmdi-search");
     $("#cargar").addClass("zmdi-refresh-sync");
     buscar_mapproducto(valor);
    
     // $("#scroll_div2").empty();           
    //  $.post(base_url+"Ventas/buscar",{"valor":valor},function(data){
    //    $("#cargar").addClass("zmdi-search");
    //    $("#cargar").removeClass("zmdi-refresh-sync");
    //    if(parseInt(data['tipo'])==1){

    //      $("#buscar_producto").val("");
    //      agregar_cantidad(data["id"],data["descripcion"],data["precio"],data["producto_id_tipoproducto"],data["detalle_almacen"],data["detalle_stock"]);


    //    }else{
    //      if (data["cont"] == 0) {
    //       document.getElementById("scroll_div1").style.display = "none";
    //       document.getElementById("scroll_div2").style.display = "block";
    //       $("#scroll_div1").empty();            
    //       $("#scroll_div2").empty().append(data["html"]);
    //     }else{
    //       document.getElementById("scroll_div2").style.display = "none";
    //       document.getElementById("scroll_div1").style.display = "block";
    //       $("#scroll_div2").empty();
    //       $("#scroll_div1").empty().append(data["html"]);
    //     }

    //   }

    // },"json");
   }

 });

  function traerproductos(id){
  valor=id;
  $("#cargar").removeClass("zmdi-search");
  $("#cargar").addClass("zmdi-refresh-sync");
  $.post(base_url+"Ventas/buscar",{"categoriaproducto":valor},function(data){

   $("#cargar").addClass("zmdi-search");
   $("#cargar").removeClass("zmdi-refresh-sync");
   if(parseInt(data["tipo"])==1){
    $("#buscar_producto").val("");
    agregar_cantidad(data["id"],data["descripcion"],data["precio"],data["producto_id_tipoproducto"],data["detalle_almacen"],data["detalle_stock"]);
   }else{

    datos_array = data["info"];
    buscar_mapproducto('');
     // $("#scroll_div1").empty().append(data["html"]);
   }
   // document.getElementById("nav").className = "navigation";
 },"json");
}

function buscar_mapproducto(valor){
  const filterItems = query => {
    return datos_array.filter(
      (el) =>    el.producto_descripcion.toLowerCase().indexOf(query.toLowerCase()) > -1
      // (el) => console.log(el)
    );
  }
  datos_array_temp = filterItems(valor) ;
  html = "";
  document.getElementById("scroll_div1").style.display = "none";
  document.getElementById("scroll_div2").style.display = "block";
  for (var i = 0; i < datos_array_temp.length; i++) {
    dat= datos_array_temp[i];
    var a = dat["producto_id"]+",'"+dat["producto_descripcion"]+"',"+dat["producto_precio"]+","+dat["stock"];
    html +='<input type="hidden" id="productid'+dat["producto_id"]+'" value="'+dat["url"]+'">';
    html +='<div class="col-xs-6 col-md-3" id="'+dat['producto_descripcion']+'">';
    html +='<div class="panel panel-default card-view pa-0">';
    html +='<div class="panel-wrapper collapse in">';
    html +='<div class="panel-body pa-0">';
    html +='<article class="col-item">';
    html +='<div class="photo">';
    html +='<a onclick="agregar_cantidad('+a+')"> <img style="width: 125px;height: 125px;" src="'+dat["url"]+'" class="img-responsive" alt="Product Image"> </a>';
    html +='</div>';
    html +='<div class="info">';
        // if(strlen(dat["producto_descripcion"]) >= 15 ){
        //   $html+='<h6 class="claseproducto" style="font-size: 20px;line-height:82%;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;border-top-width: 0px;border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;margin-left: 0px;margin-right: 0px;">'+substr(dat['producto_descripcion'], 0, 120)+'</h6>';
        // }else{ 
    html +='<h6 class="claseproducto" style="font-size: 20px;line-height:82%;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;border-top-width: 0px;border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;margin-left: 0px;margin-right: 0px;">'+dat["producto_descripcion"]+'</h6>';
        // }
    html +='<span style="font-size: 10px;"class="head-font block text-warning font-16">S/+'+dat["producto_precio"]+'</span>';
    html +='</div></article></div></div> </div></div>';


    console.log(datos_array_temp[i]["producto_descripcion"]);
  }
  // document.getElementById("scroll_div1").style.display = "none";
  // document.getElementById("scroll_div2").style.display = "block";

  

  $("#scroll_div1").empty();
  $("#scroll_div2").html(html);
}


  // function traerproductos(id){
  //   valor=id;
  //   $("#cargar").removeClass("zmdi-search");
  //   $("#cargar").addClass("zmdi-refresh-sync");
  //   $.post(base_url+"Ventas/buscar",{"categoriaproducto":valor},function(data){

  //    $("#cargar").addClass("zmdi-search");
  //    $("#cargar").removeClass("zmdi-refresh-sync");
  //    if(parseInt(data["tipo"])==1){
  //      $("#buscar_producto").val("");
  //      agregar_cantidad(data["id"],data["descripcion"],data["precio"],data["producto_id_tipoproducto"],data["detalle_almacen"],data["detalle_stock"]);
  //    }else{
  //      $("#scroll_div1").empty().append(data["html"]);
  //    }
  //    document.getElementById("nav").className = "navigation";
  //  },"json");
  // }

  function agregar_cantidad(id,descripcion,precio,stock,idtipo,idalmacen){
    url = $("#productid"+id).val();
    $("#modalproducto").modal();
    // $( "#modalproducto" ).removeClass( "show" ).addClass( "in" );
    html='';
    html+='<div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">';
    html+='<div class="modal-content">';
    html+='<div class="modal-header" style="padding: 15px;border-bottom: 1px solid #ab2bba;">';
    html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
    html+='<img id="prodcant_imagen" src="'+url+'" class="rounded-circle img-responsive"><br>';
    html+='<div class="corp">';
    html+='<center><a class="logo" id="nombreplato"></a></center>';
    html+='</div>';
    html+='</div> ';
    html+='<div class="modal-body text-center mb-1">';
    html+='<div class="form-wrap">';
    html+='<form role="form" class="form-horizontal">';
    html+='<div class="form-group">';
    html+='<input type="hidden" value="" id="stock" >';
    html+='<label class="col-md-3 control-label " for="example-input-small">STOCK:</label>';
    html+='<label class="col-md-3 control-label " id="stocktotal">10</label>';
    html+='</div>';
    html+='<div class="form-group">';
    html+='<label class="col-xs-3 col-md-3 control-label " for="example-input-small">Cant. :</label>  '; 
    html+='<div class="col-xs-9 col-md-9"> ';             
    html+='<input id="cant_add" type="text" value="" onchange="stok_validacion('+stock+', this)" readonly name="cant_add" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default">';
    html+='</div>';
    html+='</div>';
    html+='<div class="form-group">';
    html+='<div class="col-xs-12 col-md-12">';
    html+='<textarea placeholder="Descripción de la venta" name="descripcion" id="descripcion" ></textarea>  ';   
    html+='</div>';             
    html+='</div>';
    html+='';
    html+='</form>';
    html+='<div id="agregarboton"></div>';
    html+='</div>';
    html+='</div>';
    html+='</div>';
    html+='</div>';
    $("#modalproducto").empty().append(html);
    $("input[name='cant_add']").TouchSpin();
    if($("#estado_preparado"+id).val() == 1){
     $("#boton_sumar").remove();
   }
   desc = '"'+descripcion+'"';
   $("#agregarboton").empty().append("<button name='guardarcantidad' onclick='agregar_venta("+id+","+desc+","+precio+","+idtipo+","+idalmacen+","+stock+")' type='button' data-disable-with='<i class=&quot;fa fa-circle-o-notch fa-spin&quot;></i>Guardar' class='btn btn-primary btn-lg btn-block-xs-down'>Guardar</button>");
   a = $("#cantidad"+id).val();
   if ((typeof (a) === 'undefined') || (a === null)){
    <?php if ($data["estadostock"] == 1) { ?>
      $("#cant_add").val(0);
    <?php  }else{ ?> 
      $("#cant_add").val(1);
    <?php }  ?>
     
   }else{
    $("#cant_add").val($("#cantidad"+id).val());
  }
  $("#prodcant_imagen").css("background-image", "url(<?php echo base_url() ?>public/img/default.jpg)");
//var JSON=$.ajax({
//  type: "POST",
//  url:base_url+"Ventas/traercantidades",
//  data: {"id" : id},
//  dataType: 'json',
//  async: false}).responseText;
//var data=jQuery.parseJSON(JSON); 
$("#nombreplato").text(descripcion.toUpperCase());
$("#stocktotal").text(stock);
$("#stock").val(stock);
$("#prodcant_imagen").removeAttr("style");
//if(data[0]["producto_imagen"] ==''){
 $("#prodcant_imagen").css("background-image", "url(<?php echo base_url() ?>public/img/default.jpg)");
//}else{
//  $("#prodcant_imagen").css("background-image", "url(<?php echo base_url() ?>public/img/"+data[0]["producto_imagen"]+")");
//}
}

function agregar_venta(id,descripcion,precio,id_tipo,idalmacen,stock){
  if ($("#cant_add").val() == 0) {
    generar_notificacion("ERROR","DEBE SER MAYOR DE 0","error","#fec107");
    return 0;
  }
  $("#modalproducto").modal('hide');
  html='';
  $c=0;

  $('input[name="id_producto[]"]').map(function(n,i){
    if($(this).val()==id){
      $c=1;
    }

  }).get();
  subtotal=0;
  if($c==0){
    subtotal=1*parseFloat(precio);
    html+='<tr id="cuerpo_tabla'+id+'" class="2 danger" data-item-id="2" style="padding: 0px !important;">';
    html+='<center>';
    html+='<td style="width: 30%;" >';
    html+='<input name="id_producto[]" id="id_producto'+id+'" type="hidden" class="rid" value="'+id+'">';
    html+='<input name="comentarioventa[]" id="comentarioventa'+id+'" type="hidden" class="rid" value="'+$("#descripcion").val()+'">';
    html+='<input name="estado_preparado[]" id="estado_preparado'+id+'" type="hidden" class="rid" value="0">';
    html+='<input name="id_tipo[]" id="id_tipo'+id+'" type="hidden" class="rid" value="'+id_tipo+'">';
    html+='<input name="detalle_almacen[]" id="detalle_almacen'+id+'" type="hidden" class="rid" value="'+idalmacen+'">';

    html+='<button type="button" class="btn btn-block btn-xs edit btn-warning btndetalle" id="btndetalle" style="" data-item="2">';
    html+='<span style="" class="sname spandetalle" id="name_1526743222604">'+descripcion+'</span>';
    html+='</button>';
    html+='</td>';
    html+='</center>';
    html+='<center>';
    html+='<td  style="width: 15%;text-align:center;" class="text-right">';

    html+='<div class="input-group bootstrap-touchspin">';
    html+='<span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>';
    html+='<input class="vertical-spin form-control divletra" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+parseFloat(precio)+'" id="precio'+id+'" name="precio[]" style="display: block;" readonly>';
    html+='</div>';
    html+='</td>';
    html+='<td  style="width: 15%;text-align:center;">';
    html+='<div class="input-group bootstrap-touchspin"><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input class="vertical-spin form-control divletra" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+$("#cant_add").val()+'" name="cantidad[]" id="cantidad'+id+'" style="display: block;" readonly></div>';
    html+='</td>';
    html+='</center>';
    html+='<center><td style="width:20%;text-align:center;" class="text-right"><span class="text-right " id="subtotal'+id+'">'+subtotal+'</span></td></center>';
    html+='<center><td style="width: 30px;text-align:center;" class="text-center"><i class="fa fa-trash-o tip pointer posdel" id="1526743222604" title="Eliminar" onclick="eliminar_producto('+id+')"></i></td></center>';
    html+=' </tr>';
    $("#cuerpo_venta").prepend(html);
  }else{
    $("#cantidad"+id).val($("#cant_add").val());
  }

  total_venta();
  //$("#cantidad"+id).select();
  /*  setTimeout(function(){*/
    $("#buscar_producto").focus();/*},500);*/
    $("#cant_add").val('');
    $("#descripcion").val('');
  }

  function aumentar(){

  }

  function disminuir(){

  }

  function total_venta(){

    total=0;
    cantidad_producto=0;
    suma_producto=0;
    impuesto=0;
    total_pagar=0;
    total_pagaroc = 0;
    vendidos_apoyo = 0;
    cantidad_productoapoyo = 0;
    $('input[name="id_productotraido[]"]').map(function(n,i){
      id=$(this).val();
      cantidad_producto++;
      cantidad=parseFloat($("#cantidadtraido"+id).val());
      precio=parseFloat($("#preciotraido"+id).val());
      $("#subtotaltraido"+id).text((cantidad*precio).toFixed(2));
      total+=cantidad*precio;
      suma_producto+=cantidad;
      vendidos_apoyo++;
    }).get();
    $("#productos_vendidos").val(vendidos_apoyo);

    $('input[name="id_producto[]"]').map(function(n,i){
     id=$(this).val();
     cantidad_producto++;
     cantidad=parseFloat($("#cantidad"+id).val());
     precio=parseFloat($("#precio"+id).val());
     $("#subtotal"+id).text((cantidad*precio).toFixed(2));
     total+=cantidad*precio;
     suma_producto+=cantidad;
     cantidad_productoapoyo++;
   }).get();
    $("#productos_por_vender").val(cantidad_productoapoyo);
    total_pagar=total;
    total_pagaroc = total;
    $("#total_pagar").text(total_pagar.toFixed(2));
    $("#total_pagaroc").val(total_pagaroc.toFixed(2));
    $("#total_pagarsub").text(total_pagar.toFixed(2));
    if( $('#igv').prop('checked')){
     impuesto= parseFloat($("#igv").val());
     subtotal=1-impuesto;
     $("#total").text((total_pagar*subtotal).toFixed(2));
     $("#impuesto").text((total_pagar*impuesto).toFixed(2));

   }
   else{
    $("#total").text(total_pagar.toFixed(2));
    $("#impuesto").text("0.00");

  }
  



  $("#count").text(cantidad_producto+"("+suma_producto+")");

  $("#item_count").text(cantidad_producto+"("+suma_producto+")");




}

$("#guardar_cliente").click(function(){
  $(this).attr("disabled",true);
  $.post(base_url+"Pedido/guardar_cliente",$("#formulario_cliente").serialize(),function(data){
    $('#formulario_cliente')[0].reset();
    $("#nuevo_cliente").modal("hide");
    $("#guardar_cliente").attr("disabled",false);

  });
});
$("#guardar_empresa").click(function(){
  $(this).attr("disabled",true);
  $.post(base_url+"Pedido/guardar_cliente",$("#formulario_empresa").serialize(),function(data){
    $('#formulario_empresa')[0].reset();
    $("#nuevo_cliente").modal("hide");
    $("#guardar_empresa").attr("disabled",false);

  });
});

function nuevo_cliente(){
  html='';
  html+='<div class="modal-dialog modal-lg">';
  html+='<div class="modal-content">';
  html+='<div class="modal-header">';
  html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
  html+='<h5 class="modal-title" id="myLargeModalLabel">Agregar Cliente</h5>';
  html+='</div>';
  html+='<div class="modal-body">';
  html+='<form id="formulario_cliente">';
  html+='<input type="hidden" name="id" id="id">';
  html+='<div class="row">';
  html+='<div class="col-md-4">';
  html+='<div class="form-group">';
  html+='<label class="control-label mb-10 text-left">D.N.I</label>';
  html+='<div class="input-group date">';
  html+='<input type="text" class="form-control" required="true" maxlength="11" name="ntelefono" id="ntelefono" autofocus="true" value="" required />';
  html+='<input type="hidden" name="idcliente" id="idcliente" value="" />';
  html+='<span style="cursor:pointer;" onclick="jalar_reniec()" id="reniec"  class="input-group-addon">RENIEC</span>';
  html+='</span>';
  html+='</div>';
  html+='</div>';
  html+='</div>';
  html+='<div class="col-md-4">';
  html+='<div class="form-group">';
  html+='<label class="control-label mb-10 text-left">NOMBRE Y APELLIDOS</label>';
  html+='<input type="text" class="form-control" required="true" name="nombres" id="nombres"  value="" required/>';
  html+='</div>';
  html+='</div>';
  html+='<div class="col-md-4">';
  html+='<div class="form-group">';
  html+='<label class="control-label mb-10 text-left">DIRECCION</label>';
  html+='<input type="text" class="form-control" required="true" name="direccion" id="direccion" autofocus="true" value="" required>';
  html+='</div>';
  html+='</div>';
  html+='</div>';
  html+='<div class="row">';
  html+='<div class="col-md-4">';
  html+='<div class="form-group">';
  html+='<label class="control-label mb-10 text-left">TELEFONO</label>';
  html+='<input type="text"  class="form-control" required="true" name="telefono" id="telefono" autofocus="true" value="" required>';
  html+='</div>';
  html+='</div>';
  html+='<div class="col-md-4">';
  html+='<div class="form-group">';
  html+='<label class="control-label mb-10 text-left">CIUDAD</label>';
  html+='<input type="text" class="form-control" required="true" name="ciudad" id="ciudad" autofocus="true" value="" required>';
  html+='</div>';
  html+='</div>';
  html+='</div>';
  html+='</form>';                                                
  html+='</div>';
  html+='<div class="modal-footer">';
  html+='<button type="button" class="btn btn-danger text-left" data-dismiss="modal">Cerrar</button>';
  html+='<button type="button" onclick="guardar_cliente()" id="guardar_cliente" class="btn btn-success text-left">Guardar</button>';
  html+='</div>';
  html+='</div>';
  html+='</div>';
  $("#modal_nuevo_cliente").empty().append(html);
  $("#modal_nuevo_cliente").modal();
}


function generar_ventapedido(){
  if ($("#perfil").val() == "") {
    generar_notificacion("ERROR","SELECCIONE TIPO DE ENTREGA POR FAVOR","error","#fec107");
    return 0;
  }else{
    if($("#perfil").val() == 1){
      if ($("#mesallevar").val() == "") {
        generar_notificacion("ERROR","SELECCIONE UNA MESA POR FAVOR","error","#fec107");
        return 0;
      }
    }
    if ($("#perfil").val() == 2) {
      if ($("#mesa").val() == "") {
        generar_notificacion("ERROR","SELECCIONE UNA MESA POR FAVOR","error","#fec107");
        return 0;
      }
    }
    if ($("#perfil").val() == 3) {
      if ($("#ntelefono").val() == "" && $("#nombre").val() == "" && $("#direccion").val() == "" && $("#dnidelivery").val() == ""  ) {
        generar_notificacion("ERROR","POR FAVOR LLENE TODO LOS DATOS","error","#fec107");
        return 0;
      }
    }

  }

  total_pagar=parseFloat($("#total_pagar").text());
  total_pagaroc = parseFloat($("#total_pagaroc").val());
  if(total_pagar>0 && cantidad_productoapoyo > 0 ){
    if($("#id_mozo").val()!=""){
      $("#payment").text("Procesando...");
      $("#payment").attr("disabled",true);
      datos_matriz={};
      datos_matriz["venta_producto"]=$("#formulario_venta").serialize();
    //milton
    $.post(base_url+"Ventas/verificar_stock",JSON.stringify(datos_matriz),function(respuestastock){ 
      if (respuestastock == 3) { 
        $.post(base_url+"Mostrador/guardarpedido",JSON.stringify(datos_matriz),function(data){
          generar_notificacion("EXITOSO","SE REGISTRO CORRECTAMENTE LA VENTA","success","#fec107");
          setTimeout(function(){
           if ($('#id_perfil') == 5) {
             window.location.href = base_url+'Mostrador'; 
           }else{            
             window.location.href = base_url+'Mostrador'; 
           }
         },500);

          window.location.href = base_url+'Mostrador'; 
        });
      }else{ 
        $("#payment").text("Procesar");
        $("#payment").attr("disabled",false);
        generar_notificacion("ERROR",respuestastock,"error","#fec107");
      }


    },'json');



    
  }else{
   generar_notificacion("ERROR","SELECCIONE UN cliente POR FAVOR","error","#fec107");
 }



}else{
  generar_notificacion("ERROR","AL MENOS DEBES TENER UN PRODUCTO PARA PODER REALIZAR LA venta","error","#fec107")
}

}
function cobrar_venta(){

  dat=$("#forma_pago").val();

  if($("#cliente").val()==""){
    generar_notificacion("ERROR","SELECCIONE EL CLIENTE POR FAVOR","error","");
    return 1;
  }
  if ($("#tipo_pago").val() == 2 && ($("#cliente").val() == '' || $("#cliente").val() == 0) ) {
    generar_notificacion("ERROR","SELECCIONE EL CLIENTE PARA EL PAGO AL CREDITO","error","");
    return 1;
  }

  monto_pagar=parseFloat($("#total_pagar_modal").text());
  if(parseFloat(dat)==99){
  //pagar(1,1,monto_pagar,"grupoesconsultores");
 }else{
  monto=0;
  monto=parseFloat($("#balance").text());
  if(monto>=0){
    $("#submit-sale").attr("disabled",true);
    $("#submit-sale").text("Procesando..."); 
    generar_venta();
  } 
  else{
   generar_notificacion("ERROR","NO SE PUEDE GENERAR LA VENTA PORQUE EL MONTO ENTREGADO","error","")
 }
}
}

function generar_venta(){
  datos_matriz={};

  if($("#dinero_entregado").val()=="" || $("#dinero_entregado").val()==0){
    $("#dinero_entregado").focus();return 0;
  }

  if($("#cliente").val()==""){
    $("#cliente").focus(); return 0;
  } 
  if($("#tipo_pago").val()=="2"){
    if($("#cuotas").val()==""){
      $("#cuotas").focus(); return 0;
    }
    if($("#intervalo").val()==""){
      $("#intervalo").focus(); return 0;
    }    
  }
  datos_matriz["venta_producto"]=$("#formulario_venta").serialize();
  datos_matriz["venta_pago"]=$("#formulario_pago").serialize();
  datos_matriz["total_pagar"] = $("#total_pagar").text();
  $("#submit-sale").text("Procesando...");
  $("#submit-sale").attr("disabled",true);
  $.post(base_url+"Ventas/verificar_stock",JSON.stringify(datos_matriz),function(respuestastock){ 
    if (respuestastock == 3) { 
      $.post(base_url+"Mostrador/procesar_venta",JSON.stringify(datos_matriz),function(data){
        if(parseInt(data["estado"])==1){
         $("#submit-sale").text("Pagar");
         $("#submit-sale").attr("disabled",false);
         $("#id_modal_venta").val(data["idventa"]);

         <?php if($data["estado_impresion"]==0){ ?>

           var url=base_url+"pedido/mostrar_comprobante/"+$("#id_modal_venta").val();
           var a = document.createElement("a");
           a.target = "_blank";
           a.href = url;
           a.click();
           <?php } ?>


           $("#submit-sale").attr("disabled",false);
           $("#submit-sale").text("Guardar"); 
           $("#cobrar_modal").modal("hide");
           $("#panel"+$("#id_modal_venta").val()).hide(); 
           $("#panel"+$("#id_modal_venta").val()).remove();
           $("#id_modal_venta").val("");
           limpiar();
           generar_notificacion("VENTA EXITOSA","SE GENERO LA TRANSACCION EXITOSA","success","#fec107");
           setTimeout(function(){
            if ($('#id_perfil') == 5) {
             window.location.href = base_url+'Mostrador'; 
           }else{            
            window.location.href = base_url+'Mostrador'; 
          }
        },500);
         }else if (parseInt(data["estado"])==2) {
          $("#submit-sale").text("Pagar");
          $("#submit-sale").attr("disabled",false);
          generar_notificacion("ERROR","SE GENERO UN ERROR EN CAJA POR FAVOR REVISE SI CAJA ESTE ABIERTO O SI TIENE EL DINERO NECESARIO","error","#fec107");
        }
        else{
         $("#submit-sale").text("Pagar");
         $("#submit-sale").attr("disabled",false);
         generar_notificacion("ERROR","SE GENERO UN ERROR EN LA TRANSACCION","error","#fec107");
       }


     },"json") .fail(function() {
       $("#submit-sale").text("Pagar");
       $("#submit-sale").attr("disabled",false);
       generar_notificacion("ERROR","SE GENERO UN ERROR EN LA TRANSACCION X","error","#fec107");
     });
   }else{ 
    generar_notificacion("ERROR",respuestastock,"error","#fec107");
  }


},'json');





}
// Culqi.publicKey = '<?php echo $token; ?>';
// id_reserva=0;
// dinero_reserva=0;
// id_empresa=0;
// function pagar(id_rea,id,dinero,nombre)
// {

//   dinero_reserva=dinero;
//   id_reserva=id_rea;
//   id_empresa=id;

//   dinero= dinero*100;
//   Culqi.settings({
//     title: nombre,
//     currency: 'PEN',
//     description: 'pago de venta',
//     amount: dinero
//   });

//   Culqi.open();


// }

function generar_pago(){
 total_pagar=parseFloat($("#total_pagar").text());
 total_pagaroc = parseFloat($("#total_pagaroc").val());
 actualizar_comprobante();
// if ($("#cliente").val() == "") {
//  generar_notificacion("ERROR","SELECCIONE TIPO DE CLIENTE POR FAVOR","error","#fec107");
//  return 0;
//}
if ($("#perfil").val() == "") {
  generar_notificacion("ERROR","SELECCIONE TIPO DE ENTREGA POR FAVOR","error","#fec107");
  return 0;
}else{
  if($("#perfil").val() == 1){
    if ($("#mesallevar").val() == "") {
      generar_notificacion("ERROR","SELECCIONE UNA MESA POR FAVOR","error","#fec107");
      return 0;
    }
  }
  if ($("#perfil").val() == 2) {
    if ($("#mesa").val() == "") {
      generar_notificacion("ERROR","SELECCIONE UNA MESA POR FAVOR","error","#fec107");
      return 0;
    }
  }
  if ($("#perfil").val() == 3) {
    if ($("#ntelefono").val() == "" && $("#nombre").val() == "" && $("#direccion").val() == "" && $("#dnidelivery").val() == ""  ) {
      generar_notificacion("ERROR","POR FAVOR LLENE TODO LOS DATOS","error","#fec107");
      return 0;
    }
  }

}
if(total_pagar>0 ){

  if($("#id_mozo").val()!=""){
    $("#cobrar_modal").modal({"backdrop":"static","keyboard":false});

    $("#dinero_entregado").val(total_pagar.toFixed(2));
    $("#boton_monto_dinero").val(total_pagar.toFixed(2));
    $("#boton_monto_dinero").text(total_pagar.toFixed(2));
    $("#total_paying").text(total_pagar.toFixed(2));
    $("#total_pagar_modal").text(total_pagar.toFixed(2));
    var select=$('#cliente'); 
    if ($("#tipo_comprabante").val() != 2 && $("#tipo_comprabante").val() != 4 ) {
      var option = new Option('Varios', 0, true, true);
      select.append(option).trigger('change');
    }else{
     var option = new Option('', '', true, true);
     select.append(option).trigger('change'); 
   }

    // manually trigger the `select2:select` event
    select.trigger({
      type: 'select2:select'
    });
  }else{
   generar_notificacion("ERROR","SELECCIONE UN cliente POR FAVOR","error","#fec107")
 }



}else{
  generar_notificacion("ERROR","AL MENOS DEBES TENER UN PRODUCTO PARA PODER REALIZAR LA venta","error","#fec107")
}

}

function guardar_cliente(){

  if ($("#ntelefono").val() != '' && $("#nombres").val() != '' && $("#direccion").val() != '' && $("#telefono").val() != '' && $("#ciudad").val() != '') {
    $("#guardar_cliente").text("Guardando..");
    $("#guardar_cliente").attr("disabled",true);
    $.post(base_url+"Clientes/guardar_ajax",$("#formulario_cliente").serialize(),function(data){
      if(data["id"]=="1"){
       generar_notificacion("Se registro correctamente","Se ingreso un nuevo proveedor correctamente","success","#fec107");
       $("#guardar_cliente").text("Guardando..");
       $("#guardar_cliente").attr("disabled",false);
       $("#modal_nuevo_cliente").modal("hide");
       $('#formulario_cliente')[0].reset();
     }
     else{
       generar_notificacion("ERROR","se genero un error ","error","#fec107");
       
     }
   },"json");
  }

}

window.onkeyup = tecla;

function tecla(event) {
  event.preventDefault();
  num = event.keyCode;

  if(num==13){
   generar_venta();
      //window.close();
    }

    
    if(num==112){
     nuevo_cliente();
   }

   if(num==123) {
     alert("Pulsaste F12");
     window.close();
   }
 }

 function eliminar_producto(id){
  if($("#estado_preparado"+id).val() ==0){
   $("#cuerpo_tabla"+id).remove();
   total_venta();
 }else{
  generar_notificacion("ERROR","ESTE PEDIDO YA FUE PROCESADO, LO SENTIMOS NO SE PUEDE ELIMAR","error","#fec107");
}

}
function chek_igv()
{

  if($("#igv").prop('checked')){
    localStorage.setItem("ivg_venta", "1");

  }else{
    localStorage.setItem("ivg_venta", "0");

  }
  total_venta();
}
function generar_vuelto()
{
  monto_pagar=parseFloat($("#total_pagar_modal").text());
  dinero=parseFloat($("#dinero_entregado").val());
  vuelto=dinero-monto_pagar;
  $("#total_paying").text(dinero.toFixed(2));
  $("#balance").text(vuelto.toFixed(2));

}

function crear_cronograma()
{
  if($("#intervalo").val()!="" && $("#cuotas").val()!=""){
    $("#cronograma").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
    $.post(base_url+"Ventas/cronograma_prestamo",
    {
      "fecha_venta":$("#fecha").val(),
      "cuotas":$("#cuotas").val(),
      "monto":$("#total_pagar_modal").text(),
      "intervalo":$("#intervalo").val()
    },
    function(data){

      $("#cronograma").empty().html(data);

    });
  }else{
   $("#cronograma").empty();
 }
}
$("#tipo_pago").change(function(){
  if($(this).val()=="1")
  {
    $("#credito").hide();
    $("#cuotas").val("");
    $("#intervalo").val("");
    $("#cronograma").empty();  

  }else{
    $("#credito").show();   

  }
});

$("#nuevo").click(function(){
  $("#nuevo_cliente").modal();
});

function actualizar_comprobante()
{
  var dat=$("#tipo_comprabante").val();
  globalvariable = dat;
  $("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
  if(dat!=0){
    $.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){
      if (data["estado"] == 1) {
        $("#comprobante").text("Nº "+data["correlativo"]);
        $("#submit-sale").attr("disabled",false);
        $("#submit-sale").text("Guardar"); 
      }else{
        generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
        $("#submit-sale").attr("disabled",true);
        $("#submit-sale").text("Guardar"); 
      }
      //$("#comprobante").text("Nº "+data);
    },'json');
  }else{

    $("#comprobante").text("Nº 001-1");
  }
}

$("#tipo_comprabante").change(function(){

  var dat=$(this).val();
  globalvariable = dat;
  $("#comprobante").empty().html('<center> <h1><i class="fa fa-spin fa-spinner"></i></h1> </center>');
  if(dat!=0){
    $.post(base_url+"Pedido/generar_boleta",{"tipo_documento":dat},function(data){
      if (data["estado"] == 1) {
        $("#comprobante").text("Nº "+data["correlativo"]);
        $("#submit-sale").attr("disabled",false);
        $("#submit-sale").text("Guardar"); 
      }else{
        generar_notificacion("ERROR","ESTE COMPROBANTE NO ESTA CONFIGURADO, REGRESE A CONFIGURARLO","error","");
        $("#submit-sale").attr("disabled",true);
        $("#submit-sale").text("Guardar"); 
      }
      var select=$('#cliente'); 
      if ($("#tipo_comprabante").val() != 2 && $("#tipo_comprabante").val() != 4 ) {
        var option = new Option('Varios', 0, true, true);
        select.append(option).trigger('change');
      }else{
       var option = new Option('', '', true, true);
       select.append(option).trigger('change'); 
     }
      //$("#comprobante").text("Nº "+data);
    },'json');
  }else{

    $("#comprobante").text("Nº 001-1");
    var select=$('#cliente'); 
    if ($("#tipo_comprabante").val() != 2 && $("#tipo_comprabante").val() != 4 ) {
      var option = new Option('Varios', 0, true, true);
      select.append(option).trigger('change');
    }else{
     var option = new Option('', '', true, true);
     select.append(option).trigger('change'); 
   }
 }
});

function cancelar(){
  setTimeout(function(){
   if ($('#id_perfil') == 5) {
    window.location.href = base_url+'Ventas'; 
  }else{            
   window.location.href = base_url+'Mpedidos'; 
 }
},500);
}

function guardar()
{
 datos_matriz={};
 datos_matriz["venta_producto"]=$("#formulario_venta").serialize();
 datos_matriz["venta_pago"]=$("#formulario_pago").serialize();
 $.post(base_url+"Ventas/procesar_venta",JSON.stringify(datos_matriz),function(data){
  alert();
});

}

function ptr(callback) {
  setTimeout(function () {
    var div = document.createElement('div'),
    feedTmpl = document.getElementById('feed-type-01').textContent;
    div.innerHTML = (feedTmpl + feedTmpl);
    callback(null, div.children);
  }, 1500);
}

function formatRepo (repo) {
  if (repo.loading) return repo.text;
  var markup="";
  markup += "<h5 style='font-size:15px;'>"+repo.text + "</h5>" ;
  markup += "<h6 style='font-size:12px;'>"+repo.documento + "</h6>" ;




  return markup;
}

    // Format selection
    function formatRepoSelection (repo) {
      return repo.text || repo.documento;
    }

    function culqi() {

    if(Culqi.token) { // ¡Token creado exitosamente!
        // Get the token ID:
        var token = Culqi.token.id;
        var email= Culqi.token.email;
        var diner=$("#total_pagar_modal").text();
       // alert('Se ha creado un token:'+$("#merchant_order_id").val());
       $.post(base_url+"public/pagar_culqi.php",{"email":email,"token":token,"dinero": parseFloat(diner)},function(data){

         if(data=="1"){

           generar_venta();
         }
         if(data=="2"){
           $("#submit-sale").attr("disabled",false);
           $("#submit-sale").text("Guardar"); 


           generar_notificacion("ERROR","ERROR AL MOMENTO DE INGRESA LA TARJETA","error","");
         }
       });


    }else{ // ¡Hubo algún problema!
        // Mostramos JSON de objeto error en consola
        console.log(Culqi.error);
        alert(Culqi.error.mensaje);
      }
    };

    function limpiar(){
      $("#tipo_pago option[value='1']").attr("selected",true);
      $("#forma_pago option[value='1']").attr("selected",true);
  //$("#cliente option[value='']").attr("selected",true);
  $("#tipo_comprabante option[value='0']").attr("selected",true);
  $("#comprobante").text("Nº 001-1");
  $("#dinero_entregado").val(0.00);
}


function tipoentrega(id){
  html='';
  switch(parseInt(id)) {
    case 1:
    html+='<div class="form-group">';
    html+='  <label style="color:black;">Seleccionar Mesa</label>';
    html+='  <div id="identrega" class="input-group">';
    html+='    <select id="mesallevar" class="form-control" onchange="mesaselect(this.value);" name="mesallevar" tabindex="-1" aria-hidden="true">';
    html+='      <option value="">Seleccionar Mesa</option>';
    html+='    </select>';
    html+=' </div>';
    html+='</div>';
    break;
    case 2:
    html+='<div class="form-group">';
    html+='  <label style="color:black;">Seleccionar Mesa</label>';
    html+='  <div id="identrega" class="input-group">';
    html+='    <select id="mesa" class="form-control" onchange="mesaselect(this.value);" name="mesa" tabindex="-1" aria-hidden="true">';
    html+='      <option value="">Seleccionar Mesa</option>';
    html+='    </select>';
    html+=' </div>';
    html+='</div>';
    break;
    case 3:
    html+='<div class="form-group telefonoclass"> ';         
    html+=  '<label class="control-label mb-10 text-left">N° DE TELEFONO</label>';
    html+=  '<input type="text" class="form-control" onkeypress="return solonumeros(event)" maxlength="9"  required="true" name="ntelefono" id="ntelefono" autofocus="true" value="">';
    html+='</div>';
    html+='<input type="hidden" id="idcliente" name="idcliente" value="">'
    html+='<div  class="form-group nombreclass"> ';         
    html+=  '<label class="control-label mb-10 text-left">NOMBRE COMPLETO</label>';
    html+=  '<input type="text" class="form-control" required="true" name="nombre" id="nombre" autofocus="true" value="">';
    html+='</div>';
    html+='<div class="form-group direccionclass">';        
    html+=  '<label class="control-label mb-12 text-left">DIRECCIÓN</label>';
    // html+='<div class="input-group">';
    html+=  '<input type="text" class="form-control"  required="true" name="direccion" id="direccion"  value="">';
    // html+='<span onclick="llamardirecciones()" class="input-group-addon"><i class="fa fa-pencil"></i></span>';
    // html+='<span onclick="llamarventas()" class="input-group-addon"><i class="fa fa-shopping-bag"></i></span>';
    // html+='</div>';
    html+='</div>';
    html+='<div class="form-group dniclass">';        
    html+=  '<label class="control-label mb-10 text-left">D.N.I</label>';
    html+=  '<input type="text" class="form-control" required="true" onsubmit="llamardirecciones()" maxlength="8" name="dnidelivery" id="dnidelivery"  value="">';
    html+='</div>';
    break;
  }


  $('.dnidelivery').keypress(function(e) {
        if(e.which == 13) {
             llamardirecciones();
        }
    });

  $("#tipoentregad").empty().append(html);
  $('#mesa').select2({
    ajax: {
      url: base_url+'Mostrador/buscar_ubicacionllevar/',
      dataType: 'json',
      placeholder: 'Buscar Mesas',
      maximumSelectionLength: 10,
      data: function (params) {
        return {
                    q: params.term, // search term
                    id: $("#perfil").val(),
                    page: params.page
                  };
                },
                processResults: function (data, params) {
                  return {
                    results: data.results
                  };
                },
                cache: true
              },
              escapeMarkup: function (markup) { return markup; }, 

              templateResult: formatRepo,
              templateSelection: formatRepoSelection, 
              language: {
                noResults: function() {
                  return "No hay resultado";        
                },
                searching: function() {
                  return "Buscando..";
                }
              }
            });
  $('#mesallevar').select2({
    ajax: {
      url: base_url+'Mostrador/buscar_ubicacioninsta/',
      dataType: 'json',
      placeholder: 'Buscar Mesas',
      maximumSelectionLength: 10,
      data: function (params) {
        return {
                    q: params.term, // search term
                    id: $("#perfil").val(),
                    page: params.page
                  };
                },
                processResults: function (data, params) {
                  return {
                    results: data.results
                  };
                },
                cache: true
              },
              escapeMarkup: function (markup) { return markup; }, 

              templateResult: formatRepo,
              templateSelection: formatRepoSelection, 
              language: {
                noResults: function() {
                  return "No hay resultado";        
                },
                searching: function() {
                  return "Buscando..";
                }
              }
            });
  $("#ntelefono").keyup(function(event) {
    $("#ntelefono1").val($("#ntelefono").val());
    var r=$("#ntelefono").val();
    if(r.length==9 || r.length==6){
     $.post(base_url+"Mostrador/traer_un_cliente",{"ntelefono":r},function(data){
      if(data.cant == 1){
        $("#nombre").val(data.info.cliente_nombres);
        $("#dnidelivery").val(data.info.cliente_dni);
        $("#traer_un_cliente").modal();
        html='';
        html+='<div class="modal-dialog">';
        html+='   <div class="modal-content">';
        html+='<div class="modal-header">';
        html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
        html+='<h5 class="modal-title">Este cliente tiene varias direcciones registradas</h5>';
        html+='</div>';
        html+='<div class="modal-body">';
        html+='<table id="datable_1" class="table table-hover display  pb-30" >';
        html+='<thead>';
        html+='<tr>';
        html+='<th>Direccion</th>';
        html+='<th><center>Seleccionar</center></th>';
        html+='</tr>';
        html+='</thead>';
        html+='<tbody>';
        for ( i = 0; i < data.direcciones.length; i++) {
          html+='<tr>';
          html+='<td>'+data.direcciones[i].direccion+'</td>';
          direccion = '"'+data.direcciones[i].direccion+'"';
          html+="<td><center><a class='mr-25' data-toggle='tooltip' onclick='elegirdireccion("+direccion+")' data-original-title='Edit'> <i class='mdi mdi-pencil zmdi-hc-2x txt-primary'></i> </a></center></td>";
          html+='</tr>';   
        }                
        html+='</tbody>';
        html+='</table>';
        html+='</div>';
        html+='</div>';
        html+='</div>';
        $("#traer_un_cliente").empty().append(html);         
      }else{
        if (data.cant == null) {
        }else{
          $("#traer_un_cliente").modal();
          html='';
          html+='<div class="modal-dialog">';
          html+='   <div class="modal-content">';
          html+='<div class="modal-header">';
          html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
          html+='<h5 class="modal-title">Este Número al parecer tiene varios clientes registrados</h5>';
          html+='</div>';
          html+='<div class="modal-body">';
          html+='<table id="datable_1" class="table table-hover display  pb-30" >';
          html+='<thead>';
          html+='<tr>';
          html+='<th>NOMBRE Y APELLIDO</label</th>';
          html+='<th>DNI</label</th>';
          html+='<th><center>Seleccionar</center></th>';
          html+='</tr>';
          html+='</thead>';
          html+='<tbody>';
          for ( i = 0; i < data.info.length; i++) {
            html+='<tr>';
            html+='<td>'+data.info[i].cliente_nombres+'</td>';
            html+='<td>'+data.info[i].cliente_dni+'</td>';
            cliente_nombres = '"'+data.info[i].cliente_nombres+'"';
            cliente_dni = data.info[i].cliente_dni;
            cliente_id  = data.info[i].cliente_id;
            html+="<td><center><a class='mr-25' data-toggle='tooltip' onclick='elegir_cliente("+cliente_nombres+","+cliente_dni+","+cliente_id+")' data-original-title='Edit'> <i class='mdi mdi-pencil zmdi-hc-2x txt-primary'></i> </a></center></td>";
            html+='</tr>';   
          }                
          html+='</tbody>';
          html+='</table>';
          html+='</div>';
          html+='</div>';
          html+='</div>';
          $("#traer_un_cliente").empty().append(html);
        }
      }
    },"json");

   }

 });
}

function elegirdireccion(direccion){
  $("#direccion").val(direccion);
  $("#traer_un_cliente").modal('hide');
}
function elegir_cliente(cliente_nombres,cliente_dni,cliente_id){
  $("#nombre").val(cliente_nombres);
  $("#dnidelivery").val(cliente_dni);
  $("#idcliente").val(cliente_id);
  $("#traer_un_cliente").modal('hide');
  setTimeout(function(){ llamardirecciones(); }, 500);  

}

function llamardirecciones(){
  dni = $("#dnidelivery").val();
  telefono = $("#ntelefono").val();
  $.post(base_url+"Mostrador/traer_direccion",{"dni":dni,"telefono":telefono},function(data){
    // alert(data.cantidaddi)
    if(data.cantidaddi <= 1){
      $("#direccion").val(data.direcciones[0].direccion);
    }else{
      $("#traer_un_cliente").modal();
      html='';
      html+='<div class="modal-dialog">';
      html+='   <div class="modal-content">';
      html+='<div class="modal-header">';
      html+='<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
      html+='<h5 class="modal-title">Este cliente tiene varias direcciones registradas</h5>';
      html+='</div>';
      html+='<div class="modal-body">';
      html+='<table id="datable_1" class="table table-hover display  pb-30" >';
      html+='<thead>';
      html+='<tr>';
      html+='<th>Direccion</th>';
      html+='<th><center>Seleccionar</center></th>';
      html+='</tr>';
      html+='</thead>';
      html+='<tbody>';
      for ( i = 0; i < data.direcciones.length; i++) {
        html+='<tr>';
        html+='<td>'+data.direcciones[i].direccion+'</td>';
        direccion = '"'+data.direcciones[i].direccion+'"';
        html+="<td><center><a class='mr-25' data-toggle='tooltip' onclick='elegirdireccion("+direccion+")' data-original-title='Edit'> <i class='mdi mdi-pencil zmdi-hc-2x txt-primary'></i> </a></center></td>";
        html+='</tr>';   
      }                
      html+='</tbody>';
      html+='</table>';
      html+='</div>';
      html+='</div>';
      html+='</div>';
      $("#traer_un_cliente").empty().append(html);
    }
  },"json");
}

function llamarventas(){
  dni = $("#dnidelivery").val();
  telefono = $("#ntelefono").val();
  $.post(base_url+"Mostrador/traer_ventas",{"dni":dni,"telefono":telefono},function(data){
    if(data.estado == 0){
     alert('este cliente no está registrado lo sentimos');
   }else{
    if(data.estado == 2){
      alert('este cliente no tiene ventas realizadas');
    }else{
      $("#traer_ventas_modal").modal();
      html='';
      html+='<div class="modal-dialog modal-lg">';
      html+='   <div class="modal-content">';
      html+=      '<div class="modal-header">';
      html+=        '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>';
      html+=        '<h5 class="modal-title">Venta Clientes</h5>';
      html+=       '</div>';
      html+=       '<div class="modal-body">';
      html+=        '<div class="panel-group accordion-struct" id="acordion_venta" role="tablist" aria-multiselectable="true">';
      for ( i = 0; i < data.ventas.length; i++) {
        html+=' <div class="panel panel-default animated fadeInRight m-l-none m-r-none" id="panel'+data["ventas"][i]["venta_idventas"]+'" >';
        html+='<input type="hidden" name="numero_venta[]" id="numero_venta[]" value="'+data["ventas"][i]["venta_idventas"]+'">';
        html+='<div class="panel-heading"  id="color'+data["ventas"][i]["venta_idventas"]+'"  style="font-color: #fff;" role="tab" id="heading_5">';
        html+='<a role="button" data-toggle="collapse" href="#collapse_'+data["ventas"][i]["venta_idventas"]+'" aria-expanded="false" class="collapsed">';
        html+='<table width="100%">';
        html+='<tbody>';
        html+='<tr >';
        mesa_nombre="";

        if(parseInt(data["ventas"][i]["venta_codigomozo"])==0)
        {
          mesa_nombre="Delivery";
        }
        else{
          mesa_nombre = 'Mesa Vendida';
        }
        html+='<th width="10%" style="color: #fff;"><button class="btn btn-danger btn-rounded btn-xs">'+mesa_nombre+'</button></th>';


        html+='<th width="40%" class="texto_ser'+data["ventas"][i]["venta_idventas"]+'" ">Venta '+data["ventas"][i]["venta_idventas"]+'['+data["ventas"][i]["venta_fecha_preparacion"]+']</th>';

        html+='<th width="20%" id="tiempo_total'+data["ventas"][i]["venta_idventas"]+'"  class="texto_ser'+data["ventas"][i]["venta_idventas"]+'"></th>';

        html+='<th width="10%"><button class="btn btn-primary" onclick="copiarventa('+data["ventas"][i]["venta_idventas"]+')" >Copiar Venta</button></th>';
        html+='</tr>';
        html+='</tbody>';
        html+='</table>';
        html+='</a>'; 
        html+='</div>';

        html+='<div id="collapse_'+data["ventas"][i]["venta_idventas"]+'" class="panel-collapse collapse " role="tabpanel" aria-expanded="false" style="height: 0px;">';

        html+='<div class="panel-body pa-15"> ';
        html+='<div class="row">';
        html+='<div class="col-md-1"></div>';
        html+='<div class="col-md-10">';
        html+=' <table width="100%" style=" border: 1px solid black;">';
        html+='<thead >';
        html+='  <tr style=" border: 1px solid black;" >';
        html+='<th width="10%" style=" border: 1px solid black;"><b style="font-weight: bold !important;">cant.</b></th>';
        html+='<th width="30%" style=" border: 1px solid black;"><b style="font-weight: bold !important;">Producto</b></th>';
        html+='<th width="10%" style=" border: 1px solid black;"><b style="font-weight: bold !important;">tipo</b></th>';
        html+='<th width="10%" style=" border: 1px solid black;"><b style="font-weight: bold !important;">Observaciones</b></th>';





        html+='</tr>';
        html+='</thead>';
        html+='<tbody id="tabla_datos'+data["ventas"][i]["venta_idventas"]+'">';


        for (var j=0; j < data["ventas"][i]["lista"].length; j++) {
         var tol=data["ventas"][i]["lista"][j]["cantidad"]*data["ventas"][i]["lista"][j]["producto_precio"];
         html+=' <tr style=" border: 1px solid black;" >';
         html+='<td   style=" border: 1px solid black;">'+data["ventas"][i]["lista"][j]["cantidad"]+'</td>';
         html+='<td  style=" border: 1px solid black;">'+data["ventas"][i]["lista"][j]["producto_descripcion"]+'</td>';
         html+='<td  style=" border: 1px solid black;">'+data["ventas"][i]["lista"][j]["tipoentrega_descripcion"]+'</td>';
         html+='<td  style=" border: 1px solid black;">'+data["ventas"][i]["lista"][j]["descripcion"]+'</td>';


         html+='</tr>';
       }
       html+='</tbody>';
       html+='</table>';
       html+='</div>';
       html+=' </div>';
       html+='</div>';
       html+='</div>';
       html+="</div>"; 
     }
     html+=         '</div>'
     html+=       '</div>';
     html+=    '</div>';
     html+='</div>';
     $("#traer_ventas_modal").empty().append(html);
   }
 }
},"json");
}


function copiarventa(id){
  $("#cuerpo_venta").empty();
  var JSON=$.ajax({
    type: "POST",
    url:base_url+"Ventas/traerdetalleventas",
    data: {"idventa" : id,"idvendedor" : $("#idvendedor").val()},
    dataType: 'json',
    async: false}).responseText;
  var data=jQuery.parseJSON(JSON); 
  html='';
  for(i=0; i < data["detalleventa"].length;i++ ){
   subtotal=parseFloat(data["detalleventa"][i]["precio"])*parseFloat(data["detalleventa"][i]["cantidad"]);
   html+='<tr id="cuerpo_tabla'+data["detalleventa"][i]["cod_producto_venta"]+'" class="2 danger" data-item-id="2" style="padding: 0px !important;">';
   html+='<center>';
   html+='<td  >';
   html+='<input name="id_producto[]" id="id_producto'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data["detalleventa"][i]["cod_producto_venta"]+'">';
   html+='<input name="estado_preparado[]" id="estado_preparado'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="0">';
   html+='<input name="comentarioventa[]" id="comentarioventa'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data["detalleventa"][i]["descripcion"]+'">';

   html+='<button type="button" class="btn btn-block btn-xs edit btn-warning" id="1526743222604" data-item="2">';
   html+='<span class="sname" id="name_1526743222604">'+data["detalleventa"][i]["producto_descripcion"]+'</span>';
   html+='</button>';
   html+='</td>';
   html+='</center>';
   html+='<center>';
   html+='<td  style="width: 15%;text-align:center;" class="text-right">';

   html+='<div class="input-group bootstrap-touchspin">';
   html+='<span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>';
   html+='<input class="vertical-spin form-control" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+parseFloat(data["detalleventa"][i]["precio"])+'" id="precio'+data["detalleventa"][i]["cod_producto_venta"]+'" name="precio[]" style="display: block;" readonly>';
   html+='</div>';
   html+='</td>';
   html+='<td  style="width: 15%;text-align:center;">';
   html+='<div class="input-group bootstrap-touchspin"><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input class="vertical-spin form-control" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+data["detalleventa"][i]["cantidad"]+'" name="cantidad[]" id="cantidad'+data["detalleventa"][i]["cod_producto_venta"]+'" style="display: block;" readonly></div>';
   html+='</td>';
   html+='</center>';
   html+='<center><td style="width:20%;text-align:center;" class="text-right"><span class="text-right " id="subtotal'+data["detalleventa"][i]["cod_producto_venta"]+'">'+subtotal.toFixed(2)+'</span></td></center>';
   html+='<center><td style="width: 30px;text-align:center;" class="text-center"><i class="fa fa-trash-o tip pointer posdel" id="1526743222604" title="Eliminar" onclick="eliminar_producto('+data["detalleventa"][i]["cod_producto_venta"]+')"></i></td></center>';
   html+=' </tr>';

 }
 $("#cuerpo_venta").prepend(html);
 $("#traer_ventas_modal").hide();
 generar_notificacion("EXITOSO","SE REGISTRO CORRECTAMENTE LA VENTA","success","#fec107");
        //$('#id_mozo').val(data["venta"][0]["venta_codigomozo"]).trigger('add');
        //$('#id_mozo').select2('data', {id:data["venta"][0]["venta_codigomozo"] , a_key: 'Lorem Ipsum'});
        nombre = data["venta"][0]["empleado_nombres"]+ ' ' + data["venta"][0]["empleado_apellidos"];
        $('#id_mozo').append($("<option/>").val(data["venta"][0]["venta_codigomozo"]).text(nombre)).val(data["venta"][0]["venta_codigomozo"]).trigger("change");
        $("#idsilla").val(data["venta"][0]["venta_codigosilla"]);
        $("#estado_venta").val(data["venta"][0]["venta_estado"]);
        total_venta();
      }
      function mesaselect(id){
        idubicacion = id.substring(1, id.length);
        identificador = id.substring(0, 1);
        $("#idsilla").val(idubicacion);
        $("#identificador").val(identificador);
        $.post(base_url+"Mostrador/detalleventa",{"id":idubicacion},function(data){
          if (data["estadoventa"] == 1) {
            id_tipo  = 0;
            idalmacen =0;
            precio = 0;
            html = '';
            for (var i = 0; i < data.detalleventa.length; i++) {
              subtotal=parseFloat(data["detalleventa"][i]["precio"])*parseFloat(data["detalleventa"][i]["cantidad"]); 
              html+='<tr id="cuerpo_tablatotraido'+data.detalleventa[i]["cod_producto_venta"]+'" class="2 danger" data-item-id="2" style="padding: 0px !important;">';
              html+='<center>';
              html+='<td style="width: 30%;" >';
              html+='<input name="id_productotraido[]" id="id_productotraido'+data.detalleventa[i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data.detalleventa[i]["cod_producto_venta"]+'">';
              html+='<input name="comentarioventatraido[]" id="comentarioventatraido'+data.detalleventa[i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+$("#descripcion").val()+'">';
              html+='<input name="estado_preparadotraido[]" id="estado_preparadotraido'+data.detalleventa[i]["cod_producto_venta"]+'" type="hidden" class="rid" value="0">';
              html+='<input name="id_tipotraido[]" id="id_tipotraido'+data.detalleventa[i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+id_tipo+'">';
              html+='<input name="detalle_almacentraido[]" id="detalle_almacentraido'+data.detalleventa[i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+idalmacen+'">';

              html+='<button type="button" class="btn btn-block btn-xs edit btn-warning btndetalle" id="btndetalle" style="" data-item="2">';
              html+='<span style="" class="sname spandetalle" id="name_1526743222604">'+data.detalleventa[i]["producto_descripcion"]+'</span>';
              html+='</button>';
              html+='</td>';
              html+='</center>';
              html+='<center>';
              html+='<td  style="width: 15%;text-align:center;" class="text-right">';

              html+='<div class="input-group bootstrap-touchspin">';
              html+='<span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>';
              html+='<input class="vertical-spin form-control divletra" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+parseFloat(data.detalleventa[i]["precio"])+'" id="preciotraido'+data.detalleventa[i]["cod_producto_venta"]+'" name="preciotraido[]" style="display: block;" readonly>';
              html+='</div>';
              html+='</td>';
              html+='<td  style="width: 15%;text-align:center;">';
              html+='<div class="input-group bootstrap-touchspin"><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input class="vertical-spin form-control divletra" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+parseFloat(data.detalleventa[i]["cantidad"])+'" name="cantidadtraido[]" id="cantidadtraido'+data.detalleventa[i]["cod_producto_venta"]+'" style="display: block;" readonly></div>';
              html+='</td>';
              html+='</center>';
              html+='<center><td style="width:20%;text-align:center;" class="text-right"><span class="text-right " id="subtotaltraido'+data.detalleventa[i]["cod_producto_venta"]+'">'+(subtotal.toFixed(2))+'</span></td></center>';
              html+='<center><td style="width: 30px;text-align:center;" class="text-center"><i class="fa fa-trash-o tip pointer posdel" id="1526743222604" title="Eliminar" onclick="eliminar_producto()"></i></td></center>';
              html+=' </tr>';
              $("#cuerpotraidos").empty().append(html);
              total_venta();
            }
          }else{
            $("#cuerpotraidos").empty();
            total_venta();
          }
        },'json');
      }  
    </script>
    <script>
      <?php  if(isset($data["data_actualizar"])) {?>  
       $(function(){
        var JSON=$.ajax({
          type: "POST",
          url:base_url+"Ventas/traerdetalleventas",
          data: {"idventa" : $("#idventa").val(),"idvendedor" : $("#idvendedor").val()},
          dataType: 'json',
          async: false}).responseText;
        var data=jQuery.parseJSON(JSON); 
        html='';
        for(i=0; i < data["detalleventa"].length;i++ ){
         subtotal=parseFloat(data["detalleventa"][i]["precio"])*parseFloat(data["detalleventa"][i]["cantidad"]);
         html+='<tr id="cuerpo_tabla'+data["detalleventa"][i]["cod_producto_venta"]+'" class="2 danger" data-item-id="2" style="padding: 0px !important;">';
         html+='<center>';
         html+='<td  >';
         html+='<input name="id_producto[]" id="id_producto'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data["detalleventa"][i]["cod_producto_venta"]+'">';
         html+='<input name="estado_preparado[]" id="estado_preparado'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data["detalleventa"][i]["detalle_estado_preparado"]+'">';
         html+='<input name="comentarioventa[]" id="comentarioventa'+data["detalleventa"][i]["cod_producto_venta"]+'" type="hidden" class="rid" value="'+data["detalleventa"][i]["descripcion"]+'">';

         html+='<button type="button" class="btn btn-block btn-xs edit btn-warning" id="1526743222604" data-item="2">';
         html+='<span class="sname" id="name_1526743222604">'+data["detalleventa"][i]["producto_descripcion"]+'</span>';
         html+='</button>';
         html+='</td>';
         html+='</center>';
         html+='<center>';
         html+='<td  style="width: 15%;text-align:center;" class="text-right">';

         html+='<div class="input-group bootstrap-touchspin">';
         html+='<span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span>';
         html+='<input class="vertical-spin form-control" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+parseFloat(data["detalleventa"][i]["precio"])+'" id="precio'+data["detalleventa"][i]["cod_producto_venta"]+'" name="precio[]" style="display: block;" readonly>';
         html+='</div>';
         html+='</td>';
         html+='<td  style="width: 15%;text-align:center;">';
         html+='<div class="input-group bootstrap-touchspin"><span class="input-group-addon bootstrap-touchspin-prefix" style="display: none;"></span><input class="vertical-spin form-control" type="text" data-bts-button-down-class="btn btn-default" data-bts-button-up-class="btn btn-default" value="'+data["detalleventa"][i]["cantidad"]+'" name="cantidad[]" id="cantidad'+data["detalleventa"][i]["cod_producto_venta"]+'" style="display: block;" readonly></div>';
         html+='</td>';
         html+='</center>';
         html+='<center><td style="width:20%;text-align:center;" class="text-right"><span class="text-right " id="subtotal'+data["detalleventa"][i]["cod_producto_venta"]+'">'+subtotal.toFixed(2)+'</span></td></center>';
         html+='<center><td style="width: 30px;text-align:center;" class="text-center"><i class="fa fa-trash-o tip pointer posdel" id="1526743222604" title="Eliminar" onclick="eliminar_producto('+data["detalleventa"][i]["cod_producto_venta"]+')"></i></td></center>';
         html+=' </tr>';

       }
       $("#cuerpotraidos").prepend(html);
        //$('#id_mozo').val(data["venta"][0]["venta_codigomozo"]).trigger('add');
        //$('#id_mozo').select2('data', {id:data["venta"][0]["venta_codigomozo"] , a_key: 'Lorem Ipsum'});
        nombre = data["venta"][0]["empleado_nombres"]+ ' ' + data["venta"][0]["empleado_apellidos"];
        $('#id_mozo').append($("<option/>").val(data["venta"][0]["venta_codigomozo"]).text(nombre)).val(data["venta"][0]["venta_codigomozo"]).trigger("change");
        $("#idsilla").val(data["venta"][0]["venta_codigosilla"]);
        $("#estado_venta").val(data["venta"][0]["venta_estado"]);
        total_venta();

      });
<?php } ?>
<?php if ($_COOKIE["usuario_perfil"] == 2) { ?>
  $(function(){
    id_mozo = $("#id_usuario").val();
    nombre_mozo = $("#nombre_mozo").val();
    $('#id_mozo').append($("<option/>").val(id_mozo).text(nombre_mozo)).val(id_mozo).trigger("change"); 
  });

  <?php } ?>
  var globalvariable = 0;

  $(function(){
    var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
    $('.js-switch-1').each(function() {
      new Switchery($(this)[0], $(this).data());
    });

  });
  $(function () {
    valorAtributoNuevo = "";
  // $("#martin").attr("content", valorAtributoNuevo);
});
  $(function(){
    if(localStorage.getItem("ivg_venta")){
      if(localStorage.ivg_venta=="1")
      {
        $("#igv").prop('checked',true);
      }
    }

    $("#credito").hide();
  });

  $("#cant_add").click(function(){

    total = $("#stock").val() - $("#cant_add").val();
    if (total < 0) {
      $("#stocktotal").text($("#stock").val());
      $("#cant_add").val('1');
    }else{
      $("#stocktotal").text(total);
    }

  });
  $("#cant_add").change(function(){

    total = $("#stock").val() - $("#cant_add").val();
    if (total < 0) {
      $("#stocktotal").text($("#stock").val());
      $("#cant_add").val('1');
    }else{
      $("#stocktotal").text(total);
    }
  });

  $('#cliente').select2({
    ajax: {
      url: base_url+'pedido/buscar_cliente1/',
      dataType: 'json',
      placeholder: 'Buscar Cliente',
      maximumSelectionLength: 10,

      data: function (params) {
        return {
                    q: params.term, // search term
                    id: $("#tipo_comprabante").val(),
                    totalpago: $("#total_pagar_modal").text(),
                    page: params.page
                  };
                },
                processResults: function (data, params) {

                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used


                return {
                  results: data.results

                };
              },
              cache: true
    // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
  },


        escapeMarkup: function (markup) { return markup; }, // let our custom formatter work

        templateResult: formatRepo, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelection, // omitted for brevity, see the source of this page

        language: {

          noResults: function() {

            return "No hay resultado";        
          },
          searching: function() {

            return "Buscando..";
          }
        }
      });


  $("#guardarcantidad").click(function(){

  });

</script>



