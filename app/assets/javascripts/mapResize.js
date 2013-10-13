
function resize() {
    var height = $(window).height();
    var width = $(window).width() - $(window).width()*(0.3 + 0.04);

    $("#googleMap").css('height' , height);
    $("#googleMap").css('width' , width);

}