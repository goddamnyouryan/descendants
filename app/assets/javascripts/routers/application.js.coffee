class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'directors/:slug': 'directorsShow'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  home: ->
    new Descendants.Views.Contact el: 'form'
    new Descendants.Views.Directors el: 'body'

  directorsShow: (slug) ->
    new Descendants.Views.Directors el: 'body'

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
