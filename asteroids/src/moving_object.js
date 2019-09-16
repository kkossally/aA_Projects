function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
  ctx.strokeStyle = this.color;
  ctx.lineWidth = 2;
  ctx.stroke();
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos += this.vel;
}


module.exports = MovingObject;

// const mo = new MovingObject( {
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });
// console.log(mo);