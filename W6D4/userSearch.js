const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");
class UsersSearch {
  constructor(el) {
    this.el = el;
    this.input = this.el.querySelector("input[name=username]");
    this.ul = this.el.querySelector(".users");
    this.input.addEventListener("input", this.handleInput.bind(this));
  }
  handleInput(event) {
    if (this.input.value === "") {
      this.renderResults([]);
      return;
    }
    APIUtil.searchUsers(this.input.value).then(users =>
      this.renderResults(users)
    );
  }
  renderResults(users) {
    this.ul.innerHTML = "";
    for (let i = 0; i < users.length; i++) {
      const user = users[i];
      const a = document.createElement("a");
      a.textContent = user.username;
      a.setAttribute("href", `/users/${user.id}`);
      const followToggle = document.createElement("button");
      new FollowToggle(followToggle, {
        userId: user.id,
        followState: user.followed ? "followed" : "unfollowed"
      });
      const li = document.createElement("li");
      li.appendChild(a);
      li.appendChild(followToggle);
      this.ul.appendChild(li);
    }
  }
}
module.exports = UsersSearch;
