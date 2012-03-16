$(function() {
  $("#rebel").submit(function(event) {
    event.preventDefault();
    window.location = "/" + $("#term").val();
  });
});
