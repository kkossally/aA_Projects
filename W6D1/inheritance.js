
// Function.prototype.inherits = function(Parent) {
//   const Child = this;
//   function Surrogate() {};
//   Surrogate.prototype = Parent.prototype;
//   Child.prototype = new Surrogate();
//   Child.prototype.constructor = Child;
// }

function MovingObject(name = "default name") {
  this.name = name;
}
MovingObject.prototype.move = function(){
  console.log(`${this.name} is Moving!`);
}

function Ship(name) { 
  MovingObject.call(this, name);
}
// Ship.inherits(MovingObject);
Ship.prototype = Object.create(MovingObject.prototype)

function Asteroid(name) { 
  MovingObject.call(this, name);
}

// Asteroid.inherits(MovingObject);
Asteroid.prototype = Object.create(MovingObject.prototype)

Asteroid.prototype.crash = function () {
  console.log("EXTICTION LEVEL EVENT!!!");
}

// console.log(Ship.prototype === MovingObject);
// console.log(Asteroid.prototype === MovingObject);

const shipA = new Ship("ship test");
const astA = new Asteroid("asteroid test");
const mo = new MovingObject("mo test");

shipA.move();
astA.move();
astA.crash();
// mo.crash();
// shipA.crash();
