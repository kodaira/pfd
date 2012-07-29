class window.Circle extends BaseFigure
  constructor: (id) ->
    id = 'circle_' + id_g.toString()
    super(id)
    @color = "yellow"
    @width = 120
    @height = 80

  append: (screen) ->
    screen.append($('<canvas></canvas>').attr('id', @id)
      .attr('width', @width).attr('height', @height))

  draw: (fg_o) ->
    fg_o.drawArc({ fillStyle: @color, x: @width/2, y: @height/2, radius: @height/2 })
    $(fg_o[0]).draggable({ containment: '#screen' })
    fg_o.drawText({
      strokeStyle: "blue",
      strokeWidth: 1,
      x: @width/2, y: @height/2,
      text: @id,
    })
    fg_o.click ->
      fg_o.drawText({
        strokeStyle: "red",
        strokeWidth: 1,
        x: @width/2, y: @height/2,
        text: "clicked",
        })

  save: ->
    attribute = {width: @width, height: @height, color: @color}
    super(attribute)


