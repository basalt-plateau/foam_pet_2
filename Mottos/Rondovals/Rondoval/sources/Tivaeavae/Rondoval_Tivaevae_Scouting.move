

module ride::Rondoval_Tivaevae_Scouting {
	
	use std::string::{ String, utf8 };
	
	use ride::Loft;
	use ride::Rondoval_Tivaevae;

	
	#[view]
	public fun togetherness () : String {
		Loft::togetherness ()
	}
	
	
	
}