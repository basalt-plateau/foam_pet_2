







module ride::Steady_Rondoval_Mtembezi_1 {
	
	#[test (
		estate_1_signer = @ride, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use ride::Rondoval_Mtembezi_Health_1;
		
		Rondoval_Mtembezi_Health_1::novel_1 (estate_1_signer, estate_2_signer);
	}
}