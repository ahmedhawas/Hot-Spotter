source = new EventSource('/updates/live')
source.addEventListener 'message', (e) ->
  message = $.parseJSON(e.data)
  alert(message)