import {merge} from 'lodash';
import { RECEIVE_TODOS } from "../actions/todo_actions";
import { RECEIVE_TODO } from "../actions/todo_actions";


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = {};
  
  switch (action.type) {
    case RECEIVE_TODOS: {
      action.todos.forEach(todo => {
        const { id } = todo;
        // const newTodo = { id, title, body, done }; We don't need to create a new constant b/c we already have access to the todo via the forEach
        newState[id] = todo;
      });
    }
      return newState; 
    case RECEIVE_TODO: {
      const id = action.todo.id; 
      const todo = {[id]: action.todo}; 
      merge(newState, state, todo);
      return newState;
    }
    default: {
      return state; 
    }
  }
};

export default todosReducer; 


