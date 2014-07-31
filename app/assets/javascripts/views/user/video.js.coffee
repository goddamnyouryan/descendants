class Descendants.Views.Video extends Backbone.View
  el: 'body'

  player: -> @$('.video-js').first()
  title: -> @$('div.title')

  videoPlayer: JST['partials/_video_player']
  videoInfo: JST['partials/_video_info']

  initialize: (options) ->
    @video = new Descendants.Models.Video slug: options.slug
    videojs(@player()[0]).dispose()
    # create a blank element to then replace content as dispose above removes content
    $('#hero').html '<div class="video-js"></div>'
    @video.fetch
      success: =>
        @loadContent @player(), @videoPlayer(video: @video, preload: 'auto'), true
        @loadContent @title(), @videoInfo(video: @video, director: @director)

  loadContent: (element, content, player = false) ->
    element.fadeOut 400, =>
      element.replaceWith(content).fadeIn()
      new Descendants.Views.Player video: @video if player
