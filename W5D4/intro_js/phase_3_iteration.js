Array.prototype.bubbleSort = function() {
  let sorted = false;

  while (sorted === false) {
    sorted = true;

    for (let i = 0; i < (this.length-1); i++) {
      if (this[i] > this[i+1]) {
        let temp = this[i];
        this[i] = this[i+1];
        this[i+1] = temp;
        sorted = false;
      }
    }
  }
  return this;
};

console.log([0,9,2,5,8,9,14,2,4,7,0,8,79,0,8].bubbleSort());

String.prototype.subStrings = function() {
  let subs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j <= this.length; j++) {
      subs.push(this.slice(i, j));
    }
  }
  return subs;
};

console.log('swoll'.subStrings());

