var position = 0;
function resetHash(){
  position = window.pageYOffset;
  window.location.hash = "";
  $('html, body').scrollTop(position);
}

function colorbox_init(id){
  $('#' + id + '_link').colorbox({ inline:true, width:'80%', height:'80%', href:'#' + id, speed:750, fade:true, returnFocus:false, onOpen:function(){ }, onClosed:function(){ } });
  return false;
}
function colorbox_display(id){
  $('#' + id + '_link').colorbox({ inline:true, width:'80%', height:'360px', href:'#' + id, speed:750, fade:true, returnFocus:false, onOpen:function(){ }, onClosed:function(){ } });
  return false;
}

function scrollToId(id){
  $('html, body').animate({ scrollTop: ($('#' + id).offset().top - 20) }, 1000)
}

function showViewer(id){
  $('.viewer').fadeOut('slow');
  window.setTimeout(function(){
    $('#'+id).fadeIn('slow');
  }, 1000);
}

function setUpTheatre(){
  $('.colorbox-links.for-video a').click(function(){
    $('.colorbox-links.for-video a').removeClass('active');
    $(this).addClass('active');
    id = $(this).attr('id');
    showViewer(id.substr(5))
    return false;
  })
}

function setUpSlideshow(){
  $('.viewer-previous').hide();
  
  $('.viewer-next').click(function(){
    container_id = $(this).attr('id').substr(5);
    current = $('#' + container_id + ' .viewer').not('.hidden');
    next = current.next();
    current.hide();
    
    // prevent duplicate clicks
    if (!next.hasClass('viewer')){ return false; }
    
    if (next.prev().hasClass('viewer')){
      $('#' + container_id + ' .viewer-previous').show();
    }
    if (!next.next().hasClass('viewer')){
      $('#' + container_id + ' .viewer-next').hide();
    }
    
    window.setTimeout(function(){
      next.show().removeClass('hidden');
      current.addClass('hidden');
    }, 200);
    
  })
  
  $('.viewer-previous').click(function(){
    container_id = $(this).attr('id').substr(9);
    current = $('#' + container_id + ' .viewer').not('.hidden');
    next = current.prev();
    current.hide();
    
    // prevent duplicate clicks
    if (!next.hasClass('viewer')){ return false; }
    
    if (next.next().hasClass('viewer')){
      $('#' + container_id + ' .viewer-next').show();
    }
    if (!next.prev().hasClass('viewer')){
      $('#' + container_id + ' .viewer-previous').hide();
    }
    
    window.setTimeout(function(){
      next.show().removeClass('hidden');
      current.addClass('hidden');
    }, 200);
    
  })
  
}

$(document).ready(function(){
  nav_bg = new Image();
  nav_bg.src = "/images/nav/highlight.png";
});