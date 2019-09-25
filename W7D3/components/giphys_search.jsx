import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: props.searchTerm,
    }
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.fetchSearchGiphys('?????');
  }

  handleChange(searchTerm) {
    return event => {
      this.setState({ [searchTerm]: event.target.value });
    };
  }

  handleSubmit(event) {
    event.preventDefault();
    this.setState({ searchTerm: "" })
  }

  render() {
    const searchTerm = this.state;
    return (
      <>
        <form onSubmit={this.handleSubmit}>
          <label>
            Search for a Gif: 
            <input onChange={this.handleChange('searchTerm')} type="text" value={searchTerm}/>
          </label>
          <input type="submit" value="Submit"/>
        </form>
      </>
    )
  }

}

export default GiphysSearch;