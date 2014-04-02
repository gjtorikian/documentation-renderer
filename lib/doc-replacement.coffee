{$} = require 'atom'
ADMONITIONS = ["tip", "warning", "error"]

module.exports =
  replaceIntro: ->
    $(".markdown-preview p:contains('{{#intro}}')").each (idx, el) ->
      contents = $(el).nextUntil("p:contains('{{/intro}}')");
      contents.next().remove()
      $(el).replaceWith("<p class='intro'>" + contents.html() + "</p>")
      contents.remove()

  replaceAdmonitions: (type) ->
    for type in ADMONITIONS
      $(".markdown-preview p:contains('{{\##{type}}}')").each (idx, el) ->
        contents = $(el).nextUntil("p:contains('{{/#{type}}}')");
        contents.next().remove()
        tip_wrapper = $("<div class='alert tip'>" + contents.html() + "</div>");
        $(el).replaceWith(tip_wrapper)
        contents.remove()

  replaceHelper: ->
    $(".markdown-preview pre[lang=helper]").each (idx, el) ->
      contents = $(el).children().html()
      contents = contents.replace(/####\s*(.+)/, "<h4 class='header'>$1</h4>").replace(/\n/, "<div class='content'>").replace(/\n/, "</div>")
      $(el).replaceWith("<div class='helper'>" + contents + "</div>")

  replaceCommandLine: ->
    $(".markdown-preview pre[lang=command-line]").each (idx, el) ->
      contents: $(el).children().html()
      $(el).replaceWith("<pre class='command-line'>" + contents + "</pre>")
