
$(function() {
  if ($("#calls").length > 0) {
    setTimeout(updateComments, 5000);
  }
});

function updateComments() {
  if ($("#calls").length > 0) {
    var after = $("#call:first-child").attr("data-time");
  } else {
    var after = "0";
  }
  $.getScript("/sacha/lastcalls.js?after=" + after)
  setTimeout(updateComments, 5000);
}