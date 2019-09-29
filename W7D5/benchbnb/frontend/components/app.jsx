import React from 'react';
import GreetingContainer from './greeting_container';

const App = () => {
  return (
    <>
      <div className="stars"></div>
      <div className="twinkling"></div>
      <div className="clouds"></div>
      
      <header>
        <h1>Bench BnB</h1>
        <GreetingContainer />
      </header>
    </>
  )
}

export default App;