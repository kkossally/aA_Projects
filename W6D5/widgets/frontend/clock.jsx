import React from 'react';

class Clock extends React.Component {

  constructor(props) {
    super(props);
    const time = new Date();
    this.state = {
      // time: new Date(),
      hours: time.getHours(),
      minutes: time.getMinutes(),
      seconds: time.getSeconds(),
      day: time.getDay(),
      month: time.getMonth(),
      date: time.getDate(),
      year: time.getFullYear()
    }
    this.months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalID)
  }

  tick() {
    this.setState({
      hours: new Date().getHours(),
      minutes: new Date().getMinutes(),
      seconds: new Date().getSeconds(), 
      day: new Date().getDay(),
      month: this.months[new Date().getMonth() + 1],
      date: new Date().getDate(),
      year: new Date().getFullYear()
    });
  }

  render() {
    const hours = (this.state.hours < 10 ? "0" : "") + this.state.hours;
    const minutes = (this.state.minutes < 10 ? "0" : "") + this.state.minutes;
    const seconds = (this.state.seconds < 10 ? "0" : "") + this.state.seconds;
    const day = this.state.day;
    const month = this.state.month;
    const date = this.state.date;
    const year = this.state.year;

    return (
      <>
        <h1>It's Clock O'Clock on the Dot!</h1>
        <div className="clock-box">
          <p>
            <span>Time:</span>
            <span>{hours}:{minutes}:{seconds} EST</span>
          </p>
          <p>
            <span>Date:</span>
            <span>{day} {month} {date} {year}</span>
          </p>
        </div>
      </>
    )
  }
}

export default Clock;