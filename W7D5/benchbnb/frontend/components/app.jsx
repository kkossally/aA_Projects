import React from 'react';
import { Route } from 'react-router-dom';
import GreetingContainer from './greeting_container';
import AuthRoute from '../util/route_util';
import LoginFormContainer from './login_form_container';
import SignupFormContainer from './signup_form_container';

const App = () => {
  return (
    <>
      {/* <div className="stars"></div>
      <div className="twinkling"></div>
      <div className="clouds"></div> */}
      
      <header className="greeting-header">
        <h1>Bench BnB</h1>
        <GreetingContainer />
      </header>

      <AuthRoute path="/login" component={LoginFormContainer}/>
      <AuthRoute path="/signup" component={SignupFormContainer}/>
    </>
  )
}

export default App;