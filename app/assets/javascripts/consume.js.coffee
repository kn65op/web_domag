# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? this

root.some_function = ->
  submit = $('#submit')
  submit.click(dso = ->
    id = $("#id")[0].value
    $.get '/en/consume/' + id,
      amount: $("#consume")[0].value,
      (data) ->
        $("#ok").append("#{data}")
    return false
  )
