$ ->
  $('#change-resource-product').live 'click', (e) ->
    console.log ('change product')
    $('#post-select').hide()
    $("#post-select option").filter(->
      $(this).text() is 'None').attr "selected", true
    $('#product-select').show()

  $('#change-resource-post').live 'click', (e) ->
    console.log ('change post')
    $('#product-select').hide()
    $("#product-select option").filter(->
      $(this).text() is 'None').attr "selected", true
    $('#post-select').show()
