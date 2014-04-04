{$} = require 'atom'
replacement = require './replacement'

module.exports =

  activate: (state) ->
    atom.workspaceView.on 'markdown-preview:markdown-changed', @replace

  replace: =>
    setTimeout( ->
      replacement.replaceIntro()
      replacement.replaceHelper()
      replacement.replaceAdmonitions()
      replacement.replaceOSBlocks()
      replacement.replaceCommandLine()
    , 0)
