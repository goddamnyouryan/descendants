class Descendants.Views.Videos extends Backbone.View
  el: 'body'

  initialize: (options) ->
    @director = options.director

  events: ->
    'click ul.videos a': 'loadVideo'

  loadVideo: (event) ->
    event.preventDefault()
    new Descendants.Views.Video slug: $(event.target).parents('li').data('slug')
