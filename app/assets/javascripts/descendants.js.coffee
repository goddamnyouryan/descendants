window.Descendants =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Descendants.Routers.Application
    Backbone.history.start pushState: Modernizr.history

$(document).on 'page:load', ->
  Backbone.history.stop()
  Descendants.initialize()

$(document).ready ->
  Descendants.initialize()
