import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root';
import {signup, login, logout} from './actions/session_actions';
import { fetchBenches } from './actions/bench_actions';

document.addEventListener("DOMContentLoaded", () => {
  let store;

  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      },
      session: { id: window.currentUser.id },
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = store = configureStore();
  }

  //TESTING
    // window.signup = signup;
    // window.login = login;
    // window.logout = logout;
    window.getState = store.dispatch;
    window.dispatch = (store.dispatch);
    window.fetchBenches = fetchBenches;
  //TESTING
  
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);
});