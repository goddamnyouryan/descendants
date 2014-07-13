class Descendants.Views.Slideshow extends Backbone.View

  initialize: ->
    @$('img').first().show()
    @centerMenu()

  events: ->
    'mouseenter a': 'showImage'

  showImage: (event) ->
    id = $(event.target).attr('id')
    @$('img').hide()
    @$("img##{id}").show()

  centerMenu: ->
    nav = @$('nav')
    ul = @$('nav ul')
    nav.css 'height', ul.outerHeight()
    nav.css 'width', ul.outerWidth()
