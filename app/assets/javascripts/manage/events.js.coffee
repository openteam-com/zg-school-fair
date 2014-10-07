$ ->
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
      <span class="del_icon"></span>
      <input name="events[related_items][]" type="hidden" value="' + $(this).attr('id') + '" class="hidden_ids">
      </div>')
perform_ajax = ->
  $.ajax
    type: 'get'
    url: 'http://znaigorod.ru/api/afisha_collection'
    crossDomain: true
    dataType: 'JSONP'
    data:
      q : $('#search').val()
    success: (response) ->
      $.each response, (k, v) ->
        $('.posters').append("
        <li class='poster'>
          <div class='image'><a href='#{v.url}'><img src='#{v.image}'/></a></div>
          <div class='details'>
            <a href='#{v.url}'>#{v.title}</a>
            <div><button class='js-add-relation' type='button' remote='true' id='afisha_#{k}'>Добавить</button></div>
          </div>
        </li>
        ")
