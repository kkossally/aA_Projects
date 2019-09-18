import FollowToggle from './follow_toggle.js';

$(() => {
  const $els = $(".follow-toggle");
  $els.each( (index, el) => {
    new FollowToggle($(el));
  });  
});