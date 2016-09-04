$(document).on "click", ".file_activate", (ev)->
  selector = $(this).attr("for")
  $(selector).click()

$(document).on "change", ".remotipart", (ev)->
  $(this).parent().parent().submit()
