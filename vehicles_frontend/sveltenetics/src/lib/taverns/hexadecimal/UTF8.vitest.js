

//
//
// "src/lib/taverns/hexadecimal/string_from_UTF8.vitest.js"
//
//

//
//
import { hexadecimal_string_from_UTF8 } from '$lib/taverns/hexadecimal/UTF8'
import { UTF8_from_hexadecimal_string } from '$lib/taverns/hexadecimal/UTF8'
import { Uint8Array_from_string } from '$lib/taverns/hexadecimal/Uint8Array_from_string'
	
//
import { describe, it, expect } from 'vitest';
import assert from 'assert'
//
//ssssw

/*
	parseInt ("7B", 16)
	parseInt ("22", 16)
*/
describe ('hexadecimal_string_from_UTF8', () => {
	it ('fonctions', () => {
		const original = JSON.stringify ({
			petition: "1583387FC4738",
			notes: {}
		})
		
		const hexadecimal_string = hexadecimal_string_from_UTF8 (original);
		const original_reversed = UTF8_from_hexadecimal_string (hexadecimal_string);
		const u_int_8_array = Uint8Array_from_string (hexadecimal_string)
		
		expect (original).toBe (original_reversed);
		
		console.log ({ hexadecimal_string, original_reversed, u_int_8_array });
	});
});



