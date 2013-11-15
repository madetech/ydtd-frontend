window.Charts = class Charts
  constructor: ->
    $(".chart-wrap").each (index, element) =>
      chart_canvas = $(element).find("canvas")
      chart_type = $(element).data("chart-type")
      data_array = eval $(element).find("script").text()
      data = data_array[0]
      options = data_array[1]
      chart_context = chart_canvas.get(0).getContext("2d")
      chart = new Chart(chart_context)

      @create_legend element

      switch chart_type
        when "pie"
          new PieChart(chart, element, data, options)
        when "radar"
          new RadarChart(chart, element, data, options)
        when "bar"
          new BarChart(chart, element, data, options)
        when "line"
          new LineChart(chart, element, data, options)

  create_legend: (parent) ->
    $(parent).append "<div class='legend'></div>"

$(window).load ->
  new Charts()
