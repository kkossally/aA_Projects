import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({currentUser, logout}) => {
  const personalGreeting = () => (
    <>
      <h3>
        Hello {currentUser.username}
        <button onClick={logout}>Logout</button>
      </h3>
    </>
   );
   
  const sessionLinks = () => (
    <>
      <Link to="/signup">Sign Up</Link>
      <Link to="/login">Log In</Link>
    </>
  );

  return currentUser ? personalGreeting() : sessionLinks();
}

export default Greeting;