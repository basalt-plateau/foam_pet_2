
/*
	import { retrieve_truck } from './index.js'
	const Truck = retrieve_truck ();
*/

/*
	start:
		refresh_truck
*/

/*
	end:
		destroy_truck
*/	

import { build_truck } from '$lib/trucks'
import { build_entry_petition_AO } from './screenplays/build_entry_petition_AO'
	

const trucks = {}

export const verify_leaf = ({ } = {}) => {
	const freight = trucks [1].freight;
	const leaf_name = freight.leaf_name;
	
	if (leaf_name === "Petition Form") {
		
	}
};

export const next = () => {
	const freight = trucks [1].freight;
	const leaf_name = freight.leaf_name;
	
	
}
export const back = () => {
	const freight = trucks [1].freight;
	const leaf_name = freight.leaf_name;
	
	
}
export const go_to = ({ leaf_page }) => {
	return () => {
		console.log ("go_to", leaf_page);
	
		const freight = trucks [1].freight;
		const leaf_name = freight.leaf_name;
		
		freight.leaf_name = freight.legend [ leaf_page ]	
	}
}

export const refresh_truck = () => {
	trucks [1] = build_truck ({
		freight: {
			net_path: "",
			
			leaf_name: "Petition Form",
			next: "no",
			back: "no",
			note: "Unfinished",
			
			legend: {
				1: "Petition Form",
				2: "Petition Verification",
				3: "Petition Send",
				4: "Flourish Receive",
				5: "Flourish Verification",
				6: "Adaptation Suggestion"			
			},
			
			leaves: {
				"Petition Form": {
					"next": "no",
					"back": "no"
				}
			},
			
			petition_fields: {
				mode: "",
				
				address: "",
				module_name: "",
				fonction_name: "",
				
				type_parameters: [],
				parameters: []
			},
			petition_bracket: {}
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
	return trucks [1].monitor (({ freight, property, value, target, original_freight }) => {
		// console.info ("petition freight changed:", { property, value, target, original_freight });
		
		try {
			if (target === original_freight.petition_fields) {
				if (property === "address") {
					console.log ("address changed");
				}
				else if (property === "type_parameters") {
					console.log ("type_parameters changed");
				}
				
				build_entry_petition_AO ({
					net_path: original_freight.net_path,
					petition_fields: original_freight.petition_fields
				});
			}

		}
		catch (exception) {
			console.error ("exception", exception);
		}
		
		if (property === "leaf_name") {
			//
			//
			//	This modifies the "next" & "back" buttons.
			//
			//
			// verify_land ()
		}
		
		action (freight);
	})
}

