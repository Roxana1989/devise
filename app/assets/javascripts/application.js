// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// $( document ).ready(function() {
  // $(document).on('click','#read',function(e){
  //   $('.chat-message').append('read').html('<form action="/users/2/chats/116" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="patch" /><input type="hidden" name="authenticity_token" value="aVYNAlkmhhlJWxwkwdvPpOg41Y3YZsOOeDGdmjPL62As0AgsuoMGZg5Qol4ApL1kDhQigG9ziT1TGODyuEL0cQ==" /><input type="text" value=true name="chat[status]" id="chat_name" />')
  // });
// $(document).ready(function() {

//         $('#read').on('click', function() {
//             alert('hello there!');
//         })

$ ->
  $("#read").click ->
    $.ajax({
      type: "POST",
      url: "/users",
      data: { user: { name: "dffgjkjhgf"} },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    })
    // });


//   $(".set_read").click(function(){
//     $('.chat-message').append('<input>fsdfsdfsd</input>');
//   });
// console.log("html");
