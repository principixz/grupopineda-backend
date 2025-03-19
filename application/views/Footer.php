 
 
 
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper --> 
 
 <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
 
    </div>
      &copy; 2021 <a href="#">JJ. INGENIEROS</a>. TODO LOS DERECHOS RESERVADOS.
  </footer>
  <!-- Control Sidebar -->
 
  
  <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
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
            <li role="presentation" class=""><a data-toggle="tab" id="profile_tab_7" role="tab" href="#profile_7" style="top: 20px;" aria-expanded="false">DNI</a></li>

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
<style type="text/css">
  .logo{
    display: none !important;
  }
</style>
 <?php include("Layout/js.php"); ?>
    

</body>

<!-- Mirrored from html-templates.multipurposethemes.com/bootstrap-4/admin/unique/02/unique-admin/music-dashboard/pages/samplepage/blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 02 Apr 2019 15:18:11 GMT -->
</html>

