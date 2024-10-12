


/*
 

*/

import { build_truck } from '$lib/trucks'
	
// import * as Fraction from 'fraction.js'	
import Fraction from 'fraction.js';
import Big from 'big.js';

const trucks = {}


import { monitor_leaf_1 } from "./Screenplays/monitor_leaf_1"


export const is_leaf_1_prepared = () => {
	const freight = trucks [1].freight;
	
	monitor_leaf_1 ({ freight });
};

export const verify_land = () => {
	// console.log ('verify land')
	
	const freight = trucks [1].freight;
	const current_land = freight.current_land;
	
	console.log ("verify land");
	
	
	
	/*
		from_address_hexadecimal_string
		to_address_hexadecimal_string
		amount
		
		transaction_expiration
	*/
	/* if (current_land === "Transaction_Fields") {
		
		
		// check if leaf 1 is prepared
		
		trucks [1].freight.current.back = "no"
		trucks [1].freight.current.next = "no"
		// trucks [1].freight.current.note = `The "from" address isn't `
	}*/
	
	if (current_land === "Petition_Verification") {
		trucks [1].freight.current.back = "yes"
		trucks [1].freight.current.next = "yes"
	}
	else if (current_land === "Unsigned_Transaction") {
		trucks [1].freight.current.back = "yes"
		trucks [1].freight.current.next = "yes"
	}
	else if (current_land === "Transaction_Signature_Fields") {
		if (freight.transaction_signature.verified === "yes") {
			trucks [1].freight.current.next = "yes"
		}
		else {
			trucks [1].freight.current.next = "no"
		}
		
		trucks [1].freight.current.back = "yes"
	}
	else if (current_land === "Transaction_Signature") {
		trucks [1].freight.current.back = "yes"
		trucks [1].freight.current.next = "yes"
	}
	else if (current_land === "Ask_Consensus") {
		trucks [1].freight.current.back = "yes"
		trucks [1].freight.current.next = "no, last"
	}
	else {
		trucks [1].freight.current.back = "no"
		trucks [1].freight.current.next = "no"
	}
};

export const delete_unsigned_transaction = () => {
	trucks [1].freight.unsigned_transaction = {
		hexadecimal_string: "",
		Aptos_object: {},
		Aptos_object_fiberized: "",
		
		alerts_info: [],
		
		// freight.unsigned_transaction.exception_text = ""
		exception_text: ""
	}
}



export const refresh_truck = () => {
	trucks [1] = build_truck ({
		freight: {
			unfinished_extravaganza: {
				showing: "no"
			},
			
			current_land: "Transaction_Fields",
			
			current: {
				// land: "Transaction_Fields",
				next: "no",
				back: "no",
				note: "Unfinished"
			},
			
			lands: {
				// 1
				Transaction_Fields: {
					next: "no",
					back: "no"
				},
				
				// 2
				Petition_Verification: {
					next: "yes",
					back: "yes"
				},
				
				Unsigned_Transaction: {
					next: "no",
					back: "yes"
				},
				Transaction_Signature_Fields: {
					next: "no",
					back: "yes"
				},
				Transaction_Signature: {
					next: "no",
					back: "yes"
				}
			},
			
			fields: {
				ICANN_net_path: "https://api.devnet.aptoslabs.com/v1",
				net_name: "devnet",
				//
				from_address_hexadecimal_string: "",
				from_address_exception: "",
				from_address_permitted: "no",
				//
				//
				to_address_hexadecimal_string: "",
				to_address_exception: "",
				to_address_permitted: "no",
				//
				//
				currency: "APT", // Octas
				//
				actual_amount_of_Octas: calculate_actual_octas ("0"),
				actual_amount_of_Octas_problem: "",
				//
				//
				transaction_expiration: "600",
				//
				use_custom_gas_unit_price: "yes",
				gas_unit_price: "100",
				//
				use_custom_max_gas_amount: "yes",
				max_gas_amount: "200000",
				
				problems: {
					from_address_hexadecimal_string: "",
					to_address_hexadecimal_string: "",
					amount: ""
				}
			},
			unsigned_transaction: {
				hexadecimal_string: "",
				//
				//	freight.unsigned_transaction.Aptos_object
				Aptos_object: {},
				Aptos_object_fiberized: "",
				
				//	freight.unsigned_transaction.alerts_info
				alerts_info: [],
				
				// freight.unsigned_transaction.exception_text = ""
				exception_text: ""
			},
			transaction_signature: {
				// freight.transaction_signature.hexadecimal_string
				hexadecimal_string: "",
				//	freight.transaction_signature.Aptos_object
				Aptos_object: {},
				Aptos_object_fiberized: "",
				//
				
				
				//
				// freight.transaction_signature.info_text
				info_text: "waiting for a signature",
				//
				// freight.transaction_signature.verified = "yes"
				verified: "no",
				//
				//
				barcode_land: {},
				//
				// freight.transaction_signature.hexadecimal_land.added = "yes"
				hexadecimal_land: {
					added: "no"
				}
			},
			ask_consensus: {
				transaction_Aptos_object_fiberized: "",
				transaction_hash: "",
				
				//
				// 	while waiting for transaction to process
				//
				//	freight.ask_consensus.waiting_info
				waiting_info: "",
				
				//	freight.ask_consensus.success_info
				// success_info: "",
				show_alert_success: "no",
				
				//
				// freight.ask_consensus.exception_info
				exception_info: ""
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


const calculate_actual_octas = (original_amount) => {
	let float_amount = parseFloat (original_amount)
	return float_amount.toString ()
}

//
//	const monitor = 
//
//
let latest_amount_of_Octas = "1e8"
let latest_amount = "1"
let latest_currency = "1"
export const monitor_truck = (action) => {	
	return trucks [1].monitor (({ freight, property, value, target }) => {
		console.info ("property:", { property, value, target });
		
		if (property === "current_land") {
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







