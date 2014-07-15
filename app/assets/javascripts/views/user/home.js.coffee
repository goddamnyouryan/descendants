class Descendants.Views.Home extends Backbone.View

  events: ->
    'click ul#directors a': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).data('slug')
    new Descendants.Views.Director(slug: slug).render()
