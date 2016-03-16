# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
subs = (t)->
  that = t
  userid = $(t).attr('user')
  categoryid = $(t).attr('category')
  $.ajax(
    method: 'POST'
    url: 'subscriptions/subscribe'
    data:
      user_id: userid
      category_id: categoryid).done((msg) ->
          console.log "Success"
          console.log msg
          window.location.reload()
        ).fail((msg)->
          console.log "Fail"
          console.log msg
        )

$('.subscribe').click (e)->
  subs(this)

$('.subscribed').click (e)->
  subs(this)