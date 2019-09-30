import React from 'react';
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    return (
      <>
        {this.props.benches.map(bench => {
          // debugger
          return <BenchIndexItem key={bench.id} bench={bench} />
        })}
      </>
    )
  }
}


export default BenchIndex;