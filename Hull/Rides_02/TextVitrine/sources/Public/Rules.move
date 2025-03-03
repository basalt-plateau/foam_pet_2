



module Builder_01::Rules_Module {
	
	/*
		These volitions are given by the ruler.
		
		This module is everyone's to play with however 
		they so please.

		Everyone is allowed to make modules that are 
		exactly the same or derivate of this module.
		
		A module can volunteer these volitions as 
		the volitions for the entirety of the module 
		by doing this:
		
		#[view]
		public fun Volitions () : String { Rules_Module::Volitions_01 () }		
	*/
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	#[view]
	public fun Volitions_01 () : String {
		let vectors : vector<u8> = vector::empty<u8> ();

		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"\n");		
		vector::append (&mut vectors, b"These volitions are given by the ruler.\n");
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"This module is everyone's to play with however\n");
		vector::append (&mut vectors, b"they so please.\n");		
		vector::append (&mut vectors, b"\n");		
		vector::append (&mut vectors, b"Everyone is allowed to make modules that are\n");
		vector::append (&mut vectors, b"exactly the same or derivate of this module.\n");
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"A module can volunteer these volitions as\n");
		vector::append (&mut vectors, b"the volitions for the entirety of the module\n");
		vector::append (&mut vectors, b"by doing this:\n");		
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"#[view]\n");
		vector::append (&mut vectors, b"public fun Volitions () : String { Rules_Module::Volitions_01 () }\n");		
		vector::append (&mut vectors, b"\n");
		vector::append (&mut vectors, b"\n");

		utf8 (vectors)
	}
	
	#[test]
	public fun steady_1 () {
		use std::string::{ Self, String };
		use std::debug;
		use std::string_utils;
		
		let rules : String = Volitions_01 ();
		
		/*
		debug::print (& string_utils::format1 (
			& b"Rules: {}", 
			rules
		));
		*/
		
		
		debug::print (& string_utils::format1 (
			& b"Rules Length: {}", 
			string::length (& rules)
		));
		
		assert! (string::length (& rules) == 378, 0);
	}
}


