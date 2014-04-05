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

  compressConfig =
    main:
      options:
        archive: 'documentation-renderer.zip'
      src: ['css/*', 'js/*', 'vendor/*', 'manifest.json', '*.crx', '*.pem']
      dest: "."

  grunt.initConfig
    coffee:
      coffeeConfig
    less:
      lessConfig
    replace:
      replaceConfig
    browserify:
      browserifyConfig
    compress:
      compressConfig

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-text-replace')

  grunt.loadNpmTasks('grunt-contrib-compress')

  grunt.registerTask('default', ['coffee', 'less', 'replace', 'browserify'])

  grunt.registerTask('package', ['default', 'compress'])
