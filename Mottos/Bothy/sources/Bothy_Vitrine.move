







module ride::Bothy_Vitrine {
	use std::string::{ String };
	
	use ride::Loft;

	#[view]
	public fun togetherness () : String {
		let togetherness = Loft::togetherness ();
		togetherness
	}
	
	
	//
	//
	//	These are like the stuff that is for any module around the Bothy.
	//
	//
	const Novelist : address = @0x99caba6e28919a1ef5ada895a9e0b1093159f823c523eaf5eddf5cfdc3293e2f;
}




