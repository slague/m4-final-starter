$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
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
  var url = link.parentElement.parentElement.children[1].innerText
  addHotRead(url)
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}

function addHotRead(url){
  $.post("https://m4-hot-reads.herokuapp.com/api/v1/hot_reads",
    {url: url})
    .then(getHotReads)
    .fail(displayFailure);
  }

  function getHotReads(){
    $.getJSON("https://m4-hot-reads.herokuapp.com/api/v1/hot_reads")
    .then(function (data){
      var hotReads = []

      data.forEach(function(read) {
        hotReads.push(read.url)
      })
      var appUrls = document.getElementsByClassName('url')
      // debugger

      for (var i =0; i<appUrls.length; i++){

        if (appUrls[i].innerText == (hotReads[0])){
          $(appUrls[i]).append("~~TOP LINK~~")
        }
        if (hotReads.includes(appUrls[i].innerText)){
          $(appUrls[i]).append("**HOT READ**")
        }
      }
    })
   }
