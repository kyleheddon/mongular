app.factory 'socket', ($rootScope) ->
  socket = new WebSocketRails(socket_location)

  reconnect = ->
    callbacks = socket.callbacks
    delete socket.callbacks
    socket = new WebSocketRails(socket_location)
    socket.callbacks = callbacks
    socket

  $(window).on('pageshow', reconnect)

  {
    on: (event_name, callback) ->
      socket.bind event_name, ->
        args = arguments
        $rootScope.$apply ->
          callback.apply(socket, args)

    trigger: (event_name, data) ->
      if !socket.trigger(event_name, data)
        reconnect().trigger(event_name, data)
        window.location.reload()
  }