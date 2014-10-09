$ ->
  $('.notify').click ->
    hide_alert()

  setTimeout (-> hide_alert()), 3000 if $('.notify_wrapper:visible')

hide_alert = ->
    $('.notify_wrapper').fadeOut(1000)
