app.controller 'RoomController', ($scope, $resource, $routeParams, socket) ->
  Room = $resource('/rooms/:id.json', { id: $routeParams.id })
  $scope.room = Room.get()

  listen_for_new_messages = ->
    socket.on "#{$routeParams.id}_message_created", (message) ->
      $scope.room.messages.push(message)
      #alert socket.state


  $scope.submit_message = ->
    socket.trigger('new_message', { room_id: $scope.room.id, message: $scope.new_message })
    $scope.new_message = {}

  listen_for_new_messages()

  $(window).on 'pageshow', ->
    socket.reconnect()
    listen_for_new_messages()
    #alert socket.state