class Descendants.Views.Videos extends Backbone.View
  el: 'body'

  player: -> @$('.video-js')
  title: -> @$('div.title')

  videoPlayer: JST['partials/_video_player']
  videoInfo: JST['partials/_video_info']

  initialize: (options) ->
    @director = options.director

  events: ->
    'click ul.videos a': 'loadVideo'

  loadVideo: (event) ->
    event.preventDefault()
    @video = new Descendants.Models.Video slug: $(event.target).parents('li').data('slug')
    @video.fetch
      success: =>
        @loadContent @player(), @videoPlayer(video: @video)
        @loadContent @title(), @videoInfo(video: @video, director: @director)
        videojs @video.get('slug'), {}, ->

  loadContent: (element, content) ->
    element.fadeOut 400, =>
      element.replaceWith(content).fadeIn()
