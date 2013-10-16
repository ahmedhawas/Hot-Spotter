$(function() {
  $('.update-like').click(function(e) {
    var self = $(this),
        likes = self.next('.like-count'),
        heart = self.find('.heart'),
        count = parseInt(likes.text(), 10);
        
    heart.toggleClass('my-like');
    heart.hasClass('my-like') ? likes.text(count + 1) : likes.text(count - 1);

    $.getJSON(self.attr('href'), function(data) {
      if ( data.error ) {
        // remove the my-like class
        // decrement the like count by 1
      }
    });

    return false;
  });
});