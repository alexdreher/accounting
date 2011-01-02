$(document).ready(function() {
	oTable = $('#transactions').dataTable( {
		"aaSorting": [[ 0, "desc" ]],
		"oLanguage": {
		  "sProcessing":   "Processing...",
    	"sLengthMenu":   "Show _MENU_ entries",
    	"sZeroRecords":  "No matching records found",
    	"sInfo":         "Showing _START_ to _END_ of _TOTAL_ entries",
    	"sInfoEmpty":    "Showing 0 to 0 of 0 entries",
    	"sInfoFiltered": "(filtered from _MAX_ total entries)",
    	"sInfoPostFix":  "",
    	"sSearch":       "Search:",
    	"sUrl":          "",
    	"oPaginate": {
    		"sFirst":    "First",
    		"sPrevious": "Previous",
    		"sNext":     "Next",
    		"sLast":     "Last"
    	}
		},
		"aoColumns": [ 
					/* id */      null,
					/* date */   	{ "sType": "date", "sWidth": "120px" },
					/* debit */   null,
					/* credit */  null,
					/* amount */  { "sClass": "right" },
					/* title */   { "sWidth": "400px" }
				]
	} );
} );