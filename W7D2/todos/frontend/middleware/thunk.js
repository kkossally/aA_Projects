const thunkMiddleware = function(store) {
  return function(next) {
    return function(action) {
      if (typeof action === "function") {
        return action(dispatch, getState);
      } else {
        return next(action);
      }
    };
  };
};

export default thunkMiddleware;