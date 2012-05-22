$(document).ready(function(){
  $('abbr.time_ago').timeago();
  $('.css-reload').click(function(){
    document.styleSheets.start_autoreload(4000);
  })
});

