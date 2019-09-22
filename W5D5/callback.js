class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    const date = new Date();
    this.hours = date.getHours(); 
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    this.printTime();

    setInterval( () => { this._tick(); }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    const time = this.hours + ":" + this.minutes + ":" + this.seconds;
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds++;

    if (this.seconds === 60) {
      this.minutes++;
      this.seconds = 0;

      if (this.minutes === 60) {
        this.hours++;
        this.minutes = 0;

        if (this.hours === 24) {
          this.hours = 0;
        }
      }
    }

    this.printTime();
  }
}

// const clock = new Clock();

// const readline = require("readline");

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });


function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Gimme yo numbah: ', (response)=> {
      const number = parseInt(response);
      sum += number;
      console.log(sum);
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else {
    completionCallback(sum);
    reader.close();
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2}? `, (res) => {
    let answer = (res === "yes") ? true : false;
    callback(answer);
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        let temp = arr[i + 1];
        arr[i + 1] = arr[i];
        arr[i] = temp;
        madeAnySwaps = true;
      } 
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });

  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      console.log('Done sorting!')
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

// absurdBubbleSort([3, 2, 1], function(arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });


Function.prototype.myBind = function(context) {
  return () => { this.apply(context); }
}

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

Function.prototype.myThrottle = function(interval) {
  let tooSoon;

  if (!tooSoon) {
    tooSoon = true;
    this();
    setInterval(() => { tooSoon = false; }, interval);
    debugger;
    
  }
};



class Neuron {
  constructor() {
    this.fire = this.fire.myThrottle(500);
  }

  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();

neuron.fire = neuron.fire.myThrottle(500);

