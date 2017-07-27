$( document ).ready(function(){
  $("#show-read").on('click', showRead)

  function showRead(){
    var read = document.getElementsByClassName('true')
    var unread = document.getElementsByClassName('false')
    $(unread).hide()
  }
})
