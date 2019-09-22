function sum() {
  const args = Array.prototype.slice.call(arguments);
  const reducer = (accumulator, currentValue) => accumulator + currentValue;
  return args.reduce(reducer);
}

function sumTwo(...args) {
  const reducer = (accumulator, currentValue) => accumulator + currentValue;
  return args.reduce(reducer);
}

console.log(sumTwo(1, 2, 3, 4));
console.log(sumTwo(1, 2, 3, 4, 5));


Function.prototype.myBind = function(context, ...args) {
  const that = this;
  return function (...moreArgs) {
    return that.apply(context,args.concat(moreArgs));
  }
}

Function.prototype.myBind = function (context) {
  const that = this;
  // const args = Array.prototype.slice.call(arguments,1);
  const args = Array.from(arguments).slice(1);
  return function () {
    // const moreArgs = Array.prototype.slice.call(arguments,1);
    const moreArgs = Array.from(arguments);
    return that.apply(context, args.concat(moreArgs));
  }
}


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says.myBind(pavlov, "meow", "Kush")(); // Pavlov says meow to Kush!

markov.says.myBind(pavlov)("meow", "a tree"); // Pavlov says meow to a tree!

markov.says.myBind(pavlov, "meow")("Markov"); // Pavlov says meow to Markov!

const notMarkovSays = markov.says.myBind(pavlov);

notMarkovSays("meow", "me");// Pavlov says meow to me!


const curriedSum = function(numArgs) {
  const numbers = [];
  
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((a, b) => a + b);
    } else {
      return _curriedSum;
    }
  }
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs) {
  const args = [];
  const that = this;

  return function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      that.apply(that, args);
    } else {
      return _curried;
    }
  }
}

Function.prototype.curry = function (numArgs) {
  const args = [];
  const that = this;

  return function _curried(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      that.apply(null, args);
    } else {
        return _curried;
    }
  }
}

// const sum = function(nums) {
//   return nums.reduce((a, b) => (a + b));
//  }
// const c = sum.curry(5);
// console.log(c(5)(30)(20)(1)(23)); // => 56
