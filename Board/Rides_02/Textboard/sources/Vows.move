


module Builder_01::Vows {

	
	
	/*
		Hulls
	*/
	
	
	/*
		Hull
	*/
	
	
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
	#[test] 
	#[expected_failure (abort_code = 100003, location = Builder_01::Hulls_Module)]
	public fun Text_03 () { 
		use Builder_01::Text_Length_Limiter::{ Vow }; Vow (); 
	}
	#[test] public fun Text_04 () { 
		use Builder_01::Text_Retrieves_Zero_From_Empty_Platform::{ Vow }; Vow (); 
	}
	
	/*
		Producer Hulls
			01 Can begin
			02 Can play and pause
			
			Unwritten:
				* While Paused, can't text anything
	*/
	#[test] public fun Producer_Hulls_01 () { 
		use Builder_01::Hulls_can_begin::{ Vow_01 }; Vow_01 (); 
	}
	#[test] public fun Producer_Hulls_02 () { 
		use Builder_01::Hulls_can_play_and_pause::{ Vow_01 }; Vow_01 (); 
	}
	
	
	/*
		Producer Hull:
			01 Can play then pause
	*/
	#[test] public fun Producer_Hull_01 () { 
		use Builder_01::Producer_Hull_can_play_and_pause::{ Vow_01 }; Vow_01 (); 
	}
	
	
	/*
		Producer Text
			01 Can delete a text from platform ""
			02 Can delete a text from platform ""			
	*/
	#[test] public fun Producer_Text_01 () {
		use Builder_01::Producer_Texts_can_delete_a_text::{ Vow }; Vow ();
	}
	#[test] public fun Producer_Text_02 () {
		use Builder_01::Producer_Texts_can_delete_a_text_from_platform::{ Vow }; Vow ();
	}
}