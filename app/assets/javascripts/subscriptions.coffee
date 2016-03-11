# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('.category_subs').change (e)->
  that = this
  userid = $(this).attr('user')
  categoryid = $(this).attr('category')
  $.ajax(
    method: 'POST'
    url: 'subscriptions/subscribe'
    data:
      user_id: userid
      category_id: categoryid).done((msg) ->
          console.log "Success"
          console.log msg
        ).fail((msg)->
          console.log "Fail"
          console.log msg
        )
