source = new EventSource('/updates/events')
source.addEventListener 'update.create', (e) ->
  update = $.parseJSON(e.data).update
  $('.updates').append($('<li>').text("#{update.comment}"))