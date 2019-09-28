import { RECEIVE_ALL_POKEMON, RECEIVE_A_POKEMON } from '../../actions/pokemon_actions';

export default (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_A_POKEMON:
      return action.pokemon;
    default:
      return state; 
  }
}