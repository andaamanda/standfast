function openMessages(){
 $(document).ready(function(){
   $('#messages').fadeIn(1000);
 })
}

function closeMessages(){
  $('#messages').fadeOut(1000);
}

var messageTimeout = null;
function messageGernade(){
  messageTimeout = setTimeout(function(){
    closeMessages();
  }, 10000);
}

function flashMessage(type, message){
  clearTimeout(messageTimeout);
  timeout = 0;
  
  if ($('#messages').hasClass('closed') == false){
    closeMessages();
    timeout = 500;
  }
  
  setTimeout(function(){
    $('#messages div').remove();
    $('#messages').append("<div class='container " + type + "'>" + message + "</div>");
    openMessages();
  }, timeout)
  messageGernade();
}