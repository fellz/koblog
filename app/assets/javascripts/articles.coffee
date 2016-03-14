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
  comment_id = $(this).attr('data-id')
  localStorage.setItem('comment_id', comment_id)
  $(this).remove()

$('#comment_submit').click (e)->
  e.preventDefault()
  author = $('#author').val()
  content = $('#content').val()
  article_id = $('#article_id').val()
  parent_id = localStorage.comment_id
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
          localStorage.removeItem('comment_id')
          window.location.reload()
        ).fail((msg)->
          console.log "Fail"
          console.log msg
        )

$('.comment_delete').click (e)->
  e.preventDefault()
  comment_id = $(this).attr('data-id')
  $.ajax(
      method: 'DELETE'
      url: '/comments/'+comment_id
      data:
        comment_id: comment_id).done((msg) ->
            console.log "Success"
            window.location.reload()
          ).fail((msg)->
            console.log "Fail"
            console.log msg
          )
  