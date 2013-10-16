// $(document).ready(function(){
// 	$('.profileIcon').click(function() {
// 		$('.profileColumn').animate({right:"0px"},500);     
//    			},function () {
//        	$('.profileColumn').animate({right: "-150px"},500);
// 	});

// )};

$(document).ready(function(){
    $(".profileIcon").click(function() {
        // $('#profileColumn').hide('slide', {direction: 'right'}, 1000);
     //    $('#profileColumn').animate({
     // 	left: '-=150px'
   		// }, 500);
    	$('#profileColumn').fadeTo(3000, 0.5);
    });
)};

// $(document).ready(function() {
//   $('#slidemarginleft button').click(function() {
//     var $marginLefty = $(this).next();
//     $marginLefty.animate({
//       marginLeft: parseInt($marginLefty.css('marginLeft'),10) == 0 ?
//         $marginLefty.outerWidth() :
//         0
//     });
//   });
// });