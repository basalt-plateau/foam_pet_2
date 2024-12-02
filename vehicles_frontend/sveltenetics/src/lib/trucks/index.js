

/*
	import { build_truck } from '$lib/trucks'
	
	const trucks = {}
	trucks [1] = await build_truck ({
		freight: {
			unsigned_transaction_fields: {
				ICANN_net_path: "",
				from_address_hexadecimal_string: "",
				to_address_hexadecimal_string: "",
				amount_of_Octas: "",
				//
				transaction_expiration: ""
			},
			
			unsigned_transaction: {
				hexadecimal_string: "",
				Aptos_object: {},
				Aptos_object_fiberized: ""
			},
			signature: {
				hexadecimal_string: "",
				Aptos_object: {},
				Aptos_object_fiberized: ""
			}
		}
	})
	
	let monitor = trucks [1].monitor (({ freight, original_freight }) => {
		console.log ({ freight })
	})	
	
	trucks [1].freight ["unsigned_transaction_fields"] ["ICANN_net_path"] = "another.path"
	
	delete trucks [1]
*/



import cloneDeep from 'lodash/cloneDeep'
import _set from 'lodash/set'

import { monitor_bracket } from '$lib/taverns/bracket/monitor'

export const build_truck = ({ freight }) => {
	let the_freight = {}
	let monitors = []
	let change_count = 0
	
	//
	//	This sends changes to each monitor.
	//	
	//
	the_freight = monitor_bracket (freight, ({ property, target, value }) => {
		change_count += 1
		for (let E = 0; E < monitors.length; E++) {
			monitors [E] ({ 
				pro_freight: the_freight,
				original_freight: freight,
				
				property,
				value,
				
				target,
				
				
				// vintage
				freight: the_freight,
			})
		}
	});
	
	const monitor = (action) => {
		monitors.push (action)
		
		return {
			stop () {
				for (let E = 0; E < monitors.length; E++) {
					if (monitors [E] === action) {
						monitors.splice (E, 1)
						return;
					}		
				}
				
				console.error ("Stopping monitoring was not possible.")
			}
		}
	}
	
	/*
	// This makes multiple enhances
	const enhance = (keys, contents) => {
		_set (the_freight, keys, contents);
	}
	*/
	
	const stop = () => {
		monitors = []
		
		the_freight.__proto__ = Object.prototype;
		the_freight = {}
		
		freight = {}
	}
	
	const retrieve_change_count = () => {
		return change_count
	}
	
	return {
		monitor,
		monitors,
		
		// enhance,
		pro_freight: the_freight,
		original_freight: freight,
		
		
		
		retrieve_change_count,
		stop,
		
		//
		// vintage
		freight: the_freight,
	}
}
