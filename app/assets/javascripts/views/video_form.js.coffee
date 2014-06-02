class Descendants.Views.VideoForm extends Backbone.View

  initialize: ->
    @$el.S3Uploader
      remove_completed_progress_bar: false
      progress_bar_target: $('#uploads_container')

    @$el.bind 's3_upload_failed', (e, content) ->
      alert content.filename + ' failed to upload'

