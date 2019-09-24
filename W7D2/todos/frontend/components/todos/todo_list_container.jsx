import {connect} from 'react-redux';
import TodoList from './todo_list'; 
import allTodos from '../../reducers/selectors';
import { receiveTodo } from "../../actions/todo_actions";


const msp = state => ({
  todos: allTodos(state)
});

const mdp = dispatch => ({
  receiveTodo: todo => dispatch(recieveTodo(todo))
});


export default connect(msp,mdp)(TodoList);


