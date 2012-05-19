$(document).ready(function(){

  $("#content.home ul.actions li.act").click(function(){
    window.location = "requests/funded";
  });

  // $("#content.home ul.actions li.propose").click(function(){
  //   window.location = "requests/new";
  // });

  $("body.home ul.actions li.fund").click(function(){
    window.location = "requests";
  });

});