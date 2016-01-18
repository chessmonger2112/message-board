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
  $("#chooseSignUp").click(function(){
    $("#chooseContainer").hide();
    $("#signUpContainer").show();
    $("#header").show();
    $("#header").text("Sign up");

  });
  $("#chooseLogin").click(function(){
    $("#chooseContainer").hide();
    $("#loginContainer").show();
    $("#header").show();
    $("#header").text("Login");
  });
});
