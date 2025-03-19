<!DOCTYPE html>
<html lang="es">


<!-- Mirrored from wrappixel.com/demos/admin-templates/admin-pro/main/pages-login-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 22:31:11 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo $empresa['empresa_icono'];?>">
    <title><?php echo $empresa["empresa_nombre_comercial"];?></title>
    <!-- Bootstrap Core CSS -->
    <link href="<?php echo base_url()?>public/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- page css -->
    <link href="<?php echo base_url()?>public/css/pages/login-register-lock.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?php echo base_url()?>public/css/style.css" rel="stylesheet">
    
    <!-- You can change the theme colors from here -->
    <link href="<?php echo base_url()?>public/css/colors/default-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style type="text/css">
    @media screen and (max-width: 1099px){
        #idimagen{
            width: 250px;
            }
    }
    @media screen and (min-width: 1100px) and (max-width: 1200px){
            #idimagen{
            width: 250px;
            }
    }
    @media screen and (min-width: 1201px) and (max-width: 1300px){
            #idimagen{
            width: 200px;
            }
    }

    @media screen and (min-width: 1301px) and (max-width: 1600px){
            #idimagen{
            width: 250px;
            }
    }
    @media screen and (min-width: 1601px) and (max-width: 2000px){
            #idimagen{
            width: 350px;
            }
    }
    @media screen and (min-width: 2001px) and (max-width: 2300px){
            #idimagen{
            width: 400px;
            }
    }


</style>
<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">La Selvatiña</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <section id="wrapper" class="login-register login-sidebar"  style="background-image:url(<?php echo $empresa["empresa_fondo"];?>);">
        <div class="login-box card">
            <div class="card-body">
                <form class="form-horizontal form-material"  id="form" >
                    <a href="javascript:void(0)" class="text-center db"><img style="width: 300px;"
                     src="<?php echo $empresa['empresa_icono'];?>" alt="Home" /><br/>
                        <!-- <img src="<?php echo base_url()?>public/assets/images/logo-text.png" alt="Home" /></a> -->
                        <div class="form-group m-t-40">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="usuario" name="usuario" required="" placeholder="Usuario">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" id="clave" name="clave" required=""  placeholder="Contraseña">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="checkbox checkbox-primary float-left p-t-0">
                                    <input id="checkbox-signup" checked="checked" type="checkbox" class="filled-in chk-col-light-blue">
                                    <label for="checkbox-signup"> Recordarme </label>
                                </div>
                               <!-- <a href="javascript:void(0)" id="to-recover" class="text-muted float-right"><i class="fa fa-lock m-r-5"></i> Olvide mi clave?</a>--> </div>
                            </div>
                            <div class="form-group text-center m-t-20">
                                <div class="col-xs-12">
                                    <button class="btn btn-info btn-lg btn-block text-uppercase btn-rounded" id="submit" type="button" name="submit" value="submit">Iniciar</button>
                                </div>
                            </div>
                    <div class="row" id="mensaje">
                        
                    </div>
                  <!--  <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                            <div class="social"><a href="javascript:void(0)" class="btn  btn-facebook" data-toggle="tooltip" title="Login with Facebook"> <i aria-hidden="true" class="fab fa-facebook-f"></i> </a> <a href="javascript:void(0)" class="btn btn-googleplus" data-toggle="tooltip" title="Login with Google"> <i aria-hidden="true" class="fab fa-google-plus-g"></i> </a> </div>
                        </div>
                    </div> -->
                 <!--   <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            Don't have an account? <a href="pages-register2.html" class="text-primary m-l-5"><b>Sign Up</b></a>
                        </div>
                    </div> -->
                </form>
                <!--<form class="form-horizontal" id="recoverform" action="https://wrappixel.com/demos/admin-templates/admin-pro/main/index.html">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>Recover Password</h3>
                            <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
                        </div>
                    </div>
                </form> -->
            </div>
        </div>
    </section>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<?php echo base_url()?>public/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<?php echo base_url()?>public/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="<?php echo base_url()?>public/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!--Custom JavaScript -->
    <script type="text/javascript">
        var base_url ="<?php echo base_url(); ?>";
        $(function() {
            $(".preloader").fadeOut();
        });
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        });
        // ============================================================== 
        // Login and Recover Password 
        // ============================================================== 
        $('#to-recover').on("click", function() {
            $("#form").slideUp();
            $("#recoverform").fadeIn();
        });

        $(document).ready(function(){
        // click on button submit
            $("#submit").on('click', function(){    
                if ($("#usuario").val() == "") {
                    $("#usuario").focus();
                    return 0;
                }
                if ($("#clave").val() == "") {
                    $("#clave").focus();
                    return 0;
                }
            // send ajax
            llamarfuncion();
            });
        });
document.querySelector('#clave').addEventListener('keypress', function (e) {
    var key = e.which || e.keyCode;
    if (key === 13) { // 13 is enter}
         if ($("#usuario").val() == "") {
                    $("#usuario").focus();
                    return 0;
                }
                if ($("#clave").val() == "") {
                    $("#clave").focus();
                    return 0;
                }
      llamarfuncion();
    }
});
document.querySelector('#usuario').addEventListener('keypress', function (e) {
    var key = e.which || e.keyCode;
    if (key === 13) { // 13 is enter}
         if ($("#usuario").val() == "") {
                    $("#usuario").focus();
                    return 0;
                }
                if ($("#clave").val() == "") {
                    $("#clave").focus();
                    return 0;
                }
      llamarfuncion();
    }
});
        function llamarfuncion(){
            $.ajax({
                url: base_url+'LoginController/Iniciar', // url where to submit the request
                type : "POST", // type of action POST || GET
                dataType : 'json', // data type
                data : $("#form").serialize(), // post data || get data
                success : function(result) {
                   if (result == 0) {
                        $("#mensaje").empty().html('<div class="alert alert-danger"> <i class="ti-user"></i>Lo sentimos el usuario o clave que ingreso es incorrecta<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button></div>');
                        return 0;
                   }
                   if(result == 2){
                    $("#mensaje").empty().html('<div class="alert alert-warning"> <i class="ti-user"></i>Lo sentimos el usuario está dado de baja<button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button></div>');
                        return 0;

                   }
                   if (result == 1) {
                     location.href = base_url+"LoginController";
                   }
                },
                error: function(xhr, resp, text) {
                    console.log(xhr, resp, text);
                }
            })
        }

    </script>
    
</body>


<!-- Mirrored from wrappixel.com/demos/admin-templates/admin-pro/main/pages-login-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 08 Jan 2019 22:31:11 GMT -->
</html>
