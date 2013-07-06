app.config ($routeProvider) ->
  $routeProvider.when '/',
    controller: 'RoomsController'
    templateUrl: '/rooms.html'

  .when '/rooms/:id',
    controller: 'RoomController'
    templateUrl: (params) -> 
      "/rooms/#{params.id}.html"