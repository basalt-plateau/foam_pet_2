


import { view_fonction } from "$lib/PTO_API/View/index.js"
import { APT_Button_Press } from "$lib/Singles/Extension_Winch/Petition/APT_Button_Press.js"

export const retrieve_hull_names = async ({
	Builder_01
}) => {
	const { result } = await view_fonction ({
		body: {
			"function": `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
			"type_arguments": [],
			"arguments": []
		}
	});
	
	console.info ({ result });
	
	const hull_names = result [0].map (name => {
		if (name === "") {
			return {
				value: name,
				label: "front"
			}
		}
		
		return {
			value: name,
			label: name
		}
	});
	
	console.info ({ hull_names });
	
	return hull_names
}


export const Send_Text = async ({
	Builder_01
}) => {
	APT_Button_Press ({});
}

export const retrieve_texts_for_platform = async ({ 
	Builder_01, 
	platform_name 
}) => {
	const { result } = await view_fonction ({
		body: {
			"function": `${ Builder_01 }::Hulls_Module::Retrieve_Texts`,
			"type_arguments": [],
			"arguments": [
				platform_name
			]
		}
	});

	console.info ("retrieve_texts_for_platform:", { result });

	
	const texts = result [0];
	
	return {
		texts
	}
	
}
