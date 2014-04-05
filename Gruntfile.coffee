module.exports = (grunt) ->
  appName = 'documentation-renderer'

  coffeeConfig =
    glob_to_multiple:
      expand: true
      flatten: true
      src: [
        'lib/**/*.coffee'
      ]
      dest: './js'
      ext: '.js'

  lessConfig =
    dist:
      files:
        'css/documentation-renderer.css': './stylesheets/documentation-renderer.less'

  replaceConfig =
    example:
      src: ['js/*.js']
      overwrite: true,
      replacements: [from: "$ = require('atom').$;", to: '']

  browserifyConfig =
    main:
      files:
        "js/documentation-renderer-chrome.js": ['js/chrome.js']
      options:
        noParse: ['atom']

  grunt.initConfig
    coffee:
      coffeeConfig
    less:
      lessConfig
    replace:
      replaceConfig
    browserify:
      browserifyConfig

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-text-replace')

  grunt.registerTask('default', ['coffee', 'less', 'replace', 'browserify'])
