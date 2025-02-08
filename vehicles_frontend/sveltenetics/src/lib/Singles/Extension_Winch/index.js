


/*
	Could ask for wallet network status if the wallet 
	is asking to connect to a trusted node.
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
import { ask_for_extension_network_connection_status } from './Tracks/ask_for_extension_network_connection_status'
import { find_transaction_by_hash_loop } from '$lib/PTO/Transaction/find_by_hash_loop'
import { ask_for_freight } from '$lib/Versies/Trucks'
//
//
////
	

const trucks = {}
	
	
/*
	If want to drop support for a wallet,
	announce that they need to move their
	private key to a supported wallet.
*/
/*
	These are effectively aliases.
	
	They don't need to be the actual
	name of the wallet.
*/
/*
	This is set in the index.html
*/
const allow_wallets = window.allow_wallets;


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
			stages: {
				// Rise: {},
				// Petra: {},
				// Pontem: {}
			},
			stage_name_connected: "",
			stage: {},
			
			propose_for_account_address () {
				try {
					const freight = trucks [1].freight;
					const stage_name_connected = freight.stage_name_connected;
					const stage = freight.stages [ stage_name_connected ];
					
					return stage.account.address;
				}
				catch (imperfection) {
					console.error (imperfection);
				}
				
				return ""
			},
			
			ask_for_stage () {
				const freight = trucks [1].freight;
				const stage_name_connected = freight.stage_name_connected;
				return freight.stages [ stage_name_connected ];
			},
			
			
			
			/*
				// result: discovered, otiose
				//
				const { result, note, transaction } = await EWF.prompt ({
					petition: {
						function: '0x1::coin::transfer',
						type_arguments: ['0x1::aptos_coin::AptosCoin'],
						arguments: [
							origin_address.address_hexadecimal_string,
							amount
						]
					}
				});
				if (result === "discovered") {
					petition_APT_button.mode ("success", { note });
				}
				else {
					petition_APT_button.mode ("imperfection", { note });
				}
			*/
			async prompt ({ petition }) {
				const stage = trucks [1].freight.ask_for_stage ();
				const { pending_transaction_hash } = await stage.prompt ({ 
					petition 
				});
				
				const net_path = ask_for_freight ().dapp_network.net_path;
				
				try {
					const { result, note, transaction } = await new Promise (resolve => {
						try {
							find_transaction_by_hash_loop ({
								bracket: {
									net_path,
									transaction_hash: pending_transaction_hash
								},
								discovered ({ note, bracket }) {
									console.log ("discovered", { note, bracket });

									resolve ({
										result: "discovered",
										note,
										transaction: bracket
									});							
								},
								otiose () {
									console.log ("otiose");
									
									resolve ({
										result: "otiose",
										note: `There was a problem locating transaction ${ pending_transaction_hash }.`,
										transaction: ""
									});	
								}
							});
							return;
						}
						catch (exception) {
							console.error (exception);
						}
						
						resolve ({
							result: "otiose",
							note: `There was a problem locating transaction ${ pending_transaction_hash }.`,
							transaction: ""
						});	
					});
					
					return { 
						result, 
						note, 
						transaction 
					};
				} 
				catch (imperfection) {
					console.error (imperfection);
				}
				
				
				return { 
					result: "otiose",
					note: `The peition could not be prompted.`,
					transaction: ""
				};
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
				console.info ("extension winch connect:", { stage_name });
				await trucks [1].freight.clear ();
				
				const stage = trucks [1].freight.stages [ stage_name ];
				console.info ("connecting to:", stage_name);
				
				await stage.connect ();
				const is_connected = await stage.is_connected ();
				if (is_connected !== "yes") {
					console.error ("A connection to the extension wallet could not be established.");					
					return;
				}
				
				trucks [1].freight.stage_name_connected = stage_name
				trucks [1].freight.stage = stage;
				console.info ("connected to:", stage_name);
				
				
				
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
	
	/*
	
	if (allow_wallets [ "Rise" ] === "yup") {
		try {
			trucks [1].freight.stages.Rise = await Rise_stage_creator ({ freight: trucks [1].freight });
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	}
	
	if (allow_wallets [ "Petra" ] === "yup") {
		try {
			trucks [1].freight.stages.Petra = await Petra_stage_creator ({ freight: trucks [1].freight });
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	}
	
	if (allow_wallets [ "Pontem" ] === "yup") {
		try {
			trucks [1].freight.stages.Pontem = await Pontem_stage_creator ({ freight: trucks [1].freight });
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	}

	
	let stages = trucks [1].freight.stages;
	for (let stage_name in stages) {
		console.info ("searching for:", stage_name);
		
		try {
			await trucks [1].freight.stages [ stage_name ].status ();
		}
		catch (imperfection) {
			console.error (imperfection);
		}
	}
	*/


	//
	console.info ("checking for local storage connection");
	trucks [1].freight.check_for_local_storage_connection ();
	console.info ("checked for local storage connection");
	
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
	
	
	// extension_network_connection_status_track = ask_for_extension_network_connection_status ();
	// extension_network_connection_status_track.play ();
		
	
	return trucks [1];	
}

export const destroy = () => {
	// extension_network_connection_status_track.stop ();
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