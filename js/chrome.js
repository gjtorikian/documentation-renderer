(function() {
  var $, DocumentationRenderer;

  DocumentationRenderer = require('./documentation-renderer');

  $ = require('jquery');

  $(document).ready(function() {
    return DocumentationRenderer.replace();
  });

}).call(this);
