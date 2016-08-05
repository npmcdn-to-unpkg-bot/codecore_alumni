$(document).ready(function() {
  var scrollDown = function() {
    $("#messages-div").animate({ scrollTop: $("#messages").height() }, 'fast');
    return false;
  }
  var refreshMessages = function(){
    $.get("/messages/data", function(data){
      $("#messages").html("");
      for(var i = 0; i < data.length; i++) {
          $('#messages').append("<span class='label label-default label-pill'>" + data[i].user_name + "</span><li data-id=" + data[i].id + " class='list-group-item'>" + data[i].body + "<i class='delete'>X</i></li>")
      }
    });
  };

  $("#post-message").on("click", function(event){
    // alert("aaa");
    var message = $("textarea").val();
    $.post("/messages", {body: message}, refreshMessages);
    // return false;
    event.preventDefault();
    $("textarea").val("");
    scrollDown();
  });

  $("#messages").on("click", "i.delete", function(){
    $.ajax({
      method: "DELETE",
      url:    "/messages/" + $(this).parent().data("id"),
      success: function(){
        $(this).parent().remove();
      }.bind(this),
      error: function() {
        alert("You can only delete your own message!");
      }
    });
    refreshMessages();
    scrollDown();
  });
  $('#emoji-cheatsheet').click(function(event) {
    $('#emoji-panel').toggle(1000);
    event.preventDefault();
  });
  $('#emoji-panel').on("click","a[data-id]", function(event){
    var emoji = $(this).html();
    $('#text-area').val(emoji);
  });
})
