Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// [1, 4, 7, 'bye'].myEach(function(element) {
//   console.log(element + 1);
// });

Array.prototype.myMap = function(callback) {
  let mapArr = [];

  this.myEach(element => {
    mapArr.push(callback(element));
  }); // how do we capture the result of the callback for each element?

  return mapArr;
};

const timesTwo = function(element) {
  return element * 2;
};

// console.log([2, 4, 6, 8, 'who do we appreciate'].myMap(timesTwo));

Array.prototype.myReduce = function(callback, initialValue) {
  let acc;
  if (initialValue) {
    acc = initialValue;
    for (let i = 0; i < this.length; i++) {
      acc = callback(acc, this[i]);
    }
  } else {
    acc = this[0];
    for (let i = 1; i < this.length; i++) {
      acc = callback(acc, this[i]);
    }
  }
  return acc;
};

Array.prototype.myReduceProper = function(callback, initialValue) {
  let acc = initialValue ? initialValue : this[0];

  if (initialValue) {
    this.myEach(element => {
      acc = callback(acc, element);
    });
  } else {
    this.slice(1).myEach(element => {
      acc = callback(acc, element);
    });
  }
  return acc;
};

let adder = (el1, el2) => {
  return el1 + el2;
};

// console.log([1, 2, 3].myReduce(adder));
// console.log([1, 2, 3].myReduceProper(adder));