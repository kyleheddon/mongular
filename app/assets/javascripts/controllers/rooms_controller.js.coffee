app.controller 'RoomsController', ($scope, $resource) ->
  Room = $resource('/rooms.json')
  $scope.rooms = Room.query()