class Descendants.Views.Overlay extends Backbone.View

  template: JST['overlay']

  contentDiv: ->
    $('.overlay-content')

  initialize: (options) ->
    @content = options.content
    @width = options.width

  render: ->
    $(@template()).hide().appendTo(@$el).fadeIn(300)
    @contentDiv().append @content
    @contentDiv().css('width', @width) if @width?
    this

  events: ->
    #'click': 'overlayClick'
    'click .close': 'removeOverlay'

  overlayClick: (event) ->
    target = $(event.target)
    unless target.hasClass('overlay-content') or target.parents('.overlay-content').length > 0
      @removeOverlay()

  removeOverlay: ->
    @trigger 'close'
    @$('.overlay').remove()
