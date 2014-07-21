class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'directors/:slug': 'directorsShow'
    'the-joinery': 'joinery'
    'admin': 'adminBase'
    'admin/directors/:director/edit': 'directorForm'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  initialize: ->
    new Descendants.Views.Scroll

  home: =>
    new Descendants.Views.Home el: 'body', router: this
    new Descendants.Views.Slideshow el: 'div#slideshow'

  directorsShow: (slug) ->
    new Descendants.Views.Director(slug: slug).render()

  joinery: ->
    new Descendants.Views.Joinery el: 'body'

  adminBase: ->
    new Descendants.Views.Sortable

  directorForm: (director) ->
    new Descendants.Views.Sortable

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
