$ ->
  
  $('[data-unfold]').on 'click', (event) ->
    $el = $(event.currentTarget)
    $el.hide()
    $el.parents('[data-list-item]').find('[data-hidden-area]').show()
  
  $('[data-fold]').on 'click', (event) ->
    $el = $(event.currentTarget)
    $el.parent('[data-hidden-area]').hide()
    $el.parents('[data-list-item]').find('[data-unfold]').show()
  
  $('textarea').autosize()
