


import { build_truck } from '$lib/trucks'
	

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
					"back": "no",
					"fields": {
						"name": "",
						"module_name": "",
						"fonction_name": "",
						
						"type_params": [],
						"params": []
					}
				}
			}
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
			// verify_land ()
		}
		
		action (freight);
	})
}

