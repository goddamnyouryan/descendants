class Descendants.Views.Directors extends Backbone.View

  directors: -> $('section#directors')

  events: ->
    'click header nav h2 a': 'toggleDirectors'

  toggleDirectors: (event) ->
    event.preventDefault()
    $(event.target).toggleClass 'active'
    @directors().slideToggle()
