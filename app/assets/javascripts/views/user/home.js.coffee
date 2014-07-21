class Descendants.Views.Home extends Backbone.View

  initialize: (options) ->
    @router = options.router

  events: ->
    'click ul#directors a': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).data('slug')
    @router.navigate("/directors/#{slug}")
    new Descendants.Views.Director(slug: slug).render()
