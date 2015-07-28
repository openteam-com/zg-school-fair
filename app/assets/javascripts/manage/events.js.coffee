$ ->
  $('.sticky_elements').on 'click', '.element', ->
    button_id  = '#' + $(this).find('.hidden_ids').val()
    $('.posters').find(button_id).prop('disabled', false).text('Добавить')
    $(this).remove()
    true

  perform_ajax()

  $('#search').keyup ->
    $('.posters').empty()
    perform_ajax()

  $('.posters').on 'click', '.js-add-relation', ->
    $(this).text('Добавлено')
    $(this).prop('disabled', true)
    url = $(this).closest('.details').find('a')

    $('.sticky_elements').append('<div class="element col-lg-3 bg-success">
      <a href="' + url.attr('href') + '">' + url.text().substring(0,30) + '</a>
      <input name="event[related][]" type="hidden" value="' + $(this).attr('id') + '" class="hidden_ids">
      <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>')

  $('#type_select').change ->
    $('.posters').empty()
    perform_ajax()

get_related_ids = ->
  related_ids = []
  $('.hidden_ids').each ->
    arr = $(this).val().split('_')
    related_ids.push arr[1]
  related_ids

get_ajax_url = ->
  $('#type_select option:selected').val() || 'http://znaigorod.ru/api/review_collection'

perform_ajax = ->
  $.ajax
    type: 'get'
    url: get_ajax_url()
    crossDomain: true
    dataType: 'JSONP'
    data:
      q : $('#search').val()
    success: (response) ->
      $.each response, (k, v) ->
        if $.inArray(k,get_related_ids()) isnt -1
          button = "<div><button class='js-add-relation btn btn-info' type='button' remote='true' id='#{v.prefix}_#{k}' disabled>Добавлено</button></div>"
        else
          button = "<div><button class='js-add-relation btn btn-default' type='button' remote='true' id='#{v.prefix}_#{k}'>Добавить</button></div>"

        $('.posters').append("
        <div class='col-lg-2'>
          <div class='poster'>
            <div class='image'><a href='#{v.url}'><img src='#{v.image}' class='center-block'/></a></div>
            <div class='details'>
              <a href='#{v.url}'>#{v.title.substring(0,40)}</a>
              #{button}
            </div>
          </div>
        </div> ")
