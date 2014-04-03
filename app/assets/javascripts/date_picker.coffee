window.DatePickerView = class DatePickerView extends Uniform
  @::counter = 0

  elements: (add) ->
    add('select', 'select')

  events: (add) ->
    add('.input-date', 'changeDate', (el, e) -> @update_select_values(el))
    add('.input-date', 'keyup', (el, e) -> @update_select_values(el))

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

  pad_date = (str) ->
    return '0' + str if str.length is 1
    return str

  insert_date_input: ->
    @el.each ->
      $field = $(@)
      $input = date_input()
      $input.data($field.data())
      $selects = $field.find('select')
      $input.insertAfter($selects.last())
      $input.val($selects.map(-> pad_date(@value)).get().reverse().join('/'))
      $input.datepicker(format: 'dd/mm/yyyy')
      $input.siblings('label').attr('for', $input.attr('id'))

  update_select_values: (el) ->
    date_parts = el.value.split('/')
    $selects = @find(el).siblings('select')

    if date_parts.length is 3
      date_parts.reverse()
      $selects.each (i) -> $(@).val(parseInt(date_parts[i], 10))
    else
      $selects.each (i) -> @value = ''

    $selects.trigger('change')
