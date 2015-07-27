$ ->
  $(window).load ->

    list = $('.reviews-wrapper')

    $container = list.isotope
      itemSelector: '.poster-wrapper'
