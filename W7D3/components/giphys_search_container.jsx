import React from 'react';
import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';


const GiphysSearchContainer = () => {
  return <h1>I'm here!</h1>
}

const mSP = state => ({
  giphys: state.giphys
});

const mDP = dispatch => {
  return { fetchSearchGiphys: (searchTerm) => dispatch(fetchSearchGiphys(searchTerm)) };
};

export default connect(mSP, mDP)(GiphysSearch);