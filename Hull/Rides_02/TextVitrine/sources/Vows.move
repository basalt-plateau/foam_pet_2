


module Builder_01::Vows {


	/*
		Text:
			01 Can Text to Platform "" (front)
			02 Can Text To Platform "Dimension 3"
			03 Text Length Limiter
			04 Text Retrieval From Empty Platform
			
			05 Search was written between two seconds.
	*/
	#[test] public fun Text_01 () { 
		use Builder_01::Hulls_can_text_to_front::{ Vow }; Vow (); 
	}
	#[test] public fun Text_02 () { 
		use Builder_01::Hulls_can_text_to_platform::{ Vow }; Vow (); 
	}
	#[test] public fun Text_04 () { 
		use Builder_01::Text_Retrieves_Zero_From_Empty_Platform::{ Vow }; Vow (); 
	}
	
	

}