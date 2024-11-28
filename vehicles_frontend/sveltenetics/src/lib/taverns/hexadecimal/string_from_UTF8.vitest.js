

//
//
// "src/lib/taverns/hexadecimal/string_from_Uint8Array.vitest.js"
//
//

//
//
import { hexadecimal_string_from_UTF8 } from '$lib/taverns/hexadecimal/string_from_UTF8'
//
import { describe, it, expect } from 'vitest';
import assert from 'assert'
//
//


describe ('hexadecimal_string_from_UTF8', () => {
	it ('fonctions', () => {
		const UTF8_string = JSON.stringify ({
			petition: "1583387FC4738",
			notes: {}
		});
		
		
		console.log ({ UTF8_string });
		
	});
});



