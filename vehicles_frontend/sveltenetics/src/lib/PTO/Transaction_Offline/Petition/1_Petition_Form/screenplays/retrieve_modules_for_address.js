
/*



*/

import { ask_account_module } from '$lib/PTO/Account_Module/Ask'

export async function retrieve_modules_for_address ({
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
	const les_modules = enhanced;
	
	return {
		les_modules
	}
}