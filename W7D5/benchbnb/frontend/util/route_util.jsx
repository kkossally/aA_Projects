import React from 'react';
import { connect } from 'react-redux';
import { Route, withRouter, Redirect } from 'react-router-dom';

const Auth = ({ component: Component, path, loggedIn, exact  }) => {
  return (
    <Route 
      path={path}
      exact={exact}
      render={
        props => !loggedIn ? <Component {...props} /> : <Redirect to="/" />
      }
    />
  );
}

const msp = state => {
  return {
    loggedIn: Boolean(state.session.id)
  }
}

export default withRouter(connect(msp)(Auth));