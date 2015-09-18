module = angular.module("crithagra.controller")

module.controller("PostController", ["Resource", "$scope", "$log", (resource, $scope, $log) ->
    self = this

    self.adding = null
    $scope.posts

    $scope.init = () ->
        self.log("init")
        resource.getAll("post", (posts) ->
            $scope.posts = posts
        )

    $scope.isAddable = () ->
        self.log("isAddable")
        isAddable = true
        self.log("isAddable[returns=" + isAddable + "]")
        isAddable

    $scope.isAdding = () ->
        self.log("isAdding")
        isAdding = self.adding != null
        self.log("isAdding[returns=" + isAdding + "]")
        isAdding

    $scope.add = () ->
        self.log("add")
        self.adding = {newTitle: "", newBody: "", editing: true}
        $scope.posts.push(self.adding)

    $scope.isEditable = (post) ->
        self.log("isEditable[post=" + post + "]")
        isEditable = true && !this.isEditing(post)
        self.log("isEditable[post=" + post + ", returns=" + isEditable + "]")
        isEditable

    $scope.isEditing = (post) ->
        self.log("isEditing[post=" + post + "]")
        isEditing = post.editing == true
        self.log("isEditing[post=" + post + ", returns=" + isEditing + "]")
        isEditing

    $scope.edit = (post) ->
        self.log("edit[post=" + post + "]")
        post.newTitle = post.title
        post.newBody = post.body
        post.editing = true

    $scope.isDeletable = (post) ->
        self.log("isDeletable[post=" + post + "]")
        isDeletable = true && !this.isEditing(post)
        self.log("isDeletable[post=" + post + ", returns=" + isDeletable + "]")
        isDeletable

    $scope.delete = (post) ->
        self.log("delete[post=" + post + "]")
        resource.delete("post", post.id, this.init)

    $scope.isNewTitleValid = (post) ->
        self.log("isNewTitleValid[post=" + post + "]")
        isNewTitleValid = post.newTitle != null && post.newTitle != ""
        self.log("isNewTitleValid[post=" + post + ", returns=" + isNewTitleValid + "]")
        isNewTitleValid

    $scope.isNewBodyValid = (post) ->
        self.log("isNewBodyValid[post=" + post + "]")
        isNewBodyValid = post.newBody != null && post.newBody != ""
        self.log("isNewBodyValid[post=" + post + ", returns=" + isNewBodyValid + "]")
        isNewBodyValid

    $scope.isConfirmable = (post) ->
        self.log("isConfirmable[post=" + post + "]")
        isConfirmable = this.isNewTitleValid(post) && this.isNewBodyValid(post) && this.isEditing(post)
        self.log("isConfirmable[post=" + post + ", returns=" + isConfirmable + "]")
        isConfirmable

    $scope.confirm = (post) ->
        self.log("confirm[post=" + post + "]")
        post.title = post.newTitle
        post.body = post.newBody
        if self.adding == post
            this.cancel(post)
            resource.create("post", post, this.init)
        else
            this.cancel(post)
            resource.override("post", post, this.init)

    $scope.isCancelable = (post) ->
        self.log("isCancelable[post=" + post + "]")
        isCancelable = this.isEditing(post)
        self.log("isCancelable[post=" + post + ", returns=" + isCancelable + "]")
        isCancelable

    $scope.cancel = (post) ->
        self.log("cancel[post=" + post + "]")
        if self.adding == post
            this.posts.pop()
            self.adding = null
        post.newTitle = undefined
        post.newBody = undefined
        post.editing = undefined

    self.log = (message) ->
        $log.log("PostController : " + message)

    self
])