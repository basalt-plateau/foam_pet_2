
// vitest "lib/taverns/APT/Octas_to_APT.vitest.js"



import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'


const assert_throw = async (digit, exception_string) => {
	let proceeds;
	
	try {
		proceeds = ask_convert_Octas_to_APT ({ Octas: digit })
	}
	catch (exception) {
		assert.equal (exception.message, exception_string);
		return;
	}
	
	throw new Error (`An exception was not thrown, received: ${ proceeds }`);
}

describe ("Octas to APT", () => {
	it ("1", async () => {
		assert.equal (ask_convert_Octas_to_APT ({ Octas: "0" }), "0.00000000")
		assert.equal (ask_convert_Octas_to_APT ({ Octas: "1" }), "0.00000001")
		assert.equal (ask_convert_Octas_to_APT ({ Octas: "12" }), "0.00000012")
		assert.equal (
			ask_convert_Octas_to_APT ({ Octas: "1234567812345678123456781234567812345678" }), 
			"12345678123456781234567812345678.12345678"
		)
	});
	
	it ("has exceptions", async () => {
		assert_throw ("", "Natural numeral amount needs to be a string of length >= 1")
		assert_throw (
			".", 
			`Natural numeral glyphs need to be one of 01234567890, however at index 0, received: ".".`
		)
	});
});