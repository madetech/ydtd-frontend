window.DatePickerView = class DatePickerView extends Uniform
  @::counter = 0

  elements: (add) ->
    add('select', 'select')

  events: (add) ->
    add('.input-date', 'changeDate', (el, e) -> @update_select_values(el))

  init: ->
    super
    @select.hide()
    @insert_date_input()

  date_input = ->
    $ """
      <input
        type="text"
        class="input-date"
        id="input-date-#{++DatePickerView::counter}"
        />
    """

  insert_date_input: ->
    @el.each ->
      $input = date_input()
      $input.appendTo(@)
      $input.datepicker(format: 'dd/mm/yyyy')
      $input.siblings('label').attr('for', $input.attr('id'))

  update_select_values: (el) ->
    date_parts = el.value.split('/')
    return unless date_parts.length is 3
    date_parts.reverse()
    @find(el).siblings('select').each (i) -> @value = parseInt(date_parts[i], 10)
