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
  add_thing()


root.check_price = ->
  ok = true
  (if check_fields("things" + id) == false then ok = false) for id  in [1..root.id]
  return ok

root.check_fields = (id) ->
  if ($("#" + id + "[price]")[0].value != "" and $("#" + id + "[currency]") == "") or ($("#" + id + "[price]")[0].value == "" and $("#" + id + "[currency]") != "")
    return false
#  alert("A")

root.id = parseInt(0,10)

root.add_thing = ->
  root.id = parseInt(parseInt(root.id, 10) + 1, 10)
  $.get '/add_thing/' + root.id, (data)->$("#table_body").append("#{data}")

root.selected_category = (id, thing_id) ->
  $.get '/get_things/' + $("#" + id)[0].value,
  (data)->$("#" + thing_id)[0].innerHTML = "#{data}"


root.selected_thing = (id, unit_id) ->
  $.get '/get_unit/' + $("#" + id)[0].value, (data)->$("#" +unit_id)[0].innerHTML = "#{data}"
