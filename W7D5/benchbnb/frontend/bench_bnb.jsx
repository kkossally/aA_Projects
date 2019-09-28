import React from "react";
import ReactDOM from "react-dom";
// import {signup, login, logout} from './util/session_api_util';
import configureStore from './store/store';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  //TESTING
  // window.signup = signup;
  // window.login = login;
  // window.logout = logout;
  
  
  ReactDOM.render(
  <div>
  
    <div className="stars"></div>
    <div className="twinkling"></div>
    <div className="clouds"></div>
  <h1>Welcome to KafeleBnB - Only the finest</h1>
    </div>, root);
});