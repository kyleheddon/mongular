app.config ($routeProvider) ->
  $routeProvider.when '/',
    controller: 'RoomsController'
    templateUrl: '/rooms.html'

  .when '/rooms/:name',
    controller: 'RoomController'
    templateUrl: (params) -> 
      "/rooms/#{params.name}.html"