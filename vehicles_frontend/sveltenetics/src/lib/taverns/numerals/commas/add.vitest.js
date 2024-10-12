
// vitest "lib/taverns/numerals/commas/add.vitest.js"


import { add_commas } from '$lib/taverns/numerals/commas/add'
import { describe, it, expect } from 'vitest';

import assert from 'assert'


describe ('add_commas', () => {

	
	describe ('commas_every 3', () => {
		describe ('integer', () => {
			it ('integer digits', () => {
				expect (add_commas (-12345, { commas_every: 3 })).toBe ("-12,345");
				expect (add_commas (0, { commas_every: 3 })).toBe ("0");
				expect (add_commas (412341234, { commas_every: 3 })).toBe ("412,341,234");
				expect (add_commas (1234123412341234, { commas_every: 3 })).toBe ("1,234,123,412,341,234");
			});
			
			it ('rational digits', () => {
				expect (add_commas ("1.1234", { commas_every: 3 })).toBe ("1.123,4");
				expect (add_commas ("-12345.12345", { commas_every: 3 })).toBe ("-12,345.123,45");
				expect (add_commas ("-12345.12345", { commas_every: 3 })).toBe ("-12,345.123,45");
				
				expect (
					add_commas ("-123456789.123456789", { commas_every: 3 })
				).toBe ("-123,456,789.123,456,789");
			});
		});
	});
	
	describe ('commas_every 4', () => {
		describe ('integer', () => {
			it ('integer digits', () => {
				expect (add_commas (-12345, { commas_every: 4 })).toBe ("-1,2345");
				expect (add_commas (-12345, { commas_every: 4 })).toBe ("-1,2345");
				
				expect (add_commas (0, { commas_every: 4 })).toBe ("0");
				
				expect (add_commas (412341234, { commas_every: 4 })).toBe ("4,1234,1234");
				expect (add_commas (1234123412341234, { commas_every: 4 })).toBe ("1234,1234,1234,1234");
			});
			
			it ('rational digits', () => {
				expect (add_commas ("1.1234", { commas_every: 4 })).toBe ("1.1234");
				expect (add_commas ("-12345.12345", { commas_every: 4 })).toBe ("-1,2345.1234,5");
				expect (add_commas ("-12345.12345", { commas_every: 4 })).toBe ("-1,2345.1234,5");
				
				expect (add_commas ("-123456789.123456789", { commas_every: 4 })).toBe ("-1,2345,6789.1234,5678,9");
			});
		});
	});
	
	
	
	describe ('commas_every 5', () => {
		describe ('integer', () => {
			it ('0 digits', () => {
				expect (
					add_commas (0)
				).toBe ("0");
			});
			
			it ('10 digits', () => {
				expect (
					add_commas (1234567890)
				).toBe ("12345,67890");
			});
			
			it ('11 digits', () => {
				expect (
					add_commas (12345678900)
				).toBe ("1,23456,78900");
			});
		})
		
		describe ('strings', () => {
			it ('0 digits', () => {
				expect (
					add_commas ('0')
				).toBe ("0");
			});
			
			it ('10 digits', () => {
				expect (
					add_commas ('1234567890')
				).toBe ("12345,67890");
			});
			
			it ('11 digits', () => {
				expect (
					add_commas ("12345678900")
				).toBe ("1,23456,78900");
			});
		})
		
		describe ('with orb', () => {
			it ('10 digits', () => {
				expect (add_commas ('12345678.90')).toBe ("123,45678.90");
			});
			
			it ('10 digits', () => {
				expect (add_commas ('12345678.1234567890')).toBe ("123,45678.12345,67890");
			});
			
			it ('10 digits', () => {
				expect (
					add_commas ('12345678.012345678901234567890')
				).toBe ("123,45678.01234,56789,01234,56789,0");
			});
		});
	});
});
