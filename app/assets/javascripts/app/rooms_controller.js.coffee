app.controller 'RoomsController', ($scope, $resource) ->
  Room = $resource('/rooms/:id', { id: '@id' })
  $scope.rooms = Room.query()