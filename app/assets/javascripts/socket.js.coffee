app.factory 'socket', ($rootScope) ->
  socket = new WebSocketRails(socket_location)

  reconnect_on_pageshow = ->
    $(window).on 'pageshow', ->
      callbacks = socket.callbacks
      delete socket.callbacks
      socket = new WebSocketRails(socket_location)
      socket.callbacks = callbacks

  reconnect_on_pageshow()

  {
    on: (event_name, callback) ->
      socket.bind event_name, ->
        args = arguments
        $rootScope.$apply ->
          callback.apply(socket, args)

    trigger: (event_name, data) ->
      socket.trigger(event_name, data)
  }