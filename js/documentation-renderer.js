(function() {
  var $, replacement,
    _this = this;

  if (window.atom) {
    
  } else {
    $ = require('jquery');
  }

  replacement = require('./replacement');

  module.exports = {
    activate: function(state) {
      return atom.workspaceView.on('markdown-preview:markdown-changed', this.replace);
    },
    replace: function() {
      return setTimeout(function() {
        replacement.replaceIntro();
        replacement.replaceHelper();
        replacement.replaceAdmonitions();
        replacement.replaceOSBlocks();
        return replacement.replaceCommandLine();
      }, 0);
    }
  };

}).call(this);
