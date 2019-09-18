class FollowToggle {
  constructor($el) {
    debugger
    this.$el = $el;
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.handleClick();
  }

  toggleFollowState() {
    if(this.followState === 'unfollowed') {
      this.followState = "followed";
    } else {
      this.followState = "unfollowed";
    }
  }

  render() {
    if(this.followState === 'unfollowed'){
      this.$el.text("Follow!");
    } else {
      this.$el.text("Unfollow!");
    }
  }

  handleClick(){
    this.$el.on("click", e => {
      e.preventDefault();
      const method = (this.followState === 'unfollowed' ? 'POST' : 'DELETE');

      return $.ajax({
        dataType: 'JSON',
        method: `${method}`,
        url: `/users/${this.userId}/follow`,
        success: () => {
          this.toggleFollowState();
          this.render();
        }
      });

    });
  }

}


export default FollowToggle;