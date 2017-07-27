$( document ).ready(function(){
  $("#filter-links").on('keyup', filterLinks)
  // $("#show-unread").on("click", showUnead)
})

function filterLinks(){
  var filter = this.value.toUpperCase()
  var links = document.getElementsByClassName('a-link')

  for (var i=0; i<links.length; i++){
    var title = links[i].children[0].children[0].innerText
    var url = links[i].children[0].children[1].innerText
    var matched = title.toUpperCase().indexOf(filter) > -1 || url.toUpperCase().indexOf(filter) > -1
    links[i].style.display = matched ? "" : "none"
  }
}


//
// function showunRead(){
//   debugger
//   var unread = document.getElementsByClassName('false')
//   var read = document.getElementsByClassName('true')
//   $(read).hide()
// }
