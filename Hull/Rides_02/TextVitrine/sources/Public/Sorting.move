


module Builder_01::Room_Sorting {
	
	use std::vector;
	
	public fun merge_sort_prototype_merge (
		port : vector<u64>,
		star : vector<u64>
	) : vector<u64> {
		let result = vector::empty<u64>();
		
		let port_len = vector::length (& port);
		let star_len = vector::length (& star);		
		
		let index_of_port = 0;
		let index_of_star = 0;
		
		while (
			index_of_port < port_len && 
			index_of_star < star_len
		) {
			let port_boat = * vector::borrow (& port, index_of_port);
			let star_boat = * vector::borrow (& star, index_of_star);
			
			if (port_boat <= star_boat) {
				vector::push_back (&mut result, port_boat);
				index_of_port = index_of_port + 1;
			} 
			else {
				vector::push_back (&mut result, star_boat);
				index_of_star = index_of_star + 1;
			}
		};
		
		while (index_of_port < port_len) {
            vector::push_back (&mut result, * vector::borrow (& port, index_of_port));
			index_of_port = index_of_port + 1;
        };	
		
		while (index_of_star < star_len) {
            vector::push_back (&mut result, * vector::borrow (& star, index_of_star));
			index_of_star = index_of_star + 1;
        };
		
		result
	}
	
	public fun merge_sort_prototype (vector_01 : vector<u64>) : vector<u64> {
		if (vector::length (& vector_01) <= 1) {
			return vector_01
		};
		
		let mid = vector::length (& vector_01) / 2;
		let port = vector::slice (& vector_01, 0, mid);
		let star = vector::slice (& vector_01, mid, vector::length (& vector_01));

		merge_sort_prototype_merge (
			merge_sort_prototype (port), 
			merge_sort_prototype (star)
		)
	}

	
	#[test]
	public fun watch__merge_sort_prototype () {
		use std::debug;
		use std::string_utils;
		
		let vec = vector::empty<u64>();
		vector::push_back (&mut vec, 119);
		vector::push_back (&mut vec, 267);
		vector::push_back (&mut vec, 573484348297438);
		vector::push_back (&mut vec, 3509);
		vector::push_back (&mut vec, 8527384);
		
		let sorted_vec = merge_sort_prototype (vec);
		
		debug::print (& string_utils::format1 (
			& b"Vector: {}", 
			string_utils::to_string (& sorted_vec)
		));
		debug::print (& string_utils::format1 (
			& b"Vector 0: {}", 
			* vector::borrow (& sorted_vec, 0)
		));
		
		assert! (vector::length (& sorted_vec) == 5, 1);
		assert! (* vector::borrow (& sorted_vec, 0) == 119, 1);
		assert! (* vector::borrow (& sorted_vec, 1) == 267, 1);
		assert! (* vector::borrow (& sorted_vec, 2) == 3509, 1);
		assert! (* vector::borrow (& sorted_vec, 3) == 8527384, 1);
		assert! (* vector::borrow (& sorted_vec, 4) == 573484348297438, 1);
		
		
		/*
		assert! (
			does_string_have_partial (
				& utf8 (b"14123412343212342412341234123421234"), 
				& utf8 (b"5")
			) == utf8 (b"nah"), 
			0
		);
		*/
	}
	
	
	
}