app.controller 'UsersController', ($scope, $resource) ->
  User = $resource('/users/')

  $scope.submit_name = (name) ->
    User.save( {}, $scope.user, user_submitted )

  user_submitted = (user) ->
    alert "hello, #{user.name}!"