let range = (start, end) => {
  if (start === end) { return [end]; }
  let array = range(start+1, end);
  array.unshift(start);
  return array;
}

// console.log(range(1, 4));

let sumRec = (arr) => {
  if (arr.length === 1) { return arr[0]; }

  let sum = sumRec(arr.slice(1)) + arr[0];
  return sum;
};

// console.log(sumRec([1,2,3,4,5]));

let exponentOne = (b, n) => {
  if (n === 1) { return b; }
  if (n === 0) { return 1; }
  let result = exponentOne(b, n - 1) * b;
  return result;
};

// console.log(exponentOne(4, 3));

let exponentDeux = (b, n) => {
  if (n === 1) { return b; }
  if (n === 0) { return 1; }

    let result;
  if ((n % 2) === 0) {
    result = exponentDeux(b, n / 2) ** 2;
  } else {
    result = b * (exponentDeux(b, (n - 1)/ 2) ** 2);
  }
    return result;
}

// console.log(exponentDeux(3, 4));

let fibonnaci = (n) => {
  if (n === 1) return [1];
  if (n === 2) return [1, 1];
  let fib = fibonnaci(n - 1);
  let next = fib.slice(-2)[0] + fib.slice(-2)[1];
  fib.push(next);
  return fib;
}

// console.log(fibonnaci(5));

let deepDup = (arr) => {
  let dup = [];

  arr.forEach(function(ele) {
    if (Array.isArray(ele)) {
      dup.push(deepDup(ele));
    } else {
      dup.push(ele);
    }
  }); 
  return dup;
};

// let array = [ 1, 2, [3,4], [5, 6, [7] ] ];

// console.log(deepDup(array)); // can we use map here? Yes! Si se puede!

let bsearch = (arr, target) => {
  let mid = Math.floor(arr.length / 2);
  
  if (arr[mid] === target) { return mid; }

  let left = arr.slice(0, mid);
  let right = arr.slice(mid + 1);

  if (arr[mid] > target) {
    return bsearch(left, target);
  } else if (arr[mid] < target) {
    return (bsearch(right, target)) + mid + 1;
  } else {
    return -1;
  }
};

// console.log(bsearch([1, 2, 3, 4, 5, 6], 6));

let mergesort = (arr) => {

  if (arr.length === 1) { return arr; }

  let left = arr.slice(0, Math.floor(arr.length / 2));
  let right = arr.slice(Math.floor(arr.length / 2));

  let sortedLeft = mergesort(left);
  let sortedRight = mergesort(right);

  return merge(sortedLeft, sortedRight);
};

let merge = (left, right) => {
  let merged = [];

  while (left.length > 0 || right.length > 0) {
    if (left[0] < right[0]) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  }
  return merged.concat(left).concat(right);
}

console.log(mergesort([9,2,6,7,2,39,5]));
// console.log(mergesort([9,2,6,7,2,39,5]));
