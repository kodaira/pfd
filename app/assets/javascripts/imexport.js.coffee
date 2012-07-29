
window.id_g = 1

$ ->
  $("#export").click ->
    href = "data:application/octet-stream," + screenData()
    this.setAttribute("href", href)

  $("#import").click (e) ->
    file = e.target.files[0]
    readFile(file)


  readFile = (file) ->
    reader = new FileReader()
  #  reader.onloadend = (e) -> 
    reader.onload = (e) -> 
      value = e.target.result
      localStorage.figureJson = value
      drawFigure()
    reader.readAsText(file, 'UTF-8')

screenData = ->
  localStorage.figureJson


drawFigure = ->
  $('#screen').empty()
  json = localStorage.figureJson
  object = JSON.parse(json)
  for key, value of object
#    alert key
#    alert value
    id_g += id_g
    circle = new Circle(id_g)
    circle.append($('#screen'))
    circle.draw($("##{circle.id}"))
   


@onCircle = ->
  id_g += id_g
  circle = new Circle(id_g)
  circle.append($('#screen'))
  circle.draw($("##{circle.id}"))
  circle.save()

@onInitData = ->
  object = {}
  localStorage.clear()
  localStorage.figureJson = JSON.stringify(object)
  

  




