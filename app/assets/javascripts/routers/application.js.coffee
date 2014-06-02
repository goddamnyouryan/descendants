class Descendants.Routers.Application extends Backbone.Router

  routes: ->
    '': 'home'
    'admin/directors/:director/videos/new': 'videoForm'
    'admin/directors/:director/videos/:video/edit': 'videoForm'

  home: ->
    console.log 'home'

  videoForm: (director, video) ->
    new Descendants.Views.VideoForm el: '#s3_uploader'
