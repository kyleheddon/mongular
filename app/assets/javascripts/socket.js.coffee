app.factory 'socket', ($rootScope, $route) ->
  socket = new WebSocketRails(socket_location)

  reconnect = ->
    callbacks = socket.callbacks
    delete this.socket
    socket = new WebSocketRails(socket_location)
    socket.callbacks = callbacks
    $(window).trigger('reconnect_socket')
    socket

  $(window).on('pageshow', reconnect)

  {
    on: (event_name, callback) ->
      socket.bind event_name, ->
        args = arguments
        $rootScope.$apply ->
          callback.apply(socket, args)

    on_reconnect: (callback) ->
      $(window).on 'reconnect_socket', ->
        $rootScope.$apply ->
          callback.apply(socket)

    trigger: (event_name, data) ->
      if !socket.trigger(event_name, data)
        reconnect().trigger(event_name, data)
        window.location.reload()
  }