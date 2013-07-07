app.factory 'socket', ($rootScope) ->
  socket = new WebSocketRails(socket_location)

  {
    on: (event_name, callback) ->
      socket.bind event_name, ->
        args = arguments
        $rootScope.$apply ->
          callback.apply(socket, args)

    trigger: (event_name, data) ->
      socket.trigger(event_name, data)
  }