import React from 'react';
import ReactDOM from 'react-dom';
import Root from "./components/root"; 
import store from './store/store';


document.addEventListener("DOMContentLoaded", () => {

  const root = document.getElementById("content");
  window.store = store; 
  ReactDOM.render(<Root store={store}/>, root);

});