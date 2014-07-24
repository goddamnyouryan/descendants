class Descendants.Views.Director extends Backbone.View
  el: 'body'

  content: -> @$('section#content')
  template: JST['director']

  initialize: (options) ->
    @slug = options.slug

  render: ->
    @director = new Descendants.Models.Director slug: @slug
    @director.fetch
      success: =>
        new Descendants.Views.Videos director: @director
        @featured = @director.get('featured')
        @showVideo @featured
      failure: ->
        alert 'Something went wrong.'

  showVideo: (video) ->
    @content().fadeOut 400, =>
      @content().html(@template
                      director: @director
                      videos: @director.get('videos').models
                      featured: video)
                    .fadeIn()
      videojs(@featured.get('slug')).ready ->
        this.play()
