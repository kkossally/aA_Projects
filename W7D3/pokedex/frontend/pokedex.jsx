import React from 'react';
import ReactDOM from 'react-dom';
import rootReducer from './reducers/root_reducer';
import { receiveAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util'; 

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  window.rootReducer = rootReducer;

  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;

  ReactDOM.render(<h1>Pokedex</h1>, root);
});