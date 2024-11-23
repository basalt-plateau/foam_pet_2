
/*



*/

import { ask_account_module } from '$lib/PTO/Account_Module/Ask'

export async function retrieve_fonctions_for_module ({
	net_path,
	address_hexadecimal_string
}) {
	const { enhanced } = await ask_account_module ({ 
		net_path,
		
		address_hexadecimal_string
	});
	
	console.log ({ enhanced });
	
	const proceeds = [];
	const les_fonctions = enhanced;
	
	return {
		les_fonctions
	}
}

