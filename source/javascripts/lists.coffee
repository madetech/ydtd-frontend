window.Lists = class Lists
  constructor: ->
    $(document).pjax "a", "[data-pjax-container]",
      fragment: "#subscribers-container"
    @setupTabs()

  setupTabs: ->
    $('#table-tabs a').click ->
      $('#table-tabs a').removeClass 'active'
      $(this).addClass 'active'
$(window).load ->
  new Lists()