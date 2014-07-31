class Descendants.Views.Player extends Backbone.View

  initialize: (options) ->
    @video = options.video
    video = videojs(@video.get('slug'))
    video.ready ->
      this.play()
      $('video').one 'loadedmetadata', ->
        aspectRatio = ($(this).prop('videoHeight') / $(this).prop('videoWidth')) * 100
        $('.video-js').css 'padding-top', "#{aspectRatio}%"
    this.stopListening()
    video.on 'ended', @playNext

  playNext: =>
    new Descendants.Views.Video slug: @video.get('next')
