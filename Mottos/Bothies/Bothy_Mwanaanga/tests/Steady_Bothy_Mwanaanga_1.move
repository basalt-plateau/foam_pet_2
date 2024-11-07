







module ride::Steady_Bothy_Mwanaanga_1 {
	
	
	
	#[test(estate_1_signer = @ride, estate_2_signer = @ride_2)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use ride::Bothy_Mwanaanga_Health_1;
		
		Bothy_Mwanaanga_Health_1::novel_1 (estate_1_signer, estate_2_signer);
	}
}