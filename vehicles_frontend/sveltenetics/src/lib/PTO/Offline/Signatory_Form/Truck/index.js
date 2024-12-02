
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
export const make_truck = () => {
	const Versies_freight = ask_for_Versies_freight ().net_path;
	const net_path = Versies_freight.net_path;

	
	trucks [1] = build_truck ({
		freight: {
			net_path,
			
			sound_gem: "",
			
			leaf_name: "Petition Field",

			leaf_numeral: 1,
			legend: {
				1: "Petition Field",
				2: "Petition Verification",
				3: "Flourish Field",
				4: "Flourish Verification",
				5: "Flourish Send"			
			},
			
			leaves: {
				Petition_Field: {
					
					//
					// if empty string, then don't alert
					alert_note: "waiting for petition",
					alert_problem_1: "",
					alert_problem_2: "",					
					alert_success: "",
					
					hexadecimal_string_can_add: "yes",
					hexadecimal_string_button_text: "add",
					hexadecimal_string_problem: ""
				},
				Flourish_Field: {
					alert_note: "waiting for signature",
					alert_problem_1: "",
					alert_problem_2: "",
					alert_success: "",
					
					sign_button_text: "Sign",
					sign_button_can_sign: "yes",
					
					private_key_hexadecimal_string: "",
					address_is_legacy: false
				}
			},


			petition_envelope: "",
			petition_envelope_bracket_show: "",
			petition_envelope_hexadecimal_string: "",
			petition_fiberized: "",
			//
			//			
			petition_aptos_object: "",
			//
			//
			// this is the { petition, notes }
			envelope_show: "",
			//
			

			petition_signature_fiberized: "",
			petition_signature_hexadecimal_string: "",
			signature_field_barrier: ""
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
		console.log ("monitor?");
		
		try {}
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
	});
	
	/*
		trucks [1].pro_freight
	*/
	return trucks [1]
}

export const play_sound = () => {
	
	
	const original_freight = retrieve_truck ().original_freight;
	
}

export const verify_leaf = ({ } = {}) => {
	const freight = trucks [1].freight;
	const leaf_name = freight.leaf_name;
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

