$( document ).ready(function(){
  $(".show-unread").on("click", showUnread)
})


function showUnread() {
debugger
  var unread = document.getElementsByClassName('false')
  var read = document.getElementsByClassName('true')
  debugger
  // $(unread).show()
  $(read).hide()
}
