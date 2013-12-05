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
      $elem = $(e.currentTarget)
      url = $elem.attr('action')

      $elem.find('button').prop('disabled', true);
      $.getJSON "#{url}?callback=?", $elem.serialize(), (data) =>
        console.log data
        if data.Status is 400
          $elem.find('button').prop('disabled', false);
          @showError form, data
        else # 200
          @showSuccess form, data
          @sendTracking if typeof(ga) isnt 'undefined'
      e.preventDefault()

  sendTracking: ->
    ga('send', 'event', 'form', 'submit', 'campaign monitor sign-up');

  showError: (form, data) ->
    $(form).find('[type="email"]').addClass('error')
    @addErrorHtml(form) if $(form).find('.error-message') < 1
    $(form).find('.error-message').text data.Message

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
