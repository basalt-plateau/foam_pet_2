


/*
	import { make_the_flourisher, destroy_the_flourisher } from "$lib/Singles/Extension_Winch"
	make_the_flourisher ();
	destroy_the_flourisher ();
*/

/*
	import { onMount, onDestroy } from "svelte"
	import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	
	let flourisher_freight = Extension_Winch.freight ();
	let flourisher_monitor;
	onMount (async () => {
		flourisher_monitor = Extension_Winch.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			flourisher_freight = pro_freight;
		});
	});
	onDestroy (async () => {
		flourisher_monitor.stop ()
	});
*/

/*
	import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	const EWF = Extension_Winch.freight ();
*/

/*
	import * as Extension_Winch from "$lib/Singles/Extension_Winch"		
	const EWF = Extension_Winch.freight ();
	EWF.prompt ();
*/


////
//
//
import { build_truck } from '@visiwa/trucks'
//
//
import { send_to_extension } from './Petition/send_to_extension.js'
//
import { Rise_stage_creator } from "./Stages/Rise.js"
import { Petra_stage_creator } from "./Stages/Petra.js"
import { Pontem_stage_creator } from "./Stages/Pontem.js"
//
//
////

const trucks = {}
	




/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = async () => {
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			
			/*
				These are effectively aliases.
				
				They don't need to be the actual
				name of the wallet.
			*/
			stages: {
				Rise: {},
				Petra: {},
				Pontem: {}
			},
			stage_name_connected: "",
			
			
			ask_for_stage () {
				const freight = trucks [1].freight;
				const stage_name_connected = freight.stage_name_connected;
				return freight.stages [ stage_name_connected ];
			},
			
			async prompt () {
				const stage = trucks [1].freight.ask_for_stage ();
				await stage.prompt ();
			},
			
			
			/*
				This is meant to be called after
				build_truck is called.
			*/
			async check_for_local_storage_connection () {
				const freight = trucks [1].freight;
				
				const extension_winch_connected = localStorage.getItem ("extension winch connected");
				if (
					typeof extension_winch_connected === "string" && 
					extension_winch_connected.length >= 1
				) {
					try {
						if (extension_winch_connected in freight.stages) {
							freight.stage_name_connected = extension_winch_connected;
							await freight.connect ({ 
								stage_name: extension_winch_connected 
							});
						}
						else {
							console.info (`"${ extension_winch_connected }" is not in freight.stages`);
						}
						
						return;
					}
					catch (imperfection) {
						console.error (imperfection);
					}
					
					localStorage.removeItem ("extension winch connected");
				}
			},
			connect: async ({ stage_name }) => {	
				console.log ("extension winch connect:", { stage_name });
				
				const stage = trucks [1].freight.stages [ stage_name ];
				await stage.connect ();
				trucks [1].freight.stage_name_connected = stage_name
				localStorage.setItem ("extension winch connected", stage_name);
			},
			disconnect: async () => {
				const freight = trucks [1].freight;
				
				console.log ("disconnect", freight);
				
				if (freight.stage_name_connected.length >= 1) {
					const stage_name = freight.stage_name_connected;
					
					await trucks [1].freight.stages [ stage_name ].disconnect ();
					
					//
					//
					//
					//
					trucks [1].freight.stage_name_connected = "";
					
					//
					//	Remove the connected wallet name from local storage
					//
					//
					localStorage.removeItem ("extension winch connected");
					return;
				}
				
				console.error ("There doesn't seem to be a wallet bridge connected.");				
			},
			
			//
			// vintage
			send_to_extension,
		}
	});
	

	trucks [1].freight.stages.Rise = await Rise_stage_creator ({ freight: trucks [1].freight });
	trucks [1].freight.stages.Petra = await Petra_stage_creator ({ freight: trucks [1].freight });
	trucks [1].freight.stages.Pontem = await Pontem_stage_creator ({ freight: trucks [1].freight });
	
	let stages = trucks [1].freight.stages;
	for (let stage_name in stages) {
		await trucks [1].freight.stages [ stage_name ].status ();
	}

	
	trucks [1].freight.check_for_local_storage_connection ();
	
	window.extension_winch = trucks [1].freight;


	/*
		Changes to the freight can be monitored here:
		
			* 	original_freight: 
					is the "freight" object that was passed to:
					build_truck ({ freight });

			* 	pro_freight:
					is the proxy object that encapsulates
					the original_freight for monitoring purposes.
			
			* 	bracket: the bracket or sub-bracket where the change occurred.
			
			* 	property: the property that changed
			* 	value: the value that changed
	*/
	// supervisor, manager
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
			console.info ("😃 extension winch changed", property, value)
			
			
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	return trucks [1];	
}

export const destroy = () => {
	delete trucks [1];
}

export const freight = () => {
	return trucks [1].freight;
}

export const retrieve = () => {
	return trucks [1];
}


/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
/*
	let flourisher_monitor = ask_for_flourisher_monitor ();
	flourisher_monitor.stop ()
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}