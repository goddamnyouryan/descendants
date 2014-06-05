class Descendants.Views.Sortable extends Backbone.View
  el: 'ul.sortable'

  initialize: ->
    @$el.sortable
      update: ->
        $.post($(this).data('sort-url'), $(this).sortable('serialize'))
