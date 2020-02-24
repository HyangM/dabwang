<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style>
.pmd-range-slider .noUi-handle:before,
.pmd-range-slider.noUi-horizontal .noUi-handle-upper .noUi-tooltip:before, .pmd-range-slider.noUi-horizontal .noUi-handle-lower .noUi-tooltip:before,
.pmd-range-slider .noUi-tooltip,
.pmd-range-slider .noUi-connect{
  background:#ffcc66 !important;
  color:#676767 !important
}
     
.pmd-range-slider .noUi-pips .noUi-marker-horizontal{
  background: #676767 !important;
}

input{
  width:30px;
  border:0px;
  border-bottom:1px solid #ffcc66;
}

.container {
  display: flex;
}
.container > div {
  flex: 1; /*grow*/
}

</style> -->
</head>
<body>
<!-- Jquery js -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Slider js -->
<script src="http://propeller.in/components/range-slider/js/wNumb.js"></script>
<script src="http://propeller.in/components/range-slider/js/nouislider.js"></script>
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/range-slider/css/nouislider.min.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/textfield/css/textfield.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/checkbox/css/checkbox.css">
<link rel="stylesheet" type="text/css" href="http://propeller.in/components/range-slider/css/range-slider.css">

<div class="container">
<!-- Slider -->
<div id="pmd-slider-value-range"  class="pmd-range-slider" min="0" max="200"></div>	



   

  </div>
  
 <script>


	var pmdSliderValueRange = document.getElementById('pmd-slider-value-range');

	noUiSlider.create(pmdSliderValueRange, {
		start: [ 20, 80 ], // Handle start position
		connect: true, // Display a colored bar between the handles
		tooltips: [ wNumb({ decimals: 0 }), wNumb({ decimals: 0 }) ],
		format: wNumb({
			decimals: 0,
			thousand: '',
			postfix: '',
		}),
		range: { // Slider can select '0' to '100'
			'min': 0,
			'max': 100
		},
   step: 5,
		  pips: { 
			  mode: 'steps',
			  density: 10
		  }
	});

	var valueMax = document.getElementById('value-max'),
		valueMin = document.getElementById('value-min');
	
	// When the slider value changes, update the input and span
	pmdSliderValueRange.noUiSlider.on('update', function( values, handle ) {
		if ( handle ) {
			valueMax.value = values[handle];
		} else {
			valueMin.value = values[handle];
		}
	});	

 </script>
</body>
</html>