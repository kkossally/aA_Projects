import APIUtil from './api_util.js';

class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  };

  successCB() {
    if (this.followState === "unfollowed") {
      this.followState = "followed";
    } else if (this.followState === "followed") {
      this.followState = "unfollowed";
    } else if (this.followState === "Following...") {
      this.followState = "followed";
    } else if (this.followState === "Unfollowing...") {
      this.followState = "unfollowed";
    }
    this.render();
  }

  render() {
    if (this.followState === "unfollowed"){
      this.$el.text("Follow!");
    } else if (this.followState === "followed") {
      this.$el.text("Unfollow!");
    } else {
      this.$el.text(`${this.followState}`);
    }

    if (this.followState === 'Following...' || this.followState === 'Unfollowing...') {
      this.$el.prop("disabled", true)
    } else {
      this.$el.prop("disabled", false)
    }
  }

  handleClick(){
    this.$el.on("click", e => {
      e.preventDefault();

      if (this.followState === "unfollowed") {
        this.followState = "Following...";
        this.render();
        APIUtil.followUser(this.userId).then(this.successCB.bind(this));
      } else {
        this.followState = "Unfollowing...";
        this.render();
        APIUtil.unfollowUser(this.userId).then(this.successCB.bind(this));
      }
    });
  }
}


export default FollowToggle;