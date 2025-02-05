


module Builder_01::Vows {
	
	
	/*
		Games
	*/
	
	
	/*
		Game
	*/
	
	/*
		Text
	*/
	
	/*
		Producer Games
			* Can begin
			* Can play and pause
			
			Unwritten:
				* While Paused, can't text anything
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01
	)]
	public fun Vow_Games_01 (
		aptos_framework_consenter : signer,
		producer_01_consenter : signer
	) {
		use Builder_01::Games_can_begin;
		Games_can_begin::Vow_01 (
			aptos_framework_consenter,
			producer_01_consenter
		)		
	}
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01
	)]
	public fun Vow_Games_02 (
		aptos_framework_consenter : signer,
		producer_01_consenter : & signer
	) {
		use Builder_01::Games_can_play_and_pause;
		Games_can_play_and_pause::Vow_01 (
			aptos_framework_consenter,
			producer_01_consenter
		)		
	}
	
	/*
		Producer Game
	*/
	
	/*
		Producer Text
	*/
}