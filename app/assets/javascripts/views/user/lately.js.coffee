class Descendants.Views.Lately extends Backbone.View

  initialize: (options) ->
    @$el.imagesLoaded =>
      @$el.masonry
        'gutter': 42
