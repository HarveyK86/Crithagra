module = angular.module("crithagra.resource")

module.factory("Resource", ["$resource", "$log", ($resource, $log) ->
    self = this

    self.request

    self.init = () ->
        self.log("init")
        self.request = $resource("https://serinus-harveyk86.c9.io/api/:model/:id", {model: "@model", id: "@id"},

            search:
                method: "POST"
                url: "https://serinus-harveyk86.c9.io/api/:model/search"
                isArray: true

            create:
                method: "POST"

            get:
                method: "GET"

            getAll:
                method: "GET"
                isArray: true

            getLightweight:
                method: "GET"
                url: "https://serinus-harveyk86.c9.io/api/:model/head/:id"

            getAllLightweight:
                method: "GET"
                url: "http://serinus-harveyk86.c9.io/api/:model/head"
                isArray: true

            override:
                method: "PUT"

            update:
                method: "PATCH"

            delete:
                method: "DELETE"
        )

    self.search = (model, searchParameters, callback) ->
        self.log("search[model=" + model + ", searchParameters=" + searchParameters + ", callback=" + (callback != null) + "]")
        self.request.search(model: model, searchParameters, (results) ->
            self.log("search[model=" + model + ", searchParameters=" + searchParameters + ", callback=" + (callback != null) + ", returns=" + results + "]")
            callback(results)
        )

    self.create = (model, modelMap, callback) ->
        self.log("create[model=" + model + ", modelMap=" + modelMap + ", callback=" + (callback != null) + "]")
        self.request.create(model: model, modelMap, (result) ->
            self.log("create[model=" + model + ", modelMap=" + modelMap + ", callback=" + (callback != null) + ", returns=" + result + "]")
            callback(result)
        )

    self.get = (model, id, callback) ->
        self.log("get[model=" + model + ", id=" + id + ", callback=" + (callback != null) + "]")
        self.request.get({model: model, id: id}, (result) ->
            self.log("get[model=" + model + ", id=" + id + ", callback=" + (callback != null) + ", returns=" + result + "]")
            callback(result)
        )

    self.getAll = (model, callback) ->
        self.log("getAll[model=" + model + ", callback=" + (callback != null) + "]")
        self.request.getAll(model: model, (results) ->
            self.log("getAll[model=" + model + ", callback=" + (callback != null) + ", returns=" + results + "]")
            callback(results);
        )

    self.getLightweight = (model, id, callback) ->
        self.log("getLightweight[model=" + model + ", callback=" + (callback != null) + "]")
        self.request.getLightweight({model: model, id: id}, (result) ->
            self.log("getLightweight[model=" + model + ", id=" + id + ", callback=" + (callback != null) + ", returns=" + result + "]")
            callback(result)
        )

    self.getAllLightweight = (model, callback) ->
        self.log("getAllLightweight[model=" + model + ", callback=" + (callback != null) + "]")
        self.request.getAllLightweight(model: model, (results) ->
            self.log("getAllLightweight[model=" + model + ", callback=" + (callback != null) + ", returns=" + results + "]")
            callback(results)
        )

    self.override = (model, modelMap, callback) ->
        self.log("override[model=" + model + ", modelMap=" + modelMap + ", callback=" + (callback != null) + "]")
        self.request.override({model: model, id: modelMap.id}, modelMap, callback)

    self.update = (model, modelMap, callback) ->
        self.log("update[model=" + model + ", modelMap=" + modelMap + ", callback=" + (callback != null) + "]")
        self.request.update({model: model, id: modelMap.id}, modelMap, callback)

    self.delete = (model, id, callback) ->
        self.log("delete[model=" + model + ", id=" + id + ", callback=" + (callback != null) + "]")
        self.request.delete({model: model, id: id}, callback)

    self.log = (message) ->
        $log.log("Resource : " + message)

    self.init()

    search: self.search
    create: self.create
    get: self.get
    getAll: self.getAll
    getLightweight: self.getLightweight
    getAllLightweight: self.getAllLightweight
    override: self.override
    update: self.update
    delete: self.delete
])