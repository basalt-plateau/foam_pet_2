


module Builder_01::Vows {

	
	
	use std::signer;
	use std::string::{ String };
	use std::vector;

	use aptos_framework::create_signer;
	use aptos_framework::account;
	

	#[test_only]
	public fun create_consenters (count : u64) : vector<signer> {
		use std::unit_test;
		use aptos_framework::account;
		
		let vector_of_signers = vector::empty<signer>();
		
		/*
		// let APTOS_FRAMEWORK_ADDRESS : address = 0x1;
		let test_signer : signer = create_signer::create_signer (@0x1);
		// let signer_address = signer::address_of(&test_signer);
		
		// let aptos_framework_signer = signer::borrow_global_mut<signer>(@0x1);
		vector::push_back (&mut signers, test_signer);
		*/
		
		let signers = &mut unit_test::create_signers_for_testing (2);
        let (signer_01, signer_02) = (
			vector::pop_back (signers), 
			vector::pop_back (signers)
		);
		
		

		
		
        account::create_account_for_test (signer::address_of (& signer_01));
        account::create_account_for_test (signer::address_of (& signer_02));
        // (alice, bob)
		
		vector::push_back (&mut vector_of_signers, signer_01);
		vector::push_back (&mut vector_of_signers, signer_02);
		
		
		// signers
		
		vector_of_signers
	}
	
	
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
		Producer Game:
			* 
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01,
		
		writer_01_consenter = @1000001,
		writer_02_consenter = @1000002
	)]
	public fun Producer_Game_01 (
		aptos_framework_consenter : signer,
		producer_01_consenter : & signer,
		
		writer_01_consenter : & signer,
		writer_02_consenter : & signer
	) {
		use aptos_framework::account; 
		
		use Builder_01::Producer_Game_can_play_and_pause;
		
		let consenters = create_consenters (2);
		// let writer_03_consenter = vector::borrow (& consenters, 0);
		
		let consenter_01 = account::create_account_for_test (@0x1000001);
		
		Producer_Game_can_play_and_pause::Vow_01 (
			aptos_framework_consenter,
			producer_01_consenter,
			& consenter_01,
			// vector::borrow (& consenters, 0),
			vector::borrow (& consenters, 1)
		)		
	}
	
	
	/*
		Producer Text
			* Can delete a text from platform ""
	*/
	#[test (
		aptos_framework_consenter = @0x1, 
		producer_01_consenter = @Producer_01,
		
		writer_01_consenter = @9000000,
		writer_02_consenter = @9000001
	)]
	public fun Producer_Text_01 (
		aptos_framework_consenter : signer,
		producer_01_consenter : & signer,
		
		writer_01_consenter : & signer,
		writer_02_consenter : & signer
	) {
		use Builder_01::Producer_Texts_can_delete_a_text;
		Producer_Texts_can_delete_a_text::Vow_01 (
			aptos_framework_consenter,
			producer_01_consenter,
			writer_01_consenter,
			writer_02_consenter
		)		
	}
}