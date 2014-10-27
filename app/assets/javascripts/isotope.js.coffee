$ ->
  $(window).load ->

    list = $('.posters')

    columnWidth = list.data('item-width')

    $container = list.isotope
      itemSelector: '.item'
      masonry:
        columnWidth: columnWidth
