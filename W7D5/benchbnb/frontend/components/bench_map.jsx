import React from 'react';
import ReactDOM from 'react-dom';

class BenchMap extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 40.7781631, lng: - 73.9718765 },
      zoom: 13
    };

    this.map = new google.maps.Map(this.mapNode, mapOptions);
  }

  render() {
    return (
      <div id="map-container" ref={map => this.mapNode = map} />
    )
  }
}

export default BenchMap;