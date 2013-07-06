app.controller 'UsersController', ($scope, $resource) ->
  User = $resource('/users/')
  $scope.submit_name = (name) ->
    User.save({ name: $scope.name })