


/*
	import { ask_for_wallets_list } from "$lib/Singles/Flourisher/Wallets/ask_for_list.js"
	const wallets_list = ask_for_wallets_list ();
*/

import { has_field } from 'procedures/object/has_field'


const allowed_wallets = {
	"Nightly": "",
	"Petra": "",
	"Pontem Wallet": "",
	"Rise Wallet": ""
}

export const ask_for_wallets_list = ({ wallet_link }) => {
	const wallets_list = [ 
		...wallet_link.wallets,
	].filter (_wallet => {
		if (has_field (allowed_wallets, _wallet.name)) {
			return true;
		}
		
		return false;
	});
	
	return wallets_list;
}
