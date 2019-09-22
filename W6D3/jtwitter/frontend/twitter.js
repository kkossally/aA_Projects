import FollowToggle from './follow_toggle.js';
import APIUtil from './api_util.js';

$(() => {
  const $els = $(".follow-toggle");
  $els.each( (index, el) => {
    new FollowToggle($(el));
  });  
});