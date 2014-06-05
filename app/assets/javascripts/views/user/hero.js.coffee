class Descendants.Views.Hero extends Backbone.View

  window: $(window)

  initialize: ->
    @renderOnImageLoad()
    @window.resize(@render).trigger('resize')

  renderOnImageLoad: ->
    @img = $('<img/>')
    @img.attr('src', @$('img').attr('src'))
    .load =>
      @width = @img[0].width
      @height = @img[0].height
      @render()

  render: =>
    if @wider()
      @$el.removeClass().addClass 'wider'
    else
      @$el.removeClass().addClass 'taller'

  wider: ->
    @windowAspect() > @imageAspect()

  windowAspect: ->
    @window.width() / @window.height()

  imageAspect: ->
    @width / @height
