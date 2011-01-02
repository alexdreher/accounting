$(document).ready(function() {
	oTable = $('#transactions').dataTable( {
		"aaSorting": [[ 0, "desc" ]],
		"oLanguage": {
		  "sProcessing":   "Bitte warten...",
    	"sLengthMenu":   "_MENU_ Einträge anzeigen",
    	"sZeroRecords":  "Keine Einträge vorhanden.",
    	"sInfo":         "_START_ bis _END_ von _TOTAL_ Einträgen",
    	"sInfoEmpty":    "0 bis 0 von 0 Einträgen",
    	"sInfoFiltered": "(gefiltert von _MAX_  Einträgen)",
    	"sInfoPostFix":  "",
    	"sSearch":       "Suchen",
    	"sUrl":          "",
    	"oPaginate": {
    		"sFirst":    "Erster",
    		"sPrevious": "Zurück",
    		"sNext":     "Nächster",
    		"sLast":     "Letzter"
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