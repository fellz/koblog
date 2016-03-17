# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
subs = (t)->
  that = t
  user_id = $(t).attr('user')
  category_id = $(t).attr('category')
  $.ajax(
    method: 'GET'
    url: 'subscriptions/subscribe?category_id='+category_id+'&user_id='+user_id
    ).done((msg) ->
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