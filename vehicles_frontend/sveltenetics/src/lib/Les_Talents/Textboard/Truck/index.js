

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"

	onMount (async () => {	
		Textboard_Truck.make ()
	});
	onDestroy (() => {
		Textboard_Truck.destroy ()
	});
*/

/*
	import { onMount, onDestroy } from 'svelte'
	import * as Textboard_Truck from "$lib/Les_Talents/Textboard/Truck/index.js"
	
	let TT_Monitor;
	let TT_Freight;
	onMount (async () => {
		TT_Freight = Textboard_Truck.retrieve ().pro_freight; 
		
		TT_Monitor = Textboard_Truck.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			try {
				if (bracket === original_freight.info && property === "text") {
					console.info ("text changed.");
				}
			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});
	});

	onDestroy (() => {
		TT_Monitor.stop ()
	}); 
*/

////
//
import { build_truck } from '@visiwa/trucks'
//
//
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"		
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
import { view_fonction } from "$lib/PTO_API/View/index.js"
//
//
import { ask_is_producer } from './screenplays/ask_is_producer.js'
//
////



const trucks = {}

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = () => {
	
	const Motte_01_LA = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
	
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			info: {
				is_producer: ask_is_producer (),
				
				Builder_01: Motte_01_LA,
				
				texts: [],
				platform_name: "",
				text: "",
				
				hulls: [],
				
				searching_for_texts: "no"
			},
			fonctions: {
				scout: async () => {
					const View_Fonctions = {
						is_Hull_built: `${ Builder_01 }::Hulls_Module::is_Hull_built`,
						retrieve_vector_of_hull_names: `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
						retrieve_texts: `${ Builder_01 }::Hulls_Module::retrieve_texts`
					};
				},
				retrieve_texts: async ({ platform_name }) => {
					trucks [1].freight.searching_for_texts = "yup"
					
					const Builder_01 = trucks [1].freight.info.Builder_01;
					const { texts } = await trucks [1].freight.fonctions.retrieve_texts_for_platform ({
						Builder_01,
						platform_name
					});
					
					trucks [1].freight.info.texts = texts;
					trucks [1].freight.info.searching_for_texts = "no"
				},
				send_text: async () => {
					let EWF = Extension_Winch.freight ();
					
					const Builder_01 = trucks [1].freight.info.Builder_01;
					const platform_name = trucks [1].freight.info.platform_name;
					const text = trucks [1].freight.info.text;
					
					/* public entry fun Send_Text (writer : & signer, text : String, platform : String) */
					const { result, note, transaction } = await EWF.prompt ({
						petition: {
							function: `${ Builder_01 }::Hulls_Module::Send_Text`,
							type_arguments: [],
							arguments: [
								text,
								platform_name
							]
						}
					});
					console.info ({ result, note, transaction });
					
					/*
					if (result === "discovered") {
						petition_APT_button.mode ("success", { note });
					}
					else {
						petition_APT_button.mode ("imperfection", { note });
					}
					*/
				},
				retrieve_texts_for_platform: async () => {
					const Builder_01 = trucks [1].freight.info.Builder_01;
					const platform_name = trucks [1].freight.info.platform_name;
					
					const { result } = await view_fonction ({
						body: {
							"function": `${ Builder_01 }::Hulls_Module::Retrieve_Texts`,
							"type_arguments": [],
							"arguments": [
								platform_name
							]
						}
					});
					
					const texts = result [0].map (text => {
						return {
							text: text.text,
							writer_address: address_to_hexadecimal (text.writer_address),
							writer_balance: ask_convert_Octas_to_APT ({ Octas: text.writer_balance }) 
						}
					});
					
					trucks [1].freight.info.texts = texts;
				},
				retrieve_hulls: async () => {
					const Builder_01 = trucks [1].freight.info.Builder_01;
					
					const { result } = await view_fonction ({
						body: {
							"function": `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
							"type_arguments": [],
							"arguments": []
						}
					});
					
					console.log ("retrieve_hull_names:", { result });
					
					const hulls = result [0].map (name => {
						/*
						if (name === "") {
							return {
								name: ,
								label: "front"
							}
						}
						*/
						
						return {
							name
						}
					});
					
					trucks [1].freight.info.hulls = hulls;
				}

			}
		}
	});
	
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
export const freight = () => {
	return trucks [1].freight;
}

/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}