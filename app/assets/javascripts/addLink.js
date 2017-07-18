
function addLink() {
  var linkData = {
    link: {
      title: $("#link_title").val(),
      url: $("#link_url").val(),
      read: $("#link_read").val()
     }
  }

  $.ajax({
    url: "/links",
    method: "POST",
    data: linkData
  }).fail(function() {
    alert( "Not a valid url." )
  })
    .done(function(newLinkMarkup) {
        // (newLinkMarkup).insertBefore( "#link-1" )
        $("#links").append(newLinkMarkup);
        $("#link_title").val("");
        $("#link_url").val("");
        $("#link_read").val("");
    });
  }

function bindSubmitListenerAndAddLink() {
  $("#new_link").submit(function(event) {
    event.preventDefault();
      addLink();
  });
}

$(document).ready(function(){
  bindSubmitListenerAndAddLink();
})
