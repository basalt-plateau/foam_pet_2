


module Ride_01::Templates_Steady_1 {

	use std::vector;

	
	#[test]
    public fun steady_glyph_content_guarantees () {
		use std::string::{ String, utf8 };
		
		use Ride_01::APT_Octas_Math_01::{ 
			glyph_is_1234567890_or_period,
			glyphs_are_1234567890_or_period
		}; 
		
		//use std::string_utils;
		//use std::debug;
		//debug::print (& string_utils::format1 (& b"yup: {}", glyph_is_1234567890_or_period (utf8 (b"0"))));
		
		assert! (glyph_is_1234567890_or_period (utf8 (b"0")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"1")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"2")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"3")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"4")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"5")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"6")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"7")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"8")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"9")), 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b".")), 1);

		assert! (glyph_is_1234567890_or_period (utf8 (b"")) == false, 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"Z")) == false, 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"A")) == false, 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"*")) == false, 1);
		assert! (glyph_is_1234567890_or_period (utf8 (b"-")) == false, 1);
		

		assert! (glyphs_are_1234567890_or_period (utf8 (b"0")), 1);
		assert! (glyphs_are_1234567890_or_period (utf8 (b"0123456789.")), 1);

		assert! (glyphs_are_1234567890_or_period (utf8 (b"")) == false, 1);
		assert! (glyphs_are_1234567890_or_period (utf8 (b"0123456789*")) == false, 1);
		assert! (glyphs_are_1234567890_or_period (utf8 (b"0123456789-")) == false, 1);
		
		// more than 1 dot.
		assert! (glyphs_are_1234567890_or_period (utf8 (b"0123.123.123")) == false, 1);
	}
	
	
	
	
	
	
	
	#[test (
		aptos_framework_consenter = @0x1, 
		ride_01_consenter = @Ride_01
	)]
    public fun steady (
		aptos_framework_consenter : signer,
		ride_01_consenter : signer
	) {	
		use std::vector;
		use std::string_utils;
		use std::signer;
		use std::debug;
		use std::string::{ String, utf8 };
		
		use Ride_01::APT_Octas_Math_01::{ 
			APT_to_Octas
		}; 
		
		

		
		//
		//	APT: 2.1000000		=== 2,1000,0000 Octas
		//	APT: 0002.1			=== 2,1000,0000 Octas		
		//	APT: 2.1			=== 2,1000,0000 Octas
		//	APT: 1 				=== 1,0000,0000 Octas
		//	APT: 0.1			===   1000,0000 Octas
		//	APT: 0.01			===    100,0000 Octas
		//	APT: 0.001			===     10,0000 Octas
		//	APT: 0.0001			===      1,0000 Octas
		//	APT: 0.00001		===        1000 Octas
		//	
		//
		let apt = utf8 (b"1483298347");
		let octas = APT_to_Octas (apt);
		if (octas != utf8 (b"100000000")) { abort 1 };
		
		debug::print (& string_utils::format1 (& b"octas: {}", octas));
	}
}