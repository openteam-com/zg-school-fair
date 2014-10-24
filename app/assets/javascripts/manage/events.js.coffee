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

    $('.sticky_elements').append('<div class="element">
      <a href="' + url.attr('href') + '">' + url.text() + '</a>
      <span class="del_icon"><a href="#">x</a></span>
      <input name="event[related][]" type="hidden" value="' + $(this).attr('id') + '" class="hidden_ids">
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
  $('#type_select option:selected').val() || 'http://znaigorod.ru/api/afisha_collection'



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
          button = "<div><button class='js-add-relation' type='button' remote='true' id='#{v.prefix}_#{k}' disabled>Добавлено</button></div>"
        else
          button = "<div><button class='js-add-relation' type='button' remote='true' id='#{v.prefix}_#{k}'>Добавить</button></div>"

        $('.posters').append("
        <li class='poster'>
          <div class='image'><a href='#{v.url}'><img src='#{v.image}'/></a></div>
          <div class='details'>
            <a href='#{v.url}'>#{v.title}</a>
            #{button}
          </div>
        </li>
        ")
