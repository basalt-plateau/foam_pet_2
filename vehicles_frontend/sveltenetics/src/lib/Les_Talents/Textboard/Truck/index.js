



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
			change: 0,
			info: {
				is_producer: ask_is_producer (),
				
				Builder_01: Pannier_01_LA,
				
				hulls: [],
				hulls_status: "",
				
				platform_name: "",
				texts: [],
				text: "",
				
				searching_for_texts: "no",
				
				le_hulls: {
					progress: "no"
				},
				le_texts: {
					progress: "no"
				}
			},
			fonctions: {
				producer: {
					hulls: {
						async status_pause () {
							trucks [1].freight.info.le_hulls.progress = "yes"
							
							const Builder_01 = trucks [1].freight.info.Builder_01;
							const { result, note, transaction } = await Extension_Winch.freight ().prompt ({
								petition: {
									function: `${ Builder_01 }::Module_Producer_Hulls::Pause`,
									type_arguments: [],
									arguments: []
								}
							});
							console.info ({ result, note, transaction });
							
							await trucks [1].freight.fonctions.guests.hulls.status ();
							
							trucks [1].freight.info.le_hulls.progress = "no"
						},
						async status_play () {
							trucks [1].freight.info.le_hulls.progress = "yes"
							
							const Builder_01 = trucks [1].freight.info.Builder_01;
							const { result, note, transaction } = await Extension_Winch.freight ().prompt ({
								petition: {
									function: `${ Builder_01 }::Module_Producer_Hulls::Play`,
									type_arguments: [],
									arguments: []
								}
							});
							console.info ({ result, note, transaction });
							
							await trucks [1].freight.fonctions.guests.hulls.status ();
							trucks [1].freight.info.le_hulls.progress = "no"
						}
					},
					hull: {
						status: {
							async disappear ({ platform_name }) {
								let EWF = Extension_Winch.freight ();
								const Builder_01 = trucks [1].freight.info.Builder_01;
								const { result, note, transaction } = await EWF.prompt ({
									petition: {
										function: `${ Builder_01 }::Module_Producer_Hull::Disappear`,
										type_arguments: [],
										arguments: [
											platform_name
										]
									}
								});
								console.info ({ result, note, transaction });
								
								await trucks [1].freight.fonctions.retrieve_hulls ();
							},
							async pause ({ platform_name }) {
								let EWF = Extension_Winch.freight ();
								const Builder_01 = trucks [1].freight.info.Builder_01;
								const { result, note, transaction } = await EWF.prompt ({
									petition: {
										function: `${ Builder_01 }::Module_Producer_Hull::Pause`,
										type_arguments: [],
										arguments: [
											platform_name
										]
									}
								});
								console.info ({ result, note, transaction });
								
								await trucks [1].freight.fonctions.retrieve_hulls ();
							},
							async play ({ platform_name }) {
								let EWF = Extension_Winch.freight ();
								const Builder_01 = trucks [1].freight.info.Builder_01;
								const { result, note, transaction } = await EWF.prompt ({
									petition: {
										function: `${ Builder_01 }::Module_Producer_Hull::Play`,
										type_arguments: [],
										arguments: [
											platform_name
										]
									}
								});
								console.info ({ result, note, transaction });
								
								await trucks [1].freight.fonctions.retrieve_hulls ();
							}
						},
						async delete_platform ({ platform_name }) {
							let EWF = Extension_Winch.freight ();
							const Builder_01 = trucks [1].freight.info.Builder_01;
							const { result, note, transaction } = await EWF.prompt ({
								petition: {
									function: `${ Builder_01 }::Module_Producer_Hull::Delete`,
									type_arguments: [],
									arguments: [
										platform_name
									]
								}
							});
							console.info ({ result, note, transaction });
							
							await trucks [1].freight.fonctions.retrieve_hulls ();
							// await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
							// trucks [1].freight.change++;
						},
						async delete_every_text ({ platform_name }) {
							let EWF = Extension_Winch.freight ();
							const Builder_01 = trucks [1].freight.info.Builder_01;
							const { result, note, transaction } = await EWF.prompt ({
								petition: {
									function: `${ Builder_01 }::Module_Producer_Hull::Delete_Every_Text_For_Platform`,
									type_arguments: [],
									arguments: [
										platform_name
									]
								}
							});
							console.info ({ result, note, transaction });
							
							await trucks [1].freight.fonctions.retrieve_hulls ();
							trucks [1].freight.change++;
						}
					},
					text: {
						async delete_with_refund ({
							text,
							amount_of_octas,
							platform_name
						}) {
							/*
								public entry fun Delete_with_Refund (
									consenter : & signer, 
									writer_address : address, 
									platform_name : String,
									octas_refund : u64
								) {
							*/
							const writer_address = text.writer_address;
							const octas_refund = amount_of_octas;
							
							let EWF = Extension_Winch.freight ();
							
							const Builder_01 = trucks [1].freight.info.Builder_01;
							
							/* public entry fun Send_Text (writer : & signer, text : String, platform : String) */
							const { result, note, transaction } = await EWF.prompt ({
								petition: {
									function: `${ Builder_01 }::Module_Producer_Texts::Delete_with_Refund`,
									type_arguments: [],
									arguments: [
										writer_address,
										platform_name,
										octas_refund
									]
								}
							});
							console.info ({ result, note, transaction });
							
							await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
						}
					}
				},
				
				guests: {
					text: {
						
					},
					hull: {
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
						async show ({ name }) {
							trucks [1].freight.info.platform_name = name;
							await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
						}
					},
					hulls: {
						async status () {
							const Builder_01 = trucks [1].freight.info.Builder_01;
							const { result } = await view_fonction ({
								body: {
									"function": `${ Builder_01 }::Module_Guest_Hulls::Status`,							
									"type_arguments": [],
									"arguments": []
								}
							});
							
							const status = result [0];
							
							trucks [1].freight.info.hulls_status = status;
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
				},
				
				platform: {
					async show ({ name }) {
						trucks [1].freight.info.platform_name = name;
						await trucks [1].freight.fonctions.retrieve_texts_for_platform ();
					}
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