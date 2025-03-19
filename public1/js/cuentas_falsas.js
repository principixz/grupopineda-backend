
//
// A simple way to find prime numbers
// Please note the self refers to the worker context inside the worker.
self.addEventListener('message', function(e) {
    var data = e.data;
    var shouldRun = true;

    switch (data.cmd) {
        case 'stop':
            postMessage('Worker stopped the Pi calculation ' + data.msg + "<br/>");
            shouldRun = false;
            self.close(); // Terminates the worker.
            break;
        case 'start':
            for (var i =0 ; i < data.cantidad_falso ; i++){

                    numero_documento = data.numero_documento;
                    str = numero_documento;
                    res = str.split("-");
                    siguiente = parseInt(res[1])

                    var numbers = generar_falsas(data.tipo_registro_comprobante,numero_documento,data.fecha_registro,data.fecha_vencimiento,data.glosa,data.cantidad_falso);
                    postMessage("pi: "+ numbers + "<br/>");
                    siguiente = siguiente + 20;
                    numero_documento = res[0]+'-'+siguiente;

            }

            break;
        default:
            postMessage('Dude, unknown cmd: ' + data.msg);
    };
}, false);

// simple calculation Pi base on Leibniz formula for Pi
function generar_falsas(tipo_registro_comprobante,numero_documento,fecha_registro,fecha_vencimiento,glosa,cantidad_falso) {

    str = numero_documento;
    res = str.split("-");
    siguiente = parseInt(res[1]);

    cantidad = cantidad_falso;
    cantidaduni = parseInt(cantidad / 1000);
    resto = cantidad % 1000;

    for (var i = 0; i < 1; i++) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (xhttp.readyState === 4) {
                if (xhttp.status === 200) {
                    return 1;
                    console.log(xhr.responseText);
                } else {
                    return 2;
                    console.error(xhr.statusText);
                }
            }
        };
        xhttp.open("POST", "http://localhost/sistemacontabilidad/Cuentas_falsas/registrar_comprobantes_manuales/"+tipo_registro_comprobante+"/"+numero_documento+"/"+fecha_registro+"/"+fecha_vencimiento+"/"+glosa+"/"+cantidad_falso, true);
        xhttp.send();


    }




//     for (var i = 0; i < 1; i++) {
//         $.ajax({
//             url:  base_url+"Cuentas_falsas/registrar_comprobantes_manuales",
//             type: "POST",
//             data:{"tipo_registro_comprobante" : tipo_registro_comprobante,
// "numero_documento" :numero_documento ,"fecha_registro" :fecha_registro ,"fecha_vencimiento" :fecha_vencimiento ,"glosa" : glosa, "cantidad_falso" : cantidad_falso},
//             dataType: "json",
//             async: false, // La petición es síncrona
//             cache: false, // No queremos usar la caché del navegador
//             success: function(data){
//                 //$("#numero_documento").val(data);
//                 var numero_documento = data;
//             },error: function(err){
//                 alert("ERROR NO SE PUEDE CONECTAR AL SERVIDOR REVISE SU INTERNET");
//                 $("#scroll_table_comprobante").removeClass("fondo_carga");
//                 $("#texto_cargar").hide();
//             }
//         }); 
//     }

}
