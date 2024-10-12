
// "src/lib/taverns/u64/index.vitest.js"

import { describe, it, expect } from 'vitest';
import assert from 'assert'

import { u64_adapter } from '$lib/taverns/u64'
import { uint8_array_equality } from '$lib/taverns/uint8_array/equality'

describe ('u64 adapter', () => {
	describe ('from hexadecimal string', () => {
		describe ('to bigint', () => {
			it ('FF00000000000000 to 255n', () => {
				const base_10_amount = u64_adapter ({
					"entrance": {
						"amount": "FF00000000000000",
						"format": "hexadecimal string"
					},
					"exit": {
						"format": "bigint"
					}
				});
				
				console.log ({ base_10_amount })
				
				assert.equal (base_10_amount, 255n)
			});
		});
	});
	
	describe ('from u_int_8_array', () => {
		describe ('to bigint', () => {
			it ('[ 255, 0, 0, 0, 0, 0, 0, 0 ] to 255n', () => {
				const uint8Array = new Uint8Array ([ 255, 0, 0, 0, 0, 0, 0, 0 ]);
				
				const base_10_amount = u64_adapter ({
					"entrance": {
						"amount": uint8Array,
						"format": "u_int_8_array"
					},
					"exit": {
						"format": "bigint"
					}
				});
				
				console.log ({ base_10_amount })
				
				assert.equal (base_10_amount, 255n)
			});
			
			it ('[ 255, 0, 0, 0, 0, 0, 0, 255 ] to 18374686479671623935n', () => {
				const uint8Array = new Uint8Array ([ 255, 255, 255, 255, 255, 255, 255, 255 ]);
				
				const base_10_amount = u64_adapter ({
					"entrance": {
						"amount": uint8Array,
						"format": "u_int_8_array"
					},
					"exit": {
						"format": "bigint"
					}
				});
				assert.equal (base_10_amount, 18446744073709551615n)
				
				
				const u_int_8_array = u64_adapter ({
					"entrance": {
						"amount": base_10_amount,
						"format": "integer"
					},
					"exit": {
						"format": "u_int_8_array"
					}
				});
				const are_equal = uint8_array_equality (u_int_8_array, uint8Array);
				assert.equal (are_equal, "yuh")
			});
		});
	});
	
	describe ('from integer', () => {
		describe ('to hexadecimal string', () => {
			it ('255n to FF00000000000000', () => {
				const entrance_integer_amount = 255n
				const exit_hexadecimal_string_amount = "FF00000000000000"
				
				const hexadecimal_string_amount = u64_adapter ({
					"entrance": {
						"amount": entrance_integer_amount,
						"format": "integer"
					},
					"exit": {
						"format": "hexadecimal string"
					}
				});
				
				console.log ({ hexadecimal_string_amount })
				
				assert.equal (hexadecimal_string_amount, exit_hexadecimal_string_amount)
			});
		});
	});
});


