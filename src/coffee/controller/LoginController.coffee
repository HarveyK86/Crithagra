module = angular.module("crithagra.controller")

module.controller("LoginController", ["$scope", "$location", "$log", ($scope, $location, $log) ->
    self = this

    $scope.form

    self.init = () ->
        self.log("init")
        $scope.form =
            username: ""
            password: ""

    $scope.isLoggingIn = () ->
        self.log("isLoggingIn (path=" + $location.path() + ")")
        isLoggingIn = $location.path() == "/login"
        self.log("isLoggingIn[returns=" + isLoggingIn + "]")
        isLoggingIn

    $scope.isLoggedIn = () ->
        self.log("isLoggedIn")
        isLoggedIn = true #todo
        self.log("isLoggedIn[returns=" + isLoggedIn + "]")
        isLoggedIn

    $scope.isUsernameValid = () ->
        self.log("isUsernameValid")
        isUsernameValid = this.form.username != null && this.form.username != ""
        self.log("isUsernameValid[return=" + isUsernameValid + "]")
        isUsernameValid

    $scope.isPasswordValid = () ->
        self.log("isPasswordValid")
        isPasswordValid = this.form.password != null && this.form.password != ""
        self.log("isPasswordValid[return=" + isPasswordValid + "]")
        isPasswordValid

    $scope.isLoginable = () ->
        self.log("isLoginable")
        isLoginable = this.isUsernameValid() && this.isPasswordValid()
        self.log("isLoginable[returns=" + isLoginable + "]")
        isLoginable

    $scope.login = () ->
        self.log("login")
        #todo

    $scope.isLogoutable = () ->
        self.log("isLogoutable")
        isLogoutable = !this.isLoggingIn() && this.isLoggedIn()
        self.log("isLogoutable[returns=" + isLogoutable + "]")
        isLogoutable

    $scope.logout = () ->
        self.log("logout")
        # todo

    self.log = (message) ->
        $log.log("LoginController : " + message)

    self
])