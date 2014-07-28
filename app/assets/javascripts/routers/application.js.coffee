class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'about': 'about'
    'directors/:slug': 'directorsShow'
    'the-joinery': 'joinery'
    'lately': 'lately'
    'admin': 'adminBase'
    'admin/directors/:director/edit': 'directorForm'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  about: ->
    @home()
    $('a.scroll').click()

  home: =>
    new Descendants.Views.Scroll
    new Descendants.Views.DirectorList el: 'body', router: this
    new Descendants.Views.Slideshow el: 'div#slideshow'

  directorsShow: (slug) ->
    new Descendants.Views.Director(slug: slug).render()

  joinery: ->
    new Descendants.Views.DirectorList el: 'body', router: this

  lately: ->
    new Descendants.Views.Lately el: 'ul#feed'

  adminBase: ->
    new Descendants.Views.Sortable

  directorForm: (director) ->
    new Descendants.Views.Sortable

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
