import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      tabIndex: 0
    }
  }

  changeTab(index) {
    return () => {
      this.setState({ tabIndex: index }) // returns a fat arrow, with implicit 
      //binding to the context of the component, that will change the state
    }
  }

  render() {
    const currTab = this.props.tabInfo[this.state.tabIndex];
    const tabIndexItems = this.props.tabInfo.map((tab, index) => {
      return <TabIndexItem key={index} tab={tab} changeTab={this.changeTab(index)} />
    }); // pass in the function above invoked with the current index 
    //(which corresponds to the tab object in the array of objects passed in by Root).
    //The invoked function will return the fat arrow above bound to the proper context 
    //(i.e. the parent component) as well as with the proper index for the tab to be displayed. 
    //That function will be what's actually passed in as a(n uninvoked) callback.
    return (
      <>
        <div className="tabs">
          <ul className="tab-headers">
            {tabIndexItems}
          </ul>
          <div className="tab-content">{currTab.content}</div>
        </div>
      </>
    )
  }
}

const TabIndexItem = (props) => {
  return (
    <li onClick={props.changeTab}>{props.tab.title}</li> // when clicked, 
    //the event listener will invoke the callback that was passed in above.
  )
}

export default Tabs;