class Descendants.Views.Twinkling extends Backbone.View
  el: 'body'

  initialize: (options) ->
    @starCount = 20
    @imagesCount = 10
    @width = $(window).width()
    @height = $(window).height()
    setInterval @twinkle, 3000

  twinkle: =>
    image = new Image()
    x = Math.floor( Math.random() * @width)
    y = Math.floor( Math.random() * @height)
    image = document.createElement 'img'
    image.src = "/stars/twinkle.gif"
    image.style.left = "#{x}px"
    image.style.top = "#{y}px"
    image.style.opacity = 0
    image.className = 'star'
    @$el.append image
    setTimeout @fadeInStar, 500
    setTimeout @removeStars, 1500

  fadeInStar: =>
    @$('img.star').css('opacity', 0.9)

  removeStars: =>
    stars = @$('img.star')
    stars.first().css('opacity', 0).remove() if stars.length > 2
