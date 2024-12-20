/*
	import * as Truck_1 from '@/Truck_1'
	await Truck_1.make ()
	Truck_1.destroy ()
*/

/*
	import React, { useState, useEffect } from 'react';
	import * as Truck_1 from '@/Truck_1'

	const [ Truck_1_Prepared, set_Truck_1_Prepared ] = useState ("no");
	const [ Truck_1_Monitor, set_Truck_1_Monitor ] = useState (undefined);
	const [ Truck_1_Freight, set_Truck_1_Freight ] = useState (undefined);
	
	useEffect (() => {
		set_Truck_1_Freight (Truck_1.retrieve ().freight);
		set_Truck_1_Monitor (Truck_1.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			try {
				// watch for changes to leaf_name
				if (target === original_freight && property === "leaf_name") {
					console.info ("leaf name changed");
					
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		}));
		set_Truck_1_Prepared ("yes");
		
		return () => {
			Truck_1_Monitor.stop ()
			set_Truck_1_Prepared ("no");
		}
	});
*/

/*
	
*/
import { create_wallet_link } from "@/Signatory"
import { connect_to_signatory } from "@/Signatory/connect"
import { check_signatory_connection } from "@/Signatory/is_connected"
		

import { build_truck } from '@visiwa/trucks'

const trucks = {}

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be easily deleted with "delete trucks [1]" below
*/
export const make = async () => {
	
	const wallet_link = create_wallet_link ();
	if (typeof localStorage.getItem ("AptosWalletName") === "string") {
		await connect_to_signatory ({ 
			wallet_link, 
			wallet_name: localStorage.getItem ("AptosWalletName") 
		});
		
		const is_connected = await check_signatory_connection ({ wallet_link });
		console.log ("is_connected:", is_connected);
	}
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			wallet_link,
			leaf_name: "mercy",
			leaves: {
				"Leaf 1": {
					alert_note: "This is leaf 1.",
					alert_success: "",
					alert_problem_1: "",
					alert_problem_2: ""	
				},
				"Leaf 2": {
					alert_note: "waiting for the flourish",
					alert_success: "",
					alert_problem_1: "",
					alert_problem_2: ""	
				}
			}
		}
	});
	
	/*
		This is where changes to the truck should be watched for.

			* 	original_freight: 
					is the object that was passed to:
					build_truck ({ freight });

			* 	pro_freight:
					is the proxy object that is encapsulates
					the original_freight for monitoring purposes.
			
			* 	bracket: the bracket or sub-bracket where the change occurred.
			
			* 	property: the property that changed
			* 	value: the value that changed
	*/
	let monitor = trucks [1].monitor (async ({
		original_freight,
		pro_freight, 
		//
		bracket,
		//
		property, 
		value
	}) => {
		try {
			// leaf name changed
			if (bracket === original_freight && property === "leaf_name") {
				console.info ("leaf name changed");
				
			}
			
			// Leaf 1 alert_success changed
			if (bracket === original_freight.leaves ["Leaf 1"] && property === "alert_success") {
				console.info ("Leaf 1 alert_success changed.");
			}
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
}

export const destroy = () => {
	delete trucks [1];
}

export const retrieve = () => {
	return trucks [1];
}



// This adds another monitor each time "monitor_truck" is called.
/*
	//
	// Usage:
	//
	//
	import * as Truck_1 from '$lib/trucks/truck_1/index.js'
	
	// This adds a monitor
	const Truck_Monitor = Truck_1.monitor (({ pro_freight }) => {})
	
	// This stops the monitor
	Truck_Monitor.stop ();
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}