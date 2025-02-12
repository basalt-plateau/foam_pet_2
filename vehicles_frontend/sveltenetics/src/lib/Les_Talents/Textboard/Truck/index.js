

import { build_truck } from '@visiwa/trucks'


import { retrieve_hull_names, retrieve_texts_for_platform, Send_Text } from './../Leaf/Board'


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
				Builder_01: Motte_01_LA,
				texts: [],
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
					
					const { texts } = await retrieve_texts_for_platform ({
						Builder_01,
						platform_name
					});
					
					trucks [1].freight.info.texts = texts;
					trucks [1].freight.info.searching_for_texts = "no"
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


/*
	Changes to the freight can also be monitored like this.
	This adds another monitor each time "monitor" is called.
	
	An example implementation can be found below.
*/
export const monitor = (action) => {	
	return trucks [1].monitor (envelope => { action (envelope); });
}