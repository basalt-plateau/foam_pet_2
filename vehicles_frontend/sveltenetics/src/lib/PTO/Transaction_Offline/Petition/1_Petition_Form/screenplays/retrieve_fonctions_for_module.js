
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
		const priority = (obj) => {
			if (obj.is_view) return 1;        // Prioritize "is_view"
			if (obj.is_entry) return 2;       // Then prioritize "is_entry"
			return 3;                          // "Neither" comes last
		};

		// Compare based on priority first
		const priorityA = priority(a);
		const priorityB = priority(b);

		if (priorityA !== priorityB) {
			return priorityA - priorityB;    // If priority is different, sort by it
		}

		// Step 2: If `is_view` or `is_entry` are the same, sort by `name` alphabetically
		return a.name.localeCompare(b.name);
	});
	
	/*
	les_fonctions.sort((a, b) => {
		if (a.name < b.name) {
			return -1;
		}
		if (a.name > b.name) {
			return 1;
		}
		return 0;
	});
	*/
	
	return {
		les_fonctions
	}
}

