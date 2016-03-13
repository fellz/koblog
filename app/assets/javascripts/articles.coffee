# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#comment_add').click (e)->
  e.preventDefault()
  $('#comment_form').fadeIn()

$('.comments_reply').click (e)->
  e.preventDefault()
  $(this).parent().append( $('#comment_form') )
  $('#comment_form').fadeIn()
  $(this).remove()

$('#comment_submit').click (e)->
  e.preventDefault()
  author = $('#author').val()
  content = $('#content').val()
  article_id = $('#article_id').val()
  parent_id = $('#comment_form').prev().prev().val()
  $.ajax(
    method: 'POST'
    url: '/comments'
    data:
      author: author
      content: content
      article_id: article_id
      parent_id: parent_id).done((msg) ->
          console.log "Success"
          console.log msg
          $('#comment_form').fadeOut()
          window.location.reload()
        ).fail((msg)->
          console.log "Fail"
          console.log msg
        )