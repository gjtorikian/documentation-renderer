if window.atom
  {$} = require 'atom'
else
  $ = require 'jquery'

_s = require 'underscore.string'

ADMONITIONS = ["tip", "warning", "error"]
OSES = ["mac", "windows", "linux", "all"]

module.exports =
  replaceIntro: ->
    introQuery = "p:contains('{{\#intro}}')"
    $(".markdown-preview #{introQuery}, .markdown-body #{introQuery}").each (idx, el) ->
      contents = $(el).nextUntil("p:contains('{{/intro}}')");
      contents.next().remove()
      $(el).replaceWith("<p class='intro'>" + contents.html() + "</p>")
      contents.remove()

  replaceCommandLine: ->
    $(".markdown-preview code.lang-command-line, .markdown-body pre[lang='command-line'] code").each (idx, el) ->
      contents = $(el).html()

      contents = contents.split("\n").map (line) ->
        line = line.replace(/^\$ (.+)$/g, (m, l) ->
          "<span class=\"command\">#{_s.strip(l)}</span>")
        line = line.replace(/^(\# .+)$/g, (m, l) ->
          "<span class=\"comment\">#{_s.strip(l)}</span>")
        line = line.replace(/^&gt; (.+)$/g, (m, l) ->
          "<span class=\"output\"><span># </span>#{_s.strip(l)}")

      $(el).parent().replaceWith("<pre class='command-line'>" + contents.join("\n") + "</pre>")

  replaceHelper: ->
    $(".markdown-preview code.lang-helper, .markdown-body pre[lang='helper'] code").each (idx, el) ->
      contents = $(el).html()

      contents = contents.replace(/####\s*(.+)/, "<h4 class='header'>$1</h4>").replace(/\n/, "<div class='content'>").replace(/\n/, "</div>")

      $(el).parent().replaceWith("<div class='helper'>" + contents + "</pre>")

  replaceAdmonitions: (type) ->
    for type in ADMONITIONS
      typeQuery = "p:contains('{{\##{type}}}')"
      $(".markdown-preview #{typeQuery}, .markdown-body #{typeQuery}").each (idx, el) ->
        contents = $(el).nextUntil("p:contains('{{/#{type}}}')");
        contents.next().remove()
        tip_wrapper = $("<div class='alert #{type}'>" + contents.html() + "</div>");
        $(el).replaceWith(tip_wrapper)
        contents.remove()

  replaceOSBlocks: (type) ->
    for os in OSES
      osQuery = "p:contains('{{\##{os}}}')"
      $(".markdown-preview #{osQuery}, .markdown-body #{osQuery}").each (idx, el) ->
        contents = $(el).nextUntil("p:contains('{{/#{os}}}')");
        contents.next().remove()
        tip_wrapper = $("<div class='platform-#{os}'>" + contents.html() + "</div>");
        $(el).replaceWith(tip_wrapper)
        contents.remove()
