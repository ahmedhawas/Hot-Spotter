window.onload = function () {
document.body.insertAdjacentHTML( 'beforeEnd', '<iframe id="my-like-frame" style="display:none;"></iframe>' );
document.addEventListener( 'click', function ( event ) {
    var myLike = event.target;
    if( myLike.className.indexOf( 'my-like' ) > -1 ) {
        var frame = document.getElementById( 'my-like-frame' ),
            liked = ( myLike.className == 'my-liked' ),
            command = liked ? 'unlike' : 'like',
            reblog = myLike.getAttribute( 'data-reblog' ),
            id = myLike.getAttribute( 'data-id' ),
            oauth = reblog.slice( -8 );
        frame.src = 'http://www.tumblr.com/' + command + '/' + oauth + '?id=' + id;
        liked ? myLike.className = 'my-like' : myLike.className = 'my-liked';
    };
}, false );
};