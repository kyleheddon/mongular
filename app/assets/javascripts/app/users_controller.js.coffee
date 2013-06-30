app.controller 'UsersController', ($scope, $resource) ->
  Session = $resource('/users/')
  $scope.submit_name = (name) ->
    Session.save({ name: $scope.name })