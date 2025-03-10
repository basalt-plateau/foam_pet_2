
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
import { build_entry_petition_AO } from '$lib/PTO/Offline/Petition/build'
import { ask_for_freight as ask_for_Versies_freight } from '$lib/Versies/Trucks'
		

const trucks = {}
export const make_truck = () => {
	const Versies_freight = ask_for_Versies_freight ();
	const net_path = Versies_freight.dapp_network.net_path;
	
	
	/*
		retro: probably should have written as:
			* bracket can be printed
			* advanced can't be printed
			
		freight: {
			bracket: {
				net_path: "",
				
				present_leaf: "Petition Form",
				leaves: {
					"Petition Form": {
						"next": "no",
						"back": "no",
						
						"fields": {
							// BCS, BCS with Notes
							"format": "",
							
							// view or entry
							"mode": "",
							
							"address": "",
							"module_name": "",
							"fonction_name": "",
							
							"signer_hexadecimal_address": "",
					
							type_parameters: [],
							parameters: [],
						},
						
						"alerts": {
							note: "",
							success: "",
							problem: "",
						}
					},
					"Petition Verification": {
						"next": "no",
						"back": "no"
					},
					"Petition Send": {
						"next": "no",
						"back": "no"
					},
					Flourish_Receive: {
						"next": "no",
						"back": "no",
						
						Aptos_object_fiberized: "",
						
						"alerts": {
							note: "waiting for the signature",
							success: "",
							problem: "",
						}
					},
					Adaptation_Suggestion: {
						"next": "no",
						"back": "no",
						
						adaptation_hash: "",
						adaptation_fiberized: "",
					
						"alerts": {
							note: "",
							success: "",
							problem: "",
						}
					}
				}
			},
			advanced: {
				leaves: {
					"Petition Form": {
					
					}
				}
				
				//
				//	This is what is sent to the consensus.
				//
				//
				signature_Aptos_object: "",
			},
			fonctions: {}
		}
	
	*/
	trucks [1] = build_truck ({
		freight: {
			net_path,
			
			sound_gem: "",
			
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
			leaf_numeral: 1,
			leaf_buttons: [ 1, 2, 3, 4, 5, 6 ],
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
					
					// BCS, BCS with Notes
					"format": "BCS"
				},
				"Petition Verification": {
					"next": "no",
					"back": "no"
				},
				"Petition Send": {
					"next": "no",
					"back": "no"
				},
				Flourish_Receive: {
					"next": "no",
					"back": "no",
					
					//
					//	This is what is sent to the consensus.
					//
					//
					signature_Aptos_object: "",
					
					Aptos_object_fiberized: "",
					
					alert_note: "waiting for the signature",
					alert_success: "",
					alert_problem_1: "",
					alert_problem_2: ""					
				},
				Adaptation_Suggestion: {
					"next": "no",
					"back": "no",
					
					adaptation_hash: "",
					adaptation_fiberized: "",
				
					alert_note: "",
					alert_success: "",
					alert_problem_1: "",
					alert_problem_2: ""	
				}
			},
			
			petition_fields: {
				mode: "",
				
				address: "",
				module_name: "",
				fonction_name: "",
				
				signer_hexadecimal_address: "",
				
				type_parameters: [],
				parameters: []
			},
			
			use_fully_elected_petition_fields: "no",
			
			petition_field_barrier: "",
			
			petition_AO_bracket: {},
			petition_AO_hexadecimal_string: "",
			petition_AO_Uint8Array: "",
			petition_AO_fiberized: "",
			
			//
			//
			//	envelope: This is the petition with details
			//
			//		Fiberized: 
			//			The AO bracket with parsing so as to render.
			//
			//		Hexadecimal String: 
			//			
			//
			petition_envelope_fiberized: "",
			petition_envelope_hexadecimal_string: "",		

			
			//
			signature_hexadecimal_string: "",
		}
	});
	
	let monitor = trucks [1].monitor (async ({
		pro_freight, 
		original_freight,
		//
		target,
		//
		property, 
		value
	}) => {
		console.info ("🎶🎶 The petition freight was changed.", property, value)
		
		/*
			target = bracket_of_freight
		*/
		try {
			
			/*
				wait for petition modification
				
			*/
			if (
				target === original_freight &&
				property === "petition_fields"
			) {
				const net_path = trucks [1].freight.net_path;
				console.log ({ net_path });
				
				
				/*
					wait for entry fonction
				
				*/
				if (original_freight.petition_fields.mode === "entry") {
					const { 
						barrier, 
						TP2_fiberized,
						
						TP2_AO_Uint8Array,
						TP2_hexadecimal_string,
						
						TPE_fiberized,
						TPE
					} = await build_entry_petition_AO ({
						petition_form: trucks [1].freight.leaves ["Petition Form"],
						
						net_path,
						petition_fields: original_freight.petition_fields
					});
					
					if (barrier !== false) {
						console.error ({ barrier });
						pro_freight.petition_field_barrier = barrier
					}
					else {
						pro_freight.petition_AO_Uint8Array = TP2_AO_Uint8Array;
						pro_freight.petition_AO_fiberized = TP2_fiberized;
						pro_freight.petition_AO_hexadecimal_string = TP2_hexadecimal_string;
						
						pro_freight.petition_envelope_fiberized = TPE_fiberized;
						pro_freight.petition_envelope = TPE;
					}
				}
				
				/*
					wait for view fonction
				
				*/
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
	})	
}



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
		
		freight.leaf_numeral = leaf_page;
		freight.leaf_name = freight.legend [ leaf_page ]	
	}
}


export const destroy_truck = () => {
	delete trucks [1];
}

export const retrieve_truck = () => {
	return trucks [1];
}



export const monitor_truck = (action) => {	
	
	/*
		This
	*/
	return trucks [1].monitor (async ({ 
		pro_freight, 
		original_freight,
		//
		target,
		//
		property, 
		value
	}) => {
		// console.log ("petition truck monitor");
		
		action ({
			pro_freight, 
			original_freight,
			//
			target,
			//
			property, 
			value
		});
	})
}

