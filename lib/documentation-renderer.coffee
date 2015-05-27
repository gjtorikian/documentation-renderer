$ = require 'jquery'
{Emitter, Disposable, CompositeDisposable} = require 'atom'
emitter = new Emitter

replacement = require './replacement'

module.exports =

  activate: (state) ->
    emitter.on 'markdown-preview:markdown-changed', @replace

  replace: =>
    replacement.replaceIntro()
    replacement.replaceHelper()
    replacement.replaceAdmonitions()
    replacement.replaceOSBlocks()
    replacement.replaceCommandLine()
