class Descendants.Views.Player extends Backbone.View

  initialize: (options) ->
    videojs(options.id).ready ->
      this.play()
      $('video').one 'loadedmetadata', ->
        aspectRatio = ($(this).prop('videoHeight') / $(this).prop('videoWidth')) * 100
        $('.video-js').css 'padding-top', "#{aspectRatio}%"

    this.stopListening()
