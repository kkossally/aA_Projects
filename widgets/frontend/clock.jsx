import React from 'react';

class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      // time: new Date(),
      hours: new Date().getHours(),
      minutes: new Date().getMinutes(),
      seconds: new Date().getSeconds()
    }
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
      seconds: new Date().getSeconds()
    });
  }

  render() {
    const hours = (this.state.hours < 10 ? "0" : "") + this.state.hours;
    const minutes = (this.state.minutes < 10 ? "0" : "") + this.state.minutes;
    const seconds = (this.state.seconds < 10 ? "0" : "") + this.state.seconds;
    return (
      <>
        <h1>It's Clock O'Clock on the Dot!</h1>
        <div>
          <p>Time:    {hours}:{minutes}:{seconds}</p>
          <p></p>
        </div>
      </>
    )
  }

}

export default Clock;