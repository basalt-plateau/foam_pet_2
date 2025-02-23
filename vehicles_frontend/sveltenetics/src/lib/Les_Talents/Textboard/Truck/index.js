



////
//
import { build_truck } from '@bothy/trucks'
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

const Guest_Fonctions = {
	view: {},
	entry: {}
};

const Producer_Fonctions = {
	entry: {}
}

/*
	This adds a truck to the trucks object as trucks [1] = ...
	Such, the truck can then be deleted with the "destroy" method.
*/
export const make = () => {
	
	const Pannier_01_LA = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD"
	
	
	
	/*
		Freight is the "state" or the object that is
		is monitored.
	*/
	trucks [1] = build_truck ({
		freight: {
			info: {
				is_producer: ask_is_producer (),
				
				Builder_01: Pannier_01_LA,
				
				hulls: [],
				
				platform_name: "",				
				texts: [],
				text: "",
				
				searching_for_texts: "no"
			},
			fonctions: {
				producer: {
					async pause_hull () {
						
					}
				},
				
				platform: {
					async show ({ name }) {
						trucks [1].freight.info.platform_name = name;
						await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
					}
				},
				
				scout: async () => {},
				
				retrieve_texts: async ({ platform_name }) => {
					trucks [1].freight.searching_for_texts = "yup"
					trucks [1].freight.info.texts = []
					
					const Builder_01 = trucks [1].freight.info.Builder_01;
					await trucks [1].freight.fonctions.retrieve_texts_for_platform ({
						Builder_01,
						platform_name
					});
					
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
							function: `${ Builder_01 }::Module_Guest_Texts::Send`,
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
					
					await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
				},
				retrieve_texts_for_platform: async () => {
					trucks [1].freight.searching_for_texts = "yup"
					trucks [1].freight.info.texts = []
					
					const Builder_01 = trucks [1].freight.info.Builder_01;
					const platform_name = trucks [1].freight.info.platform_name;
					
					const { result } = await view_fonction ({
						body: {
							"function": `${ Builder_01 }::Module_Guest_Hull::Retrieve_Texts`,
							"type_arguments": [],
							"arguments": [
								platform_name
							]
						}
					});
					
					const texts = result [0].map (text => {
						const writer_balance_apt = ask_convert_Octas_to_APT ({ Octas: text.writer_balance });
						const writer_balance_octas = text.writer_balance;
						
						
						return {
							writer_address: address_to_hexadecimal (text.writer_address),
							writer_balance_apt,
							writer_balance_octas,
							text: text.text
						}
					})
					.sort ((a, b) => {
						return parseInt (b.writer_balance_octas) - parseInt (a.writer_balance_octas)
					});
					
					
					trucks [1].freight.info.texts = texts;
					trucks [1].freight.info.searching_for_texts = "no"
				},
				retrieve_hulls: async () => {
					const Builder_01 = trucks [1].freight.info.Builder_01;
					
					const { result } = await view_fonction ({
						body: {
							"function": `${ Builder_01 }::Module_Guest_Hulls::Retrieve_Hulls_Info`,							
							"type_arguments": [],
							"arguments": []
						}
					});
					
					console.log ("retrieve_hulls:", { result });
					
					const hulls = result [0].map (platform => {
						let button_text = platform.count_of_texts === "1" ? "text" : "texts"
						
						return {
							name: platform.platform_name,
							count_of_texts: platform.count_of_texts,
							status: platform.status,
							
							button_text
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