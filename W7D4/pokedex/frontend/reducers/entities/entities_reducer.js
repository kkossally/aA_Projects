import { combineReducers } from "redux";
import pokemon_reducer from "./pokemon_reducer";

export default combineReducers({
  pokemon: pokemon_reducer,
})
