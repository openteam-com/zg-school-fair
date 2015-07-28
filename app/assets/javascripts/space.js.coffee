$ ->
  $('#proposal_participant_type').change ->
    if $(this).val() == 'full_time'
      $('.proposal_space').slideDown()
    else
      $('.proposal_space').slideUp()

    true
  true
