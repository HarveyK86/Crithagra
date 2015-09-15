config = ($routeProvider) ->
    $routeProvider.when("/post", templateUrl: "templates/post.template.html")

angular.module("org.canary.crithagra", ["ngRoute"]).config(["$routeProvider", config])