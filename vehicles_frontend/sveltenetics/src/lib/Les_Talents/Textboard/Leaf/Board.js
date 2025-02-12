


import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
import { address_to_hexadecimal } from "$lib/PTO/Address/to_hexadecimal"		
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
import { view_fonction } from "$lib/PTO_API/View/index.js"


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
	Builder_01,
	le_textboard,
	le_text
}) => {
	let EWF = Extension_Winch.freight ();
	
	/*
		public entry fun Send_Text (
			writer : & signer,
			text : String,
			platform : String
		)
	
	*/
	const { result, note, transaction } = await EWF.prompt ({
		petition: {
			function: `${ Builder_01 }::Hulls_Module::Send_Text`,
			type_arguments: [],
			arguments: [
				le_text,
				le_textboard
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
}


/*
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
	const texts = result [0].map (text => {
		return {
			text: text.text,
			writer_address: address_to_hexadecimal (text.writer_address),
			writer_balance: ask_convert_Octas_to_APT ({ Octas: text.writer_balance }) 
		}
	});
	
	return {
		texts
	}
}
*/
