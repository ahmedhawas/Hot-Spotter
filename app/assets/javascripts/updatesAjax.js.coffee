@CommentPoller =
  poll: ->
    setTimeout @request, 5000
  
  request: ->
    $.get($('.updateContent').data('url'), after: $('.update').last().data('id'))
  
  addComments: (updates) ->
    if updates.length > 0
      $('.updateContent').append($(updates).hide())
    @poll()
  
  showComments: (e) ->
    e.preventDefault()
    $('.update').show()

jQuery ->
  if $('.updateContent').length > 0
    CommentPoller.poll()