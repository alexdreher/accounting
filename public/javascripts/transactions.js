var accounting = {
  setupAjaxCallbacks: function(){
    $('body').ajaxStart(function () {
      $('#ajax_status').show().text("Loading...");
    });
    
    $('body').ajaxStop(function () {
      $('#ajax_status').fadeOut();
    });
  },
  
  ajaxifyForm: function() {
    $form = $("#new_transaction");
    
    $form.submit(function(e) {
      e.preventDefault();
      $.post($form.attr('action')+ '.js', $form.serializeArray(), null, 'script');
      $('#transaction_book_date').select();
    });    
  },
  
  /** 
  * this method overwrites the enter key in a form field 
  * standard behavior: submit the form
  * desired behavior: jump to the next input field
  *   like pressing the TAB-key
  */
  enterizeFormFields: function(){
    $('#transaction_book_date').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_debit').select();return false; }});
    $('#transaction_debit').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_credit').select();return false; }});
    $('#transaction_credit').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_amount').select();return false; }});
    $('#transaction_amount').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_title').select();return false; }});
    $('#transaction_title').keypress(function(event){ if(event.keyCode == 13) { $('#transaction_submit').focus();return false; }});
  },
};

jQuery(function () {
  accounting.setupAjaxCallbacks();
  
  accounting.ajaxifyForm();
  
  accounting.enterizeFormFields();
  
  // select the first input field to be abled to start typing right away
  $('#transaction_book_date').select();
});