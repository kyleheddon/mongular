app.controller 'RoomController', ($scope, $resource, $routeParams) ->
  Room = $resource('/rooms/:id.json', { id: $routeParams.id })
  Message = $resource('/rooms/:id/messages.json', { id: $routeParams.id })
  $scope.room = Room.get()

  $scope.submit_message = ->
    message = Message.save(content: $scope.new_message.content) 
    $scope.room.messages.push message

    $scope.new_message = {}