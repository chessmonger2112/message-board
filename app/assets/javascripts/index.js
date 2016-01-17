$(function(){
  var loggedIn = false;
  console.log("Testing");
  $("#login").click(function(){
    var email = $("#email").val();
    loggedIn = true;
    // location.href = "/main/" + email;
  });
  $("#messageSubmit").click(function() {
    var content = $("#message").val();
    location.href = "/saveitup/" + content;
  });
});
