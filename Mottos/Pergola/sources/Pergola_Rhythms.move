

module ride::Pergola_Rhythms {

	
	use std::string::{ String };
	
	use ride::Loft;
	
	#[view]
    public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
    }
	
}