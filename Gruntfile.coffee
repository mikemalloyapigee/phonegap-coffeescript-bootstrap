module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true
          cwd: './coffeescript'
          src: '**/*.coffee'
          dest: '.'
          ext: '.js'
        ]
    watch:
      files: ['Gruntfile.coffee','./coffeescript/*.coffee','./coffeescript/www/js/*.coffee']
      tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']