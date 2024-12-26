


/*
	import { ask_for_wallets_list } from "$lib/Singles/Extension_Winch/Wallets/ask_for_list.js"
	const wallets_list = ask_for_wallets_list ();
*/

/*
	AIP 62:

	https://aptos.dev/en/build/sdks/wallet-adapter/wallet-standards
	https://github.com/aptos-foundation/AIPs/blob/main/aips/aip-62.md
	
	https://github.com/aptos-labs/aptos-wallet-adapter/blob/main/apps/nextjs-example/src/utils/standardWallet.ts

	Hippospace:
		https://github.com/hippospace/aptos-wallet-adapter/tree/main/packages/aptos-wallet-adapter
*/

/*	
	Gecko Providers:
		Rise
		Pontem
		
	Chromium:
		Petra
		Nightly
*/


import { has_field } from 'procedures/object/has_field'

/*
	https://docs.risewallet.io/introduction/integrations/integrate-rise-wallet/with-the-wallet-adapter
*/
import { RiseWalletAdapter } from '@manahippo/aptos-wallet-adapter';
import { connect_Rise_Wallet } from './Interfaces/Rise.js';

const allowed_wallets = {
	"Nightly": "",
	"Petra": "",
	"Pontem Wallet": "",
	"Rise": ""
}

export const ask_for_wallets_list = ({ wallet_link }) => {
	const isRiseInstalled = window.rise && window.rise.isRise;
	console.log ({ isRiseInstalled });
	
	const getProvider = () => {
		if ('rise' in window) {
			const provider = window.rise;
			if (provider.isRise) {
				return provider;
			}
		}
		
		// window.open('https://risewallet.io', '_blank');
	};
	
	const rise_is_installed = "rise" in window;
	 
	let wallets_list = [ ...wallet_link.wallets ];
	if (rise_is_installed) {
		wallets_list.push (connect_Rise_Wallet ())
	}
	
	wallets_list = wallets_list.filter (_wallet => {
		if (has_field (allowed_wallets, _wallet.name)) {
			return true;
		}
		
		console.info ("skipping wallet:", _wallet.name);
		
		return false;
	});
	
	return wallets_list;
}
