window.LineChart = class LineChart
  constructor: (chart, element, data, options) ->
    chart.Line data, options
    @line_legend $(element).find('.legend'), data

  line_legend: (parent, data) ->
    parent.className = "legend"
    datas = (if data.hasOwnProperty("datasets") then data.datasets else data)
    total = 0
    $(parent).html("<ul></ul>");

    datas.forEach (d) =>
      color = (if d.hasOwnProperty("strokeColor") then d.strokeColor else d.color)
      list_item = "<li><span style='background-color:#{color};'></span><h4>#{d.title}</h4></li>"
      $(parent).find("ul").append list_item