class Descendants.Views.Videos extends Backbone.View
  el: 'ul.videos'

  template: JST['video_player']

  events: ->
    'click li': 'openOverlay'

  openOverlay: (event) ->
    event.preventDefault()
    @video = new Descendants.Models.Video slug: $(event.target).parents('li').data('slug')
    @video.fetch
      success: =>
        @overlay = new Descendants.Views.Overlay el: 'body', content: @template(video: @video)
        @overlay.render()
        videojs @video.get('slug'), {}, ->
          this.play()
