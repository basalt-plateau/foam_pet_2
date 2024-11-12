


module ride_1::Merci_Steady_1 {
	
	use std::string::{ String, utf8 };
	
	
	use ride_1::Merci_Bayanihan;
	
	#[view]
	public fun Bayanihan () : String {
		Merci_Bayanihan::Bayanihan ()
	}	
	
	#[test (
		estate_1_signer = @ride_1, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		use std::vector;
		use ride_1::Merci_Harvest;
		
		Merci_Harvest::Establish_the_Mercy_Harvest (& estate_1_signer)
		
	}
}


