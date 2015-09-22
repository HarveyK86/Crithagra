config = ($routeProvider) ->
    $routeProvider.when("/", templateUrl: "templates/index.template.html")
    $routeProvider.when("/login", templateUrl: "templates/login.template.html")
    $routeProvider.when("/post", templateUrl: "templates/post.template.html")

module = angular.module("crithagra", ["crithagra.controller", "crithagra.resource", "ngResource", "ngRoute"])
module.config(["$routeProvider", config])

angular.module("crithagra.controller", ["crithagra.resource"])
angular.module("crithagra.resource", ["ngResource"])