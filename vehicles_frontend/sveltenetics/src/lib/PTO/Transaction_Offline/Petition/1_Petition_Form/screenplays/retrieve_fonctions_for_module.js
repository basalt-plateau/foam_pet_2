
/*



*/

import { ask_account_module } from '$lib/PTO/Account_Module/Ask'

export async function retrieve_fonctions_for_module ({
	net_path,
	address_hexadecimal_string,
	module_name
}) {
	const { enhanced } = await ask_account_module ({ 
		net_path,
		
		address_hexadecimal_string,
		module_name
	});
	
	console.log ({ enhanced });
	
	const proceeds = [];
	const les_fonctions = enhanced.abi.exposed_functions;
	
	les_fonctions.sort((a, b) => {
		if (a.name < b.name) {
			return -1;
		}
		if (a.name > b.name) {
			return 1;
		}
		return 0;
	});
	
	return {
		les_fonctions
	}
}

