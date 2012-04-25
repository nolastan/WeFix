

$(document).ready(function(){
  $('#tr_post').click(function() {

      var postTo = 'http://sandbox-wefix0001.taskrabbitdev.com/api/v1/tasks?access_token=aDZaYIrNpouGs4M6dGI1xMPoTJ1ru15nGfizPoGv';

      $.post(postTo,({name: "Walk doggy", named_price: "20", city_id: "1"}),
      function(data) {
          alert(data);
          if(data != "") {
              // do something
          } else {
              // couldn't connect
          }
          },'json');
      return false;

  });
});