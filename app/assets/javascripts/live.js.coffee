source = new EventSource('/updates/live')
source.addEventListener 'message', (e) ->
  alert e.data