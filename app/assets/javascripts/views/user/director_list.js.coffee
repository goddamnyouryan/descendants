class Descendants.Views.DirectorList extends Backbone.View

  initialize: (options) ->
    @router = options.router

  events: ->
    'click ul#directors a.director': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).data('slug')
    slug = $(event.target).parents('li').data('slug') || $(event.target).data('slug')
    @router.navigate("/directors/#{slug}", trigger: true)
    new Descendants.Views.Director(slug: slug).render()
