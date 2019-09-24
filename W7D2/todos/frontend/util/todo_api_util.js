export const fetchTodos = () => {
  return $.ajax({
    method: "GET",
    url: "api/todos"
  });
}

// window.fetchTodos = fetchTodos; 

