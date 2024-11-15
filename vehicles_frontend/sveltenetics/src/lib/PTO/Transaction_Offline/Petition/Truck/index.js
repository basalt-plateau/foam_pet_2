


import { build_truck } from '$lib/trucks'
	

const trucks = {}

export const verify_leaf = () => {
	const freight = trucks [1].freight;
	const leaf_name = freight.leaf_name;
	
	
	
};


export const refresh_truck = () => {
	trucks [1] = build_truck ({
		freight: {
			leaf_name: "Petition Form"
		}
	})
}

export const destroy_truck = () => {
	delete trucks [1];
}

export const retrieve_truck = () => {
	return trucks [1];
}



export const monitor_truck = (action) => {	
	return trucks [1].monitor (({ freight, property, value, target }) => {
		console.info ("property:", { property, value, target });
		
		if (property === "leaf_name") {
			//
			//
			//	This modifies the "next" & "back" buttons.
			//
			//
			verify_land ()
		}
		
		action (freight);
	})
}

