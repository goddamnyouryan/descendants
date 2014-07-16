class Descendants.Views.Scroll extends Backbone.View
  el: 'body'

  events: ->
    'click a.scroll': 'scrollToSection'

  scrollToSection: (event) ->
    event.preventDefault()
    target = $(event.target)
    scrollTo = $("#{target.data('scroll')}")
    $('html,body').animate({ scrollTop: scrollTo.offset().top }, { easing: 'swing', duration: 500 })
