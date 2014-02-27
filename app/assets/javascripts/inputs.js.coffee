class YDTDInputs extends Uniform
  elements: (add) ->
    add('country_selectors', '#country, #country_alt')
    add('placeholders', '[placeholder]')
    add('date_pickers', '.init-date-picker')

  init: ->
    super
    @attachSelect2()
    @attachPlaceholderJS()
    @attachDatePicker()

  attachSelect2: ->
    @country_selectors.select2
      placeholder: "Select Country"
      width: "300px"
  
  has_placeholders: -> @placeholders.length

  attachPlaceholderJS: ->
    return unless @has_placeholders()
    return unless $('html').is('[class*="ie9"]')

    Placeholder.init
      normal: "#303030",
      placeholder: "#303030"

  attachDatePicker: ->
    console.log(@date_pickers.length)
    @date_pickers.datepicker();

$ -> new YDTDInputs(el: $('form'))
