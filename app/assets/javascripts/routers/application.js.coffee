class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  home: ->
    new Descendants.Views.Contact el: 'form'

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
