{$} = require 'atom'
doc_replacement = require './doc-replacement'

module.exports =

  activate: (state) ->
    atom.workspaceView.on 'uri-opened', @replacement

  replacement: =>
    markdownPane = atom.workspace.activePaneItem
    return unless /^markdown-preview:/.test markdownPane.getUri()

    setTimeout( ->
      doc_replacement.replaceIntro()
      doc_replacement.replaceHelper()

      doc_replacement.replaceAdmonitions()

      doc_replacement.replaceCommandLine()
    , 500)
