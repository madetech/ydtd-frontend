window.PieChart = class PieChart
  constructor: (chart, element, data, options) ->
    chart.Pie data, options
    @pie_legend $(element).find('.legend'), data

  pie_legend: (parent, data) ->
    parent.className = "legend"
    datas = (if data.hasOwnProperty("datasets") then data.datasets else data)
    total = 0
    $(parent).html("<ul></ul>");

    datas.forEach (d) ->
      total = (total += d.value)  if d.value

    datas.forEach (d) =>
      color = (if d.hasOwnProperty("strokeColor") then d.strokeColor else d.color)
      count = @prettify_number d.value
      if d.additional_data is "percentage"
        percentage = ((d.value / total) * 100).toFixed(2)
        list_item = "<li><span style='background-color:#{color};'></span><h4>#{count} #{d.title}</h4><h5>#{percentage}% #{d.subtitle}</h5></li>"
      else if d.additional_data is "historic_total"
        list_item = "<li><span style='background-color:#{color};'></span><h4>#{count} #{d.title}</h4><h5>3,607 #{d.subtitle}</h5></li>"
      else
        list_item = "<li><span style='background-color:#{color};'></span><h4>#{count} #{d.title}</h4><h5>#{d.subtitle}</h5></li>"
      $(parent).find("ul").append list_item

  prettify_number: (number) ->
    n = number.toString()
    n = n.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    n = "<b>#{n}</b>"