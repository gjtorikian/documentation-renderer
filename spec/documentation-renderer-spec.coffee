path = require 'path'
{WorkspaceView} = require 'atom'
temp = require 'temp'
wrench = require 'wrench'

DocumentationRenderer = require '../lib/documentation-renderer'
{MarkdownPreviewView} = require 'atom'

originalText = preview = null

renderMarkdown = (file) ->
  waitsForPromise ->
    atom.workspace.open(file)

  runs ->
    originalText = atom.workspace.getActiveEditor().getText()
    atom.workspaceView.trigger 'markdown-preview:toggle'

  waitsFor ->
    [editorPane, previewPane] = atom.workspaceView.getPaneViews()
    preview = previewPane.getActiveItem()
    preview?

describe "Documentation renderer package", ->
  activationPromise = null

  beforeEach ->
    fixturesPath = path.join(__dirname, 'fixtures')
    tempPath = temp.mkdirSync('atom')
    wrench.copyDirSyncRecursive(fixturesPath, tempPath, forceDelete: true)
    atom.project.setPath(tempPath)

    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model

    waitsForPromise ->
      atom.packages.activatePackage("markdown-preview")

    waitsForPromise ->
      atom.packages.activatePackage('documentation-renderer')

    atom.workspaceView.attachToDom()

  describe "when the markdown preview is triggered", ->

    beforeEach ->
      atom.workspaceView.attachToDom()

      renderMarkdown("markup.md")

    it "handles intro text", ->
      expect(preview.find("p.intro")).toBeDefined()
      expect(preview.text()).not.toMatch(/\#\{intro\}/)

    it "handles command line", ->
      expect(preview.find("span.command")).toBeDefined()
      expect(preview.text()).not.toMatch(/pre class='command-line'/)

    it "handles helper", ->
      expect(preview.find("div.helper")).toBeDefined()
      expect(preview.text()).not.toMatch(/pre class='helper'/)

    it "handles oses", ->
      expect(preview.find("div.platform-mac")).toBeDefined()
      expect(preview.text()).not.toMatch(/\#\{mac\}/)

      expect(preview.find("div.platform-windows")).toBeDefined()
      expect(preview.text()).not.toMatch(/\#\{windows\}/)

      expect(preview.find("div.platform-linux")).toBeDefined()
      expect(preview.text()).not.toMatch(/\#\{linux\}/)

      expect(preview.find("div.platform-all")).toBeDefined()
      expect(preview.text()).not.toMatch(/\#\{all\}/)

    it "handles admonitions", ->
      expect(preview.find("div.alert.tip")).toBeDefined()
      expect(preview.html()).not.toMatch(/\{\#tip\}/)

      expect(preview.find("div.alert.warning")).toBeDefined()
      expect(preview.html()).not.toMatch(/\{\#warning\}/)

      expect(preview.find("div.alert.error")).toBeDefined()
      expect(preview.html()).not.toMatch(/\{\#error\}/)
