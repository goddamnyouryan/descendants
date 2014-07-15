class Descendants.Views.Director extends Backbone.View

  content: -> @$('section#content')
  template: JST['director']

  events: ->
    'click ul#directors a': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).data('slug')
    @director = new Descendants.Models.Director slug: slug
    @director.fetch
      success: =>
        @content().fadeOut 400, =>
          @featured = @director.get('featured')
          @content().html(@template
                          director: @director
                          videos: @director.get('videos').models
                          featured: @featured)
                        .fadeIn()
          videojs @featured.get('slug'), {}, ->
      failure: ->
        alert 'Something went wrong.'
