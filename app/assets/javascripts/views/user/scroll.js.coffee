class Descendants.Views.Scroll extends Backbone.View
  el: 'body'

  events: ->
    'click a.scroll': 'scrollToSection'

  scrollToSection: (event) ->
    event.preventDefault() if window.location.pathname == '/'
    target = $(event.target)
    scrollTo = $("#{target.data('scroll')}")
    offset = scrollTo.offset().top - $('header').outerHeight()
    $('html,body').animate({ scrollTop: offset }, { easing: 'swing', duration: 500 })
