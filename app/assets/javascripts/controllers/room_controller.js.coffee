app.controller 'RoomController', ($scope, $resource, $routeParams) ->
  Room = $resource('/rooms/:id.json', { id: $routeParams.id })
  Message = $resource('/rooms/:id/messages.json', { id: $routeParams.id })
  $scope.room = Room.get()

  $scope.submit_message = ->
    Message.save({}, $scope.new_message, message_submitted) 

  message_submitted = (message) ->
    console.log(message)