import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const Root = () => {
  const tabInfo = [
    { title: "The Tales of Scheherazade", content: "Beauty and brains!" },
    { title: "Oliver Twist", content: "Please, sir can I have some more?" },
    { title: "The Grave of the Fireflies", content: "Happiest ending ever! Tears... of joy!" }
  ]
  return (
    <>
      <Clock />
      <Tabs tabInfo={tabInfo} />
    </>
  )
}

export default Root;