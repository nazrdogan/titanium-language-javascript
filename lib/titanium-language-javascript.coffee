TitaniumLanguageJavascriptView = require './titanium-language-javascript-view'
{CompositeDisposable} = require 'atom'

module.exports = TitaniumLanguageJavascript =
  titaniumLanguageJavascriptView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @titaniumLanguageJavascriptView = new TitaniumLanguageJavascriptView(state.titaniumLanguageJavascriptViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @titaniumLanguageJavascriptView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'titanium-language-javascript:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @titaniumLanguageJavascriptView.destroy()

  serialize: ->
    titaniumLanguageJavascriptViewState: @titaniumLanguageJavascriptView.serialize()

  toggle: ->
    console.log 'TitaniumLanguageJavascript was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
