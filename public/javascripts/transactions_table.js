$(document).ready(function() {
	oTable = $('#transactions').dataTable( {
		"aaSorting": [[ 0, "desc" ]],
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