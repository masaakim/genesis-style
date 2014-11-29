module.exports = (grunt) ->
  grunt.initConfig
    sass:
      dist:
        files:
          "build/default.css": "scss/default.scss"

    connect:
      app:
        options:
          port: 2020
          base: "build/"
          open: "http://localhost:2020"

    csscomb:
      dist:
        options:
          config: ".csscombrc"
        files:
          "build/default.css": ["build/default.css"]

    watch:
      options:
        livereload: true
      stylesheets:
        files: ["scss/*.scss"]
        tasks: ["stylesheet"]

  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-csscomb"

  grunt.registerTask "default", [
    "connect:app"
    "watch"
  ]
  grunt.registerTask "publish", [
    "sass"
    "csscomb"
  ]

  return
