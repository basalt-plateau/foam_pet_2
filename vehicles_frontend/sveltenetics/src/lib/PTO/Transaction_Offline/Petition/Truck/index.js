
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
import { ask_for_freight as ask_for_Versies_freight } from '$lib/Versies/Trucks'
		

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
	const Versies_freight = ask_for_Versies_freight ().net_path;
	const net_path = Versies_freight.net_path;
	console.log ({ net_path });
	
	
	trucks [1] = build_truck ({
		freight: {
			net_path,
			
			leaf_name: "Petition Form",
			
			next: "no",
			next_note: "Unfinished",
			back: "no",
			back_note: "Can't go back",
			
			
			/*
				perhaps:
			
				legend: {
					Petition Form:
						can visit: "yes"		
				
				}
			*/
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
			
			
			petition_field_barrier: "",
			
			petition_AO_bracket: {},
			petition_AO_hexadecimal_string: "",
			petition_AO_fiberized: "",
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
	return trucks [1].monitor (async ({ 
		pro_freight, 
		original_freight,
		//
		target,
		//
		property, 
		value
	}) => {
		console.info ("petition freight changed:", { property, value });
		
		/*
			target = bracket_of_freight
		*/
		try {
			
			// petition modification
			if (
				target === original_freight &&
				property === "petition_fields"
			) {
				if (original_freight.petition_fields.mode === "entry") {
					const { 
						barrier,

						TP2_fiberized
						
					} = await build_entry_petition_AO ({
						net_path: original_freight.net_path,
						petition_fields: original_freight.petition_fields
					});
					
					if (barrier !== false) {
						console.error ({ barrier });
						pro_freight.petition_field_barrier = barrier
					}
					else {
						pro_freight.petition_AO_fiberized = TP2_fiberized;
					}
				}
			}
			
			/*
			if (target === original_freight.petition_fields) {
				console.log ("target:", original_freight.petition_fields);
				
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
			*/

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
		
		action (pro_freight);
	})
}

