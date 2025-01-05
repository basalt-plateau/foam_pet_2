





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
import { ask_for_extension_network_connection_status } from './Tracks/ask_for_extension_network_connection_status'
//
//
////

const trucks = {}
	
	


let extension_network_connection_status_track;

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = async (packet) => {
	let _stages = {}
	
	if (packet && packet.stages) {
		_stages = packet.stages;
	}
	
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
			stage: {},
			
			network_status: {
				connected: "",
				aptos: "",
				status: {},
				UTC_orbit: ""
			},
			
			ask_for_stage () {
				const freight = trucks [1].freight;
				const stage_name_connected = freight.stage_name_connected;
				return freight.stages [ stage_name_connected ];
			},
			
			async prompt ({ petition }) {
				const stage = trucks [1].freight.ask_for_stage ();
				await stage.prompt ({ petition });
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
			clear: async () => {
				trucks [1].freight.stage_name_connected = "";
				trucks [1].freight.stage = {};
				trucks [1].freight.network_status = {};
			},
			connect: async ({ stage_name }) => {	
				console.log ("extension winch connect:", { stage_name });
				
				await trucks [1].freight.clear ();
				
				const stage = trucks [1].freight.stages [ stage_name ];
				await stage.connect ();
				trucks [1].freight.stage_name_connected = stage_name
				localStorage.setItem ("extension winch connected", stage_name);
				
				trucks [1].freight.stage = stage;
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
					await trucks [1].freight.clear ();
					
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
			// console.info ("😃 extension winch changed", property, value)
			
			
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	});
	
	
	extension_network_connection_status_track = ask_for_extension_network_connection_status ();
	extension_network_connection_status_track.play ();
		
	
	return trucks [1];	
}

export const destroy = () => {
	extension_network_connection_status_track.stop ();
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