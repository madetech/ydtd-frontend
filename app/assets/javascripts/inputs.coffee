window.YDTDInputs = class YDTDInputs
  constructor: ->
    $(document).ready =>
      @init()

  init: ->
    @attachSelect2() if $("#country, #country_alt")
    @attachPlaceholderJS() if $('input[placeholder], textarea[placeholder]') and $('html').is('[class*="ie9"]')

  attachSelect2: ->
    $("#country, #country_alt").select2
      placeholder: "Select Country"
      width: "300px"

  attachPlaceholderJS: ->
    Placeholder.init
      normal: "#303030",
      placeholder: "#303030"

new YDTDInputs()
