# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? this

root.set_lang_from_link =  ->
  select = $("#lang_select")[0]
  selected_option = select.options[select.selectedIndex]
  lang_form =  $('#lang_form')[0]
  action = lang_form.action
  index = action.indexOf("/", 9) + 1 #9 is length of https://
  action = action.substr(0, index) + selected_option.value + action.substr(index + 2) #2 length of value
  lang_form.action = action
  null

window.onload = ->
  alert("A")
