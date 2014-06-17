if window.atom
  {$} = require 'atom'
else
  $ = require 'jquery'

replacement = require './replacement'

module.exports =

  activate: (state) ->
    atom.workspaceView.on 'markdown-preview:markdown-changed', @replace

  replace: =>
    replacement.replaceIntro()
    replacement.replaceHelper()
    replacement.replaceAdmonitions()
    replacement.replaceOSBlocks()
    replacement.replaceCommandLine()
