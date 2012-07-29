# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


addCanvas = (width, height) ->
#  alert("b")
  screen = document.getElementById('screen');
  id = 'canvas' + (screen.getElementsByTagName('canvas').length + 1).toString();
  $('#screen').append( $('<canvas></canvas>')
            .attr('id', id)
            .attr('width', width)
            .attr('height', height)
  );
  canvas = document.getElementById(id);

  # add kodaira
  $("##{id}").click =>
    text = id
    context = canvas.getContext('2d');
    context.font = "16px 'MS Pゴシック'";
    context.fillStyle = "white";
    x = 25;
    y = canvas.height/2 + 8;
    context.fillText(text, x, y, canvas.width);

  if (!canvas || !canvas.getContext)
     return null;
  return canvas;

initContext = (canvas, context) ->
  text = document.forms.fm.text.value;
  if (text)
    context.font = "16px 'MS Pゴシック'";
    context.fillStyle = "white";
    x = 25;
    y = canvas.height/2 + 8;
    context.fillText(text, x, y, canvas.width);
  $(canvas).draggable({ containment: '#screen' });


@addRect = ->
  width = 120
  height = 80
  canvas = addCanvas(width, height)
  if (!canvas)
    return false
  context = canvas.getContext('2d');
  context.beginPath();
  context.fillStyle = "blue";
  context.fillRect(0, 0, width, height)
  initContext(canvas, context);

@addEllipse = ->
  width = 150;
  height = 80;
  canvas = addCanvas(width, height);
  if (!canvas)
    return false;
  cx = width / 2;
  cy = height / 2;
  context = canvas.getContext('2d');
  context.beginPath();
  context.moveTo(cx, 0);
  context.bezierCurveTo(
        width, 0,       
        width, height, 
        cx, height);  
  context.bezierCurveTo(
        0, height,   
        0, 0,       
        cx, 0);    
  context.fillStyle = "green";
  context.fill();
  context.closePath();

  initContext(canvas, context);


@addCircle = ->
  screen = document.getElementById('screen');
  id = 'canvas' + (screen.getElementsByTagName('canvas').length + 1).toString();
  $('#screen').append($('<canvas></canvas>').attr('id', id).attr('width', 120).attr('height', 80));

  canvas = document.getElementById(id);
  width = canvas.width;
  height = canvas.height;
  $("##{id}").drawArc({ fillStyle: "yellow", x: width/2, y: height/2, radius: height/2 });
  $(canvas).draggable({ containment: '#screen' });

  $("##{id}").click =>
    $("##{id}").drawText({
      fillStyle: "#729fcf",
      strokeStyle: "#000",
      strokeWidth: 5,
      x: canvas.width/2, y: canvas.height/2,
      text: id,
#      text: JSON.parse(localStorage.screenJson).title
#      text: JSON.stringify(localStorage.screenJson)
      align: "center",
      baseline: "middle",
      font: "normal 12pt Verdana, sans-serif"
      });

