window.Descendants =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Descendants.Routers.Application
    Backbone.history.start pushState: Modernizr.history

$(document).ready ->
  Descendants.initialize()
