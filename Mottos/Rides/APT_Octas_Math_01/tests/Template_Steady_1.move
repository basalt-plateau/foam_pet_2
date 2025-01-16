


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
	
	use std::string::{ String, utf8 };
	public fun guarantee_string_equality (
		parameter_1: & String, 
		parameter_2: & String
	) {
		use std::string_utils;
		use std::debug;
		
		if (parameter_1 != parameter_2) {
			debug::print (
				& string_utils::format2 (
					&b"{} != {}", 
					* parameter_1, 
					* parameter_2
				)
			);

			abort 1;
		}
	}
	
	#[test]
    public fun steady_remove_leading_zeroes () {
		use std::string::{ String, utf8 };
		use std::string_utils;
		use std::signer;
		use std::debug;
		
		use Ride_01::APT_Octas_Math_01::{ 
			remove_leading_zeroes
		}; 
		
		assert! (utf8 (b"9438") == utf8 (b"9438"), 1);
		
		assert! (remove_leading_zeroes (utf8 (b"0009438")) == utf8 (b"9438"), 1);
		assert! (remove_leading_zeroes (utf8 (b"0001")) == utf8 (b"1"), 1);
		assert! (remove_leading_zeroes (utf8 (b"0000012")) == utf8 (b"12"), 1);
		assert! (remove_leading_zeroes (utf8 (b"0009438.934")) == utf8 (b"9438.934"), 1);
	}
	
	#[test]
    public fun steady_remove_ending_zeroes () {
		use std::string::{ String, utf8 };
		use std::string_utils;
		use std::signer;
		use std::debug;
		
		use Ride_01::APT_Octas_Math_01::{ 
			remove_ending_zeroes
		}; 

		// modifications
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.01009000")), & utf8 (b"0.01009"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.0102000")), & utf8 (b"0.0102"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.01000000")), & utf8(b"0.01"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.10010")), & utf8(b"0.1001"));

		// no modifications
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"1.")), & utf8 (b"1."));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"0.10001")), & utf8(b"0.10001"));
		
		// no modifications zero next to dot
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"21.0")), & utf8 (b"21.0"));
		guarantee_string_equality (& remove_ending_zeroes (utf8 (b"1.0")), & utf8 (b"1.0"));
		

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