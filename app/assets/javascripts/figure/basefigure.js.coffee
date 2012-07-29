class window.BaseFigure
  constructor: (@id) ->

  save: (attribute) ->
    json = localStorage.figureJson
    object = JSON.parse(json)
    object["#{@id}"] = attribute
    localStorage.figureJson = JSON.stringify(object)
   