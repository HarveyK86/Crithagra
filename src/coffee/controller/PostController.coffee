module = angular.module("crithagra.controller")

module.controller("PostController", ["Resource", "$scope", "$log", (resource, $scope, $log) ->
    self = this

    $scope.posts = []

    self.init = () ->
        self.log("init")

        resource.getAll("post", (posts) ->
            $scope.posts = posts
        )

    self.log = (message) ->
        $log.log("PostController : " + message)

    init: self.init
])