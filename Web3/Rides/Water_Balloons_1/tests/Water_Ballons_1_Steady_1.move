


module builder_1::Water_Ballons_1_Steady_1 {
	
	
	
	/*
		Ask:
			Sport Begin
			Player Join
			
			Sport End
	*/
	#[test (
		builder_1 = @builder_1,
		owner_1 = @owner_1,
	
		player_1 = @player_1, 
		player_2 = @player_2,
		player_3 = @player_3		
	)]
    public fun steady_1 (
		builder_1 : signer,
		owner_1 : signer,		
	
		player_1 : signer,
		player_2 : signer,
		player_3 : signer		
	) {	
		use std::debug;
		use std::signer;
		use std::string_utils;
		use std::string::{ utf8 };
		
		use builder_1::Water_Balloons_1_Sport; 
		
		Water_Balloons_1_Sport::Begin (& owner_1);
		
		
		
		Water_Balloons_1_Sport::End (& owner_1);		
	}
	
	
	
	
	
}