
const allTodos = (state) => { 
  const todoIDs = Object.keys(state.todos); 
  return todoIDs.map(id => {
    return state.todos[id]; 
  }); 
}

// window.allTodos = allTodos; 

export default allTodos; 