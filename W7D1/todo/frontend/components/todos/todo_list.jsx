import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from "./todo_form";


const TodoList = ({todos}) => {
  return (
    <>
      <ul>
        {todos.map(todo => (
          <TodoListItem key={todo.id} todo={todo}/>
        ))}
      </ul>

      <TodoForm />
    </>  
  );
};

export default TodoList;