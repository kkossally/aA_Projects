import { connect } from 'react-redux';
import { fetchBenches } from '../actions/bench_actions';
import Search from './search';

const msp = state => {
  const benches = state.entities.benches ? Object.values(state.entities.benches) : [];
  return {
    benches,
  }
}

const mdp = dispatch => {
  return {
    fetchBenches: () => dispatch(fetchBenches()),
  }
}

export default connect(msp, mdp)(Search);