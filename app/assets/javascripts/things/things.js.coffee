# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? this

root.change_limits =  ->
  lc = $("#limits_info")[0]
  id = $("#thing_id")[0].innerHTML
  if typeof lc != 'undefined'
    lc.parentNode.removeChild(lc) #style.visibility="hidden"
    $.get '/thing/get_limits/' + id + "/delete"
  else
    $.get '/thing/get_limits/' + id + "/create",
      (data)->$('#limits_place').append("#{data}")


window.onload = ->
  lc = $('#limits_checkbox')[0]
  ok = typeof $('#limits_info')[0] != "undefined"
  lc.checked = ok
  $('input#search').quicksearch('table tbody tr');
