


module Ride_01::APT_Octas_Math_01 {
	
	use std::string::{ Self, String, utf8 };
	use std::vector;
	use std::string_utils;
	use std::signer;
	use std::debug;
		
	use Ride_01::Rules_10;
	
	const Ending_characters_are_not_1234567890_or_period : u64 = 1;
	
	#[view]
	public fun Volitions () : String { Rules_10::Volitions_01 () }
	
	#[view]
	public fun APT_to_Octas (apt : String) : String {
		// Guarantee that digits are "1234567890."
		if (glyphs_are_1234567890_or_period (apt) != true) {
			abort Ending_characters_are_not_1234567890_or_period
		};
		
		let octas = utf8 (b"0");
		
		octas
	}
	
	
		
	#[view]
	public fun glyph_is_1234567890_or_period (glyph : String) : bool {
		let result = false;
		
		let okay_glyphs = utf8 (b"1234567890.");
		let index_end = string::length (& okay_glyphs);
		if (index_end == 0) {
			return false
		};
		
		let index = 0;
		for (index in 0..index_end) {
			let okay_glyph = string::sub_string (& okay_glyphs, index, index + 1);
			if (glyph == okay_glyph) {
				result = true;
				break;
			}
		};
		
		
		result
	}
	
	#[view]
	public fun glyphs_are_1234567890_or_period (sequence : String) : bool {
		let index_end = string::length (& sequence);
		if (index_end == 0) {
			return false
		};
		
		let dots = 0;
		
		let index = 0;
		for (index in 0..index_end) {
			let glyph = string::sub_string (& sequence, index, index + 1);
			if (glyph_is_1234567890_or_period (glyph) != true) {
				return false
			};
			
			if (glyph == utf8 (b".")) {
				dots = dots + 1;
			};
		};
		
		if (dots >= 2) {
			return false
		};
		
		return true
	}
	
	
	
	
}