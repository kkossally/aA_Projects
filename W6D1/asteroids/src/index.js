
const MovingObject = require("./moving_object.js");
const Util = require("./util.js");


// window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", function () {
  const canvas = document.getElementById("game-canvas");
  canvas.height = 600;
  canvas.width = 1000;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 1000, 600);

  const mo = new MovingObject( {
      pos: [30, 30],
      vel: [10, 10],
      radius: 5,
      color: "#00FF00"
  });

  mo.draw(ctx);

  const haley = new Asteroid({pos: [30, 30]});
});


