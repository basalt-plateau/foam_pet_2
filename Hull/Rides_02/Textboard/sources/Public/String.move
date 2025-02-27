

/*
	Module_String::does_string_have_partial ()
*/
module Builder_01::Module_String {
	
	use std::string::{ Self, utf8, String };
	use std::debug;
	use std::string_utils;
		
		
	#[view] public fun Volitions () : String { 
		use Builder_01::Rules_Module; Rules_Module::Volitions_01 () 
	}
	
	
	/*
		if (Module_String::does_string_have_partial (
			& utf8 (b"GCATGACTATCATACTATCACGTGACATGCTAGCT"), 
			& utf8 (b"GC")
		) == utf8 (b"yep")) {
			
		}
	*/
	public fun does_string_have_partial (
		string_1 : & String, 
		partial_string : & String
	) : String {
		let index = string::index_of (string_1, partial_string);
		if (string::length (string_1) == index) {
			return utf8 (b"nah")
		};
		
		utf8 (b"yep") // eureka
	}
	
	
	#[test]
	fun watch__string_has_partial () {
		use std::debug;
		use std::string_utils;
		
		assert! (
			does_string_have_partial (
				& utf8 (b"GCATGACTATCATACTATCACGTGACATGCTAGCT"), 
				& utf8 (b"GC")
			) == utf8 (b"yep"), 
			0
		);
		
		assert! (
			does_string_have_partial (
				& utf8 (b"14123412343212342412341234123421234"), 
				& utf8 (b"5")
			) == utf8 (b"nah"), 
			0
		);
	}
}



