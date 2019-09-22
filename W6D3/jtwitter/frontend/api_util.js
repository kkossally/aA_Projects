const APIUtil = {
  followUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'POST',
      url: `/users/${id}/follow`
    });
  },

  unfollowUser: id => {
    return $.ajax({
      dataType: 'json',
      method: 'DELETE',
      url: `/users/${id}/follow`
    });
  }
};

export default APIUtil;
