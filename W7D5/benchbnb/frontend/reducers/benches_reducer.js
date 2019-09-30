import { RECEIVE_BENCHES } from '../actions/bench_actions';

export default (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_BENCHES:
      return Object.assign({}, action.benches)

    default:
      return state;
  }
}