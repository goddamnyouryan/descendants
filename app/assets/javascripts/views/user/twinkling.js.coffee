class Descendants.Views.Twinkling extends Backbone.View
  el: 'body'

  initialize: (options) ->
    @starCount = 100
    @imagesCount = 10
    @width = $(window).width()
    @height = $(window).height()
    @images = []
    @stars = []
    @setupImages()
    @addStars()
    setInterval @twinkle, 750

  setupImages: ->
    number = 0
    while number < @imagesCount
      image = new Image()
      image.src = "/stars/star#{number}.png"
      @images.push image
      number++

  addStars: ->
    stars = 0
    while stars < @starCount
      x = Math.floor( Math.random() * @width)
      y = Math.floor( Math.random() * @height)
      image = document.createElement 'img'
      image.src = @images[stars % 10].src
      image.style.left = "#{x}px"
      image.style.top = "#{y}px"
      image.className = 'star'
      @stars.push image
      @$el.append image
      stars++

  twinkle: =>
    n = 1 # change 10 stars every time twinkle is called

    while n <= 50
      s = Math.floor(Math.random() * @starCount)
      image = @stars[s]
      p = Math.floor(Math.random() * 10)
      image.src = @images[p].src
      ++n
    return
