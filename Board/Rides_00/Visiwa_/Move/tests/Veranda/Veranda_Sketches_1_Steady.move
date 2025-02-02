


module ride::Veranda_Sketches_1_Steady {
	use std::debug;
	use ride::Veranda_Sketches_1;
	
	#[test]
    public fun return_string_is_established () {
        let string_1 = Veranda_Sketches_1::return_string ();
        debug::print (& string_1);
    }
}