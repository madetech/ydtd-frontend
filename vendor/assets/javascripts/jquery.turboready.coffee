((window, $) ->
  $.turboready = (el, callback) ->
    $(el).ready ->
      callback()

    $(el).on "page:change", ->
      callback()

  $.fn.turboready = (method) ->
    @each ->
      new $.turboready(@, method)
) window, jQuery
