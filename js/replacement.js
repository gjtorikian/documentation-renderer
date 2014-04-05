(function() {
  var $, ADMONITIONS, OSES, _s;

  if (window.atom) {
    
  } else {
    $ = require('jquery');
  }

  _s = require('underscore.string');

  ADMONITIONS = ["tip", "warning", "error"];

  OSES = ["mac", "windows", "linux", "all"];

  module.exports = {
    replaceIntro: function() {
      var introQuery;
      introQuery = "p:contains('{{\#intro}}')";
      return $(".markdown-preview " + introQuery + ", .markdown-body " + introQuery).each(function(idx, el) {
        var contents;
        contents = $(el).nextUntil("p:contains('{{/intro}}')");
        contents.next().remove();
        $(el).replaceWith("<p class='intro'>" + contents.html() + "</p>");
        return contents.remove();
      });
    },
    replaceCommandLine: function() {
      return $(".markdown-preview code.lang-command-line").each(function(idx, el) {
        var contents;
        contents = $(el).html();
        contents = contents.split("\n").map(function(line) {
          line = line.replace(/^\$ (.+)$/g, function(m, l) {
            return "<span class=\"command\">" + (_s.strip(l)) + "</span>";
          });
          line = line.replace(/^(\# .+)$/g, function(m, l) {
            return "<span class=\"comment\">" + (_s.strip(l)) + "</span>";
          });
          return line = line.replace(/^&gt; (.+)$/g, function(m, l) {
            return "<span class=\"output\"><span># </span>" + (_s.strip(l));
          });
        });
        return $(el).parent().replaceWith("<pre class='command-line'>" + contents.join("\n") + "</pre>");
      });
    },
    replaceHelper: function() {
      return $(".markdown-preview code.lang-helper").each(function(idx, el) {
        var contents;
        contents = $(el).html();
        contents = contents.replace(/####\s*(.+)/, "<h4 class='header'>$1</h4>").replace(/\n/, "<div class='content'>").replace(/\n/, "</div>");
        return $(el).parent().replaceWith("<div class='helper'>" + contents + "</pre>");
      });
    },
    replaceAdmonitions: function(type) {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = ADMONITIONS.length; _i < _len; _i++) {
        type = ADMONITIONS[_i];
        _results.push($(".markdown-preview p:contains('{{\#" + type + "}}')").each(function(idx, el) {
          var contents, tip_wrapper;
          contents = $(el).nextUntil("p:contains('{{/" + type + "}}')");
          contents.next().remove();
          tip_wrapper = $(("<div class='alert " + type + "'>") + contents.html() + "</div>");
          $(el).replaceWith(tip_wrapper);
          return contents.remove();
        }));
      }
      return _results;
    },
    replaceOSBlocks: function(type) {
      var os, osQuery, _i, _len, _results;
      _results = [];
      for (_i = 0, _len = OSES.length; _i < _len; _i++) {
        os = OSES[_i];
        osQuery = "p:contains('{{\#" + os + "}}')";
        _results.push($(".markdown-preview " + osQuery + ", .markdown-body " + osQuery).each(function(idx, el) {
          var contents, tip_wrapper;
          contents = $(el).nextUntil("p:contains('{{/" + os + "}}')");
          contents.next().remove();
          tip_wrapper = $(("<div class='platform-" + os + "'>") + contents.html() + "</div>");
          $(el).replaceWith(tip_wrapper);
          return contents.remove();
        }));
      }
      return _results;
    }
  };

}).call(this);
