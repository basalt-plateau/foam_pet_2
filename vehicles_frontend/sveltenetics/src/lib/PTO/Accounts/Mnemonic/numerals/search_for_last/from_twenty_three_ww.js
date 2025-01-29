

/*
	worker = new Worker ("$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three_ww.js");


	worker = new Worker (
		new URL ("$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three_ww.js", import.meta.url), 
		{ type: 'module' }
	);
	
	worker.postMessage ("1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1");
	worker.onmessage = function(event) {
		console.log("Legit numerals:", event.data); // Handle results from the worker
	};
*/

import {
	search_for_last_from_twenty_three
} from "$lib/PTO/Accounts/Mnemonic/numerals/search_for_last/from_twenty_three.js"


self.onmessage = async function (event) {
	console.log ("from_twenty_three_ww", event);
	
	const twenty_three = event.data;
	const legit_numerals = await search_for_last_from_twenty_three (twenty_three);
	
	self.postMessage ({
		twenty_three,
		legit_numerals
	});
}