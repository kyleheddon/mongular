app.controller 'RoomsController', ($scope, $resource) ->
  Room = $resource('/rooms.json')
  $scope.rooms = Room.query()

  $scope.create_room = ->
    Room.save( {}, $scope.new_room, room_submitted )

  room_submitted = (room) ->
    $scope.rooms.push(room)
