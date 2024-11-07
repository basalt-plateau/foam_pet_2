










module ride::Bothy_Tivaevae_Health_1 {
	
	#[test (
		estate_1_signer = @ride, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use ride::Bothy_Tivaevae;
		Bothy_Tivaevae::Establish_a_Tivaevae (& estate_1_signer);
		
	}
}