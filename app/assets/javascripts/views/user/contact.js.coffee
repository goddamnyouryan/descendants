class Descendants.Views.Contact extends Backbone.View

  initialize: ->
    @validate()

  sendContactForm: (target) ->
    $.ajax
      url: @$el.attr('action')
      type: 'POST'
      data: @contactData $(target)
      success: =>
        html = "<span class='success'>Your message has been sent.</span>"
        @$('input[type=submit]').after html
        @$('input[type=text], input[type=email], textarea').val ''

  contactData: (target) ->
    {
      name: target.find('input[type=text]').val()
      email: target.find('input[type=email]').val()
      message: target.find('textarea').val()
    }

  validate: ->
    @$el.validate
      rules:
        name: 'required'
        email:
          required: true
          email: true
        message: 'required'
      errorPlacement: (error, element) =>
      submitHandler: (form) =>
        @sendContactForm(form)
