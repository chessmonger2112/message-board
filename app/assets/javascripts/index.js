$(function(){
  var loggedIn = false;
  console.log("Testing");
  $("#signup").click(function(){
    var email = $("#email").val();
    var name = $("#name").val();
    var password = $("#password").val();
    if (!email)
    {
      alert("email can't be blank");
      return false;
    }
    else (!password)
    {
      alert("password can't be blank");
      return false;
    }

    loggedIn = true;
  });
  $("#messageSubmit").click(function() {
    var content = $("#message").val();
  });
  $("#chooseSignUp").click(function(){
    $("#chooseContainer").hide();
    $("#signUpContainer").show();
    $("#header").show();
    $("#header").text("Sign up");
    $("#message").hide();
  });
  $("#chooseLogin").click(function(){
    $("#chooseContainer").hide();
    $("#loginContainer").show();
    $("#header").show();
    $("#header").text("Login");
    $("#message").hide();
  });
  $(".edit").click(function() {
    var id = this.value;
    console.log("value is ",id);
    $("#" + id).css("display","inline");
  });
});
