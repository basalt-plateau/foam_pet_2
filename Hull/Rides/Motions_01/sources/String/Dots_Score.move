

module Ride_01::Motions_01_String_Dots_Score {
	use std::string::{ Self, String, utf8, sub_string };
	
	#[view]
	public fun dots_score (sequence : String) : u8 {	
		let dots : u8 = 0;
		
		let last_index = string::length (& sequence) - 1;
		for (index in 0..last_index) {			
			if (utf8 (b".") == sub_string (& sequence, index, index + 1)) {
				dots = dots + 1;
			};
		};
		
		dots
	}
}