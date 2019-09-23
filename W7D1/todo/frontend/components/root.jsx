import React from 'react';
import {Provider} from 'react-redux';
import App from './app'
import allTodos from "../reducers/selectors"
// import { receiveTodo, receiveTodos } from "../actions/todo_actions";


 const Root = ({ store }) => (
   <Provider store={store}>
     <App />
  </Provider>
 );

export default Root;