$(function(){
  var loggedIn = false;
  console.log("Testing");
  $("#login").click(function(){
    $("#messageContainer").show();
    $("#loginContainer").hide();
  });
  $("#messageSubmit").click(function() {
    var content = $("#message").val();
    location.href = "/saveitup/" + content;
  });
});
