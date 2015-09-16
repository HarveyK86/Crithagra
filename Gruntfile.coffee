module.exports = (grunt) ->

    grunt.registerTask("default", ["build"])
    grunt.loadNpmTasks("grunt-contrib-clean")
    grunt.loadNpmTasks("grunt-contrib-coffee")
    grunt.loadNpmTasks("grunt-contrib-concat")
    grunt.loadNpmTasks("grunt-contrib-copy")
    grunt.loadNpmTasks("grunt-contrib-cssmin")
    grunt.loadNpmTasks("grunt-contrib-uglify")
    grunt.loadNpmTasks("grunt-contrib-watch")

    grunt.initConfig(

        pkg: grunt.file.readJSON("package.json")

        #grunt-contrib-clean
        clean:

            build:
                src: ["build/**"]

            coffee_build:
                src: ["build/coffee/**"]

        #grunt-contrib-coffee
        coffee:

            convert_to_js:
                files: "build/js/crithagra.js":
                    ["build/coffee/crithagra.coffee"]

        #grunt-contrib-concat
        concat:

            coffee:
                src: ["src/coffee/crithagra.coffee",
                      "src/coffee/controller/*.coffee",
                      "src/coffee/resource/*.coffee"]
                dest: "build/coffee/crithagra.coffee"

            css:
                src: ["bower_components/bootstrap/dist/css/bootstrap.css",
                      "src/css/**/*.css"]
                dest: "build/css/crithagra.css"

            js:
                src: ["bower_components/angular/angular.js",
                      "bower_components/angular-resource/angular-resource.js",
                      "bower_components/angular-route/angular-route.js",
                      "build/js/crithagra.js"]
                dest: "build/js/crithagra.js"

        #grunt-contrib-copy
        copy:

            fonts:
                src: ["bower_components/bootstrap/dist/fonts/*"]
                dest: "build/fonts/"
                expand: true
                flatten: true

            html:
                src: ["src/html/*.html"]
                dest: "build/"
                expand: true
                flatten: true

            templates:
                src: ["src/html/templates/*.template.html"]
                dest: "build/templates/"
                expand: true
                flatten: true

        #grunt-contrib-cssmin
        cssmin:

                minify_css:
                    files: "build/css/crithagra.min.css":
                        ["build/css/crithagra.css"]

        #grunt-contrib-uglify
        uglify:

                minify_js:
                    files: "build/js/crithagra.min.js":
                        ["build/js/crithagra.js"]

        #grunt-contrib-watch
        watch_files:

                coffee:
                    files: ["src/coffee/**/*.coffee"]
                    tasks: ["concat:coffee",
                            "coffee:convert_to_js",
                            "clean:coffee_build",
                            "concat:js",
                            "uglify:minify_js"]

                css:
                    files: ["src/css/**/*.css"]
                    tasks: ["concat:css",
                            "cssmin:minify_css"]

                html:
                    files: ["src/html/*.html"]
                    tasks: ["copy:html"]

                templates:
                    files: ["src/html/templates/*.template.html"]
                    tasks: ["copy:templates"]
    )

    grunt.registerTask("build", ["clean:build",
                                 "concat:coffee",
                                 "coffee:convert_to_js",
                                 "clean:coffee_build",
                                 "concat:js",
                                 "uglify:minify_js",
                                 "concat:css",
                                 "cssmin:minify_css",
                                 "copy:fonts",
                                 "copy:html",
                                 "copy:templates"])

    grunt.renameTask("watch", "watch_files")
    grunt.registerTask("watch", ["build",
                                 "watch_files"])