class Descendants.Views.Director extends Backbone.View

  content: -> @$('section#content')
  template: JST['director']

  events: ->
    'click section#directors a': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).data('slug')
    @director = new Descendants.Models.Director slug: slug
    @director.fetch
      success: =>
        @content().fadeOut 400, =>
          @content().html(@template
                          director: @director
                          videos: @director.get('videos').models
                          featured: @director.get('featured'))
                        .fadeIn()
      failure: ->
        alert 'Something went wrong.'
