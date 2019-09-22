Array.prototype.uniq = function() {
  let uniqArray = [];

  this.forEach(function(element) {
    if (!uniqArray.includes(element)) {
      uniqArray.push(element);
    }
  });
  return uniqArray;
};

// console.log([1,2,2,3,3,3].uniq()) // [1,2,3]

Array.prototype.twoSum = function() {
  let sumPairs = [];

  for (var i = 0; i < this.length; i++ ) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        sumPairs.push([i, j]);
      }  
    }    
  }
  return sumPairs;
}

// console.log([1, 3, 5, 7, -1, -5, -3, -6].twoSum())

Array.prototype.transpose = function() {
  let transposition = [];

  for(let i = 0; i < this[0].length; i++) {
    let sub = [];

    this.forEach(function(element) {
      sub.push(element[i]);
    });

    transposition.push(sub);
  }
  return transposition;
}

// console.log([ [1,2,3],[4,5,6],[7,8,9] ].transpose())
// console.log([ [1,2],[4,5],[7,8] ].transpose())