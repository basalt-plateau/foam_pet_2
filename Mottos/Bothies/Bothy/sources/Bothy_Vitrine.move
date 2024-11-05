







module ride::Bothy_Vitrine {
	
	use std::string::{ String, utf8 };
	use std::vector;
	use std::debug;
	
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
	
	
	//
	//
	//	Unfinished: This might not be possible.
	//
	//
	public fun address_to_bytes (addr: address) : vector<u8> {
        let bytes : vector<u8> = vector::empty<u8>();
        
		let i = 0;
		while (i <= 31) {
		
			
           
		};
        
        bytes
    }
}




