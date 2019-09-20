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
      this.setState({ tabIndex: index })
    }
  } 

  render() {
    const currTab = this.props.tabInfo[this.state.tabIndex];
    const tabIndexItems = this.props.tabInfo.map((tab, index) => {
      // const changeParticularTab = this.changeTab(index);
      return <TabIndexItem key={index} tab={tab} changeTab={this.changeTab(index)} />
    });
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
    <li onClick={props.changeTab}>{props.tab.title}</li>
  )
}

export default Tabs;