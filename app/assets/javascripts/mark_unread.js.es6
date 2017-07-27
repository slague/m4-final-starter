$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();
  var $link = this.href
  var linkId = parseInt(this.parentElement.parentElement.parentElement.id.split('-')[1])

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  var parent = $(`#link-${link.id}`)
  var div = parent.children()[0]
  $(div).addClass('false').removeClass('true')
  var link = parent.children()[0].children[2].children[0]
  link.innerText = "Mark read"
  $(link).addClass("mark-as-read").removeClass("mark-as-unread")
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
