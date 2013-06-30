app.config ($routeProvider) ->
  $routeProvider.when '/',
    controller: 'RoomsController'
    templateUrl: '/rooms.html'