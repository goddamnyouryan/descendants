class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'directors/:slug': 'directorsShow'
    'admin': 'adminBase'
    'admin/directors/:director/edit': 'directorForm'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  home: ->
    new Descendants.Views.Videos
    new Descendants.Views.Director el: 'body'
    new Descendants.Views.Slideshow el: 'div#slideshow'

  directorsShow: (slug) ->
    new Descendants.Views.Videos

  adminBase: ->
    new Descendants.Views.Sortable

  directorForm: (director) ->
    new Descendants.Views.Sortable

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
