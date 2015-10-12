$(document).ready(function() {
  $.("change").on('click', function(e){
    e.preventDefault;
    var form = $(this),

    $.ajax({
      url: "/heroes/:hero_id",
      method: "GET",
      dataType: "json"
    })
  })
});
