class Descendants.Views.Slideshow extends Backbone.View

  initialize: =>
    @activate @$('img').first()
    @centerMenu()
    setInterval @cycleImages, 5000

  events: ->
    'mouseenter a': 'showImage'

  activate: (img) ->
    @active = img
    id = $(img).attr('id')
    @$('img, a').removeClass 'active'
    @$("img##{id}, a##{id}").addClass 'active'

  cycleImages: =>
    next = @images().index(@active) + 1
    if next > @images().length - 1
      @activate @images()[0]
    else
      @activate @images()[next]

  images: ->
    @$('img')

  showImage: (event) ->
    id = $(event.target).attr('id')
    @activate @$("img##{id}")

  centerMenu: ->
    nav = @$('nav')
    ul = @$('nav ul')
    width = if $(window).width() < ul.outerWidth() then 300 else ul.outerWidth()
    nav.css 'height', ul.outerHeight()
    nav.css 'width', width
