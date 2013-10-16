
function resize() {
    var height = $(window).height();
    var width = $(window).width() - $(window).width()*(0.3 + 0.04);

    $("#googleMap").css('height' , 500);
    $("#googleMap").css('width' , width - width*0.06);

}