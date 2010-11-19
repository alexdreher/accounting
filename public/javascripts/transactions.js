$('#transaction_book_date').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_debit_id').select();return false; }});
$('#transaction_debit_id').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_credit_id').select();return false; }});
$('#transaction_credit_id').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_amount').select();return false; }});
$('#transaction_amount').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_title').select();return false; }});
$('#transaction_title').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_submit').focus();return false; }});

$("#new_transaction").submit(function() {
  $.post($(this).attr('action')+ '.js', 
  $(this).serializeArray(), null, 'script');
  $('#transaction_book_date').select();
  return false;
});