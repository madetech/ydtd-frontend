window.BarChart = class BarChart
  constructor: (chart, element, data, options) ->
    chart.Bar data, options
    @bar_legend $(element).find('.legend'), data

  bar_legend: (parent, data) ->