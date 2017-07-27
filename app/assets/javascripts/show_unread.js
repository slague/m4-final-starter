$( document ).ready(function(){
  $("#show-unread").on('click', showUnread)

  function showUnread(){
    var read = document.getElementsByClassName('true')
    var unread = document.getElementsByClassName('false')
    $(read).hide()
  }
})
