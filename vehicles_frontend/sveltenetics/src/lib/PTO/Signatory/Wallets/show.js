


/*
	import { show_wallets } from "$lib/PTO/Signatory/Wallets/show.js"
	const wallets = show_wallets ();

*/

// import { WalletAdapterNetwork, getWalletAdapters } from '@aptos-labs/wallet-adapter-core';

import { ask_for_signatory_freight } from "./Truck.js
	

export const show_wallets = () => {
	const signatory_freight = ask_for_signatory_freight ();
	console.info ({ signatory_freight });
	
	
}
