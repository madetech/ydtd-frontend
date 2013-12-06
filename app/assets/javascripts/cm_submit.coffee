window.CampaignMonitorSubmit = class CampaignMonitorSubmit
  constructor: ->
    $(document).ready =>
      @init()

  init: ->
    return if $('form[action*="http://madebymade.createsend.com"]').length < 1
    @attach form for form in $('form[action*="http://madebymade.createsend.com"]')

  addErrorHtml: (form) ->
    $(form).prepend('<p class="error-message" />')

  attach: (form) ->
    $(form).submit (e) =>
      e.preventDefault()

      $elem = $(e.currentTarget)
      url = $elem.attr('action')

      if $(form).find('input[type="email"]').val().length < 1
        @showError form, "Please enter your email address"
        return

      $elem.find('button').prop('disabled', true);
      $.getJSON "#{url}?callback=?", $elem.serialize(), (data) =>
        console.log data
        if data.Status is 400
          $elem.find('button').prop('disabled', false);
          @showError form, data.Message
        else # 200
          @showSuccess form, data
          @sendTracking if typeof(ga) isnt 'undefined'


  sendTracking: ->
    ga('send', 'event', 'form', 'submit', 'campaign monitor sign-up');

  showError: (form, message) ->
    alert message
    $(form).find('[type="email"]').addClass('error')
    @addErrorHtml(form) if $(form).find('.error-message').length < 1
    $(form).find('.error-message').text message

  showSuccess: (form, data) ->
    $(form).wrapInner('<div class="success" />')
    $msg = $(form).find('.success')
    $msg.css
      minHeight: $(form).find("[type=\"email\"]").outerHeight()

    $msg.animate
      opacity: 0,
    , =>
      $msg.html("<p>#{data.Message}</p>")
      $msg.animate
        opacity: 1

new CampaignMonitorSubmit()
