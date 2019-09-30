import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
    }
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(field) {
    return (event) => this.setState({ [field]: event.target.value });
  }

  render() {
    const linkText = (this.props.formType === 'login' ? 'signup' : 'login');
    
    return (
      <>

        <form onSubmit={this.handleSubmit}>
          Please {this.props.formType}
          <Link to={`/${linkText}`}>{linkText}</Link>
          <br/>
          {this.props.errors.session}
          <br/>
          <label>
            Username
            <input type="text" value={this.state.username} onChange={this.update("username")}/>
          </label>
          <label>
            Password
            <input type="password" value={this.state.password} onChange={this.update("password")}/>
          </label>
          <input type="submit" value={this.props.formType}/>
        </form>

      </>
    )
  }
}

export default SessionForm;