$(function() {
  $('.update-like').click(function(e) {
    var self = $(this),
        likes = self.next('.like-count')
        count = likes.text();

    self.find('.heart').toggleClass('my-like');
    likes.text(count + 1);

    $.getJSON('/updates/like/' + self.data('id'), function(data) {
      if ( data.error ) {
        // remove the my-like class
        // decrement the like count by 1
      }

    });
  });
});