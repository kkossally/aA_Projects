import {createStore} from "redux";
import rootReducer from "../reducers/root_reducer";
import { applyMiddleware } from 'redux';
import thunkMiddleware from "../middleware/thunk.js";


// export default (preloadedState = {}) => {
//   return createStore(rootReducer, preloadedState, applyMiddleware(thunkMiddleware));
// };


const configureStore = rootReducer => {
  return createStore(rootReducer, applyMiddleware(thunkMiddleware(store)));
}

export default configureStore(rootReducer);