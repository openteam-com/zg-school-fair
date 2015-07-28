$ ->
  $('#proposal_participant_type_absentia').change ->
    $('.proposal_space').slideUp()

    true

  $('#proposal_participant_type_full_time').change ->
    $('.proposal_space').slideDown()

    true

  true
