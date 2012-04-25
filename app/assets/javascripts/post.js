

$(document).ready(function(){
  $('#tr_post').click(function() {

      var postTo = 'http://sandbox-wefix0001.taskrabbitdev.com/api/v1/tasks?access_token=x7Hf13HhWwwzB2Iu7Kx7hPhsN18R4YPimKYO0b2v';

      $.post(postTo,{"task[name]": "Walk dogs", "task[named_price]": "20", "task[city_id]": "1"},
      function(data) {
          console.log("Hello");
          console.log(data);
          },'json');

  });
});