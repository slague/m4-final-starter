$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  // $("body").on("click", ".mark-as-read", addHotRead)
})

function markAsRead(e) {
  e.preventDefault();
  var $link = this.href
  var linkId = parseInt(this.parentElement.parentElement.parentElement.id.split('-')[1])

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStat)
    .fail(displayFailure);
}

function updateLinkStat(link) {
  var parent = $(`#link-${link.id}`)
  var div = parent.children()[0]
  $(div).addClass('true').removeClass('false')
  var link = parent.children()[0].children[2].children[0]
  link.innerText = "Mark unread"
  $(link).addClass("mark-as-unread").removeClass("mark-as-read")
  addHotRead(link)
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}


function addHotRead(link){
  $.ajax({
    type: "POST",
    url: "https://m4-hot-reads.herokuapp.com/links",
    data: link,
  }).then()
    .fail(displayFailure)
}
