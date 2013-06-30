app.controller 'RoomController', ($scope, $resource, $routeParams) ->
  Room = $resource('/rooms/:id.json', { id: $routeParams.id })
  $scope.room = Room.get()