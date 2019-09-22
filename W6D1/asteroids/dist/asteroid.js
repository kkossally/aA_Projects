const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Asteroid (options) {
  MovingObject.call(this, options.pos, Util.scale(Util.randomVec(10), 10), 90, "red");
}

Util.inherits(Asteroid, MovingObject);