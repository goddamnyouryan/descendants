class Descendants.Views.Joinery extends Backbone.View

  events: ->
    'click ul.videos a': 'loadDirector'

  loadDirector: (event) ->
    event.preventDefault()
    slug = $(event.target).parents('li').data('slug')
    new Descendants.Views.Director(slug: slug).render()
