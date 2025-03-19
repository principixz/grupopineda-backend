/*Form advanced Init*/
$(document).ready(function() {
"use strict";

/* Select2 Init*/


/* Bootstrap Select Init*/
$('.selectpicker').selectpicker();

/* Switchery Init*/


/* Bootstrap-TouchSpin Init*/
$(".vertical-spin").TouchSpin({
	verticalbuttons: true,
	verticalupclass: 'ti-plus',
	verticaldownclass: 'ti-minus'
});
var vspinTrue = $(".vertical-spin").TouchSpin({
	verticalbuttons: true
});
if (vspinTrue) {
	$('.vertical-spin').prev('.bootstrap-touchspin-prefix').remove();
}

$("input[name='tch1']").TouchSpin({
	min: 0,
	max: 100,
	step: 0.1,
	decimals: 2,
	boostat: 5,
	maxboostedstep: 10,
	postfix: '%'
});
$("input[name='tch2']").TouchSpin({
	min: -1000000000,
	max: 1000000000,
	stepinterval: 50,
	maxboostedstep: 10000000,
	prefix: '$'
});
$("input[name='tch3']").TouchSpin();

$("input[name='tch3_22']").TouchSpin({
	initval: 40
});

$("input[name='tch5']").TouchSpin({
	prefix: "pre",
	postfix: "post"
});


/* Bootstrap switch Init*/
$('.bs-switch').bootstrapSwitch('state', true);


});