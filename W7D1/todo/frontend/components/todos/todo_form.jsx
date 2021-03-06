import React from 'react';
import { connect } from 'react-redux';
import { receiveTodo } from "../../actions/todo_actions";
import TodoListItem from './todo_list_item';
import { uniqueId } from "../../util/util";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      title: "",
      body: "",
      done: false, 
    }

    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    const { title, body, done } = this.state;
    const id = uniqueId(); 
    this.props.addTodo(id, title, body, done);
    this.setState({
      title: "",
      body: "",
    });
  }

  update(field) {
    return event => {
      this.setState({ [field]: event.target.value });
    }
  }

  render() {
    return (
      <form className="add-todo-form" onSubmit={this.handleSubmit}>
        <label>
          Title
          <input type="text" onChange={this.update("title")} value={this.state.title}/>
        </label>
        <label>
          Body
          <input type="text" onChange={this.update("body")} value={this.state.body}/>
        </label>
        <label>
          <input type="submit" value="Add Todo!"/>
        </label>
      </form>
    );
  }
}

const mdp = (dispatch) => {
  return {
    addTodo: (id, title, body, done) => dispatch(receiveTodo({id, title, body, done})),
  }
}

export default connect(null, mdp)(TodoForm); 