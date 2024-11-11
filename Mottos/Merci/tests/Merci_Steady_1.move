


module ride_1::Merci_Steady_1 {
	
	use std::string::{ String, utf8 };
	use std::vector;
	
	use ride_1::Merci_Symbiotic;
	
	#[view]
	public fun Symbiotic () : String {
		Merci_Symbiotic::Symbiotic ()
	}	
	
	#[test (
		estate_1_signer = @ride_1, 
		estate_2_signer = @ride_2
	)]
    public fun novel_1 (
		estate_1_signer : signer,
		estate_2_signer : signer		
	) {	
		
	}
}


