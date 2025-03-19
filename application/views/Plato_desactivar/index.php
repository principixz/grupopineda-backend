	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
<style type="text/css">
  
   .slow  .toggle-group { transition: left 0.7s; -webkit-transition: left 0.7s; }
</style>
  <div class="row">
<div style="padding-left: 40px !important;padding-right: 40px;" class="col-md-12">

	<form  style="">
                <input type="text" id="Search" onkeyup="buscar()" class="form-control" placeholder="Buscar Platos"> 
			</form>
	</div>
<br>

<div style="margin-top: 10px;" class="col-md-12">

	<div style="padding-left: 30px !important;padding-right: 30px !important;" class="row" id="cargar_plato">

<?php foreach ($data["tabla"] as $key => $value) {
  # code...
 ?>

	<div class="col-md-4 target " id="div_cuerpo_<?php echo $value["producto_id"]; ?>" style="margin-top:5px; margin-bottom:5px;">
    <label class="buscar" style="display: none;"><?php echo $value["producto_descripcion"];?>-<?php echo $value["producto_id"];?></label>
		<div style="border: 1px solid black !important;padding: 0px !important; margin: 0px !important;" class="box" >
			
              <div style="padding-top: 5px !important; padding-bottom: 5px !important;" class="box-body">
              <div class="row">
                 <div style="padding:0px !important;margin:0px !important;" class="col-md-4">
                <img style="width: 100%;height: 100px;" onerror="this.src='<?php echo base_url(); ?>public/default.jpg';" src="<?php echo base_url(); ?>public/img/productos/<?php echo $value["producto_imagen"];?>" class="img-responsive" alt="Product Image">
               </div>

               <div style="padding:0px !important;margin:0px !important;" class="col-md-6">
                <h6 class="claseproducto" style="font-size: 20px;line-height:82%;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;border-top-width: 0px;border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;margin-left: 5px;margin-right: 0px;"><?php echo $value["producto_descripcion"];?></h6>
               </div>

                 <div class="col-md-2">
                  <?php if( $value["producto_encendido"]=="1"){ ?>
                   <input type="checkbox" id="seleccionar_<?php echo $value["producto_id"];?>" onchange="enviar_datos(<?php echo $value["producto_id"]; ?>)" checked data-toggle="toggle" data-size="xs" data-style="slow">

                 <?php } else{?>
                   <input type="checkbox" id="seleccionar_<?php echo $value["producto_id"];?>"  onchange="enviar_datos(<?php echo $value["producto_id"] ?>)" data-toggle="toggle" data-size="xs" data-style="slow">


                 <?php } ?>
                 </div>

              </div>
              </div>
              
            </div>
	</div>

<?php } ?>











</div>
	
</div>


</div>

<script type="text/javascript">

  function buscar()
  {

               let  input = document.getElementById("Search"); 
              //console.log(input);
               let filter = input.value.toUpperCase();
               console.log(filter);
               $(".target").show();
               
                $('.target .buscar').each(function(index, elem){
                  console.log($(elem).text());
             if($(elem).text().toUpperCase().includes(filter)) 
                    { //Not hidden 
                      

                      } 
                     else { 
                         let id_t=$(elem).text().split("-");
                         $("#div_cuerpo_"+id_t[1]).hide(); 
                      //$(elem).hide(); 


                    } 
                });
  }
  function enviar_datos(id)
  {
   // alert(id);
    let c=0;
   if($("#seleccionar_"+id).prop("checked")){
   // alert();
   c=1;
   }
    $.post(base_url+"Plato_desactivar/prender_producto",{"id":id,"estado":c},
      function(response){
               
    },"json");



  }
  /*$(function(){
    $.post(base_url+"Plato_desactivar/cargar_platos",{"categoriaproducto":""},function(response){
      let html="";

       //alert();
           if(response.length!=0)
           {
                   
              for (var i = 0; i < response.length; i++) {
               // reponse[i]
               



                html+='<div class="col-md-4" style="margin-top:5px; margin-bottom:5px;">';
                  html+=' <div style="border: 1px solid black !important;padding: 0px !important; margin: 0px !important;" class="box">';
                    
                     html+='        <div style="padding-top: 5px !important; padding-bottom: 5px !important;" class="box-body">';
                        html+='     <div class="row">';
                           html+='     <div style="padding:0px !important;margin:0px !important;" class="col-md-4">';
                           html+='    <img style="width: 100%;height: 100px;" src="https://sanguchonwasi.selvafood.com/public/img/productos/'+response[i]["producto_imagen"]+'" class="img-responsive" alt="Product Image">';
                           html+='   </div>';

                           html+='   <div style="padding:0px !important;margin:0px !important;" class="col-md-6">';
                             html+='  <h6 class="claseproducto" style="font-size: 20px;line-height:82%;padding-top: 0px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;border-top-width: 0px;border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;margin-left: 5px;margin-right: 0px;">'+response[i]["producto_descripcion"]+'</h6>';
                          html+='    </div>';

                            html+='    <div class="col-md-2">';
                             html+='     <input type="checkbox"  data-toggle="toggle" data-size="xs" data-style="slow">';
                               html+=' </div>';

                          html+='   </div>';
                        html+='     </div>';
                            
                      html+='     </div>';
             html+='    </div>';


              }
              $("#cargar_plato").empty().append(html);



           }
    },"json");
  });*/
</script>