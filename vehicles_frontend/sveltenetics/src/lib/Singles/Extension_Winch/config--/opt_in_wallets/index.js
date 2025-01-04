

import { connect_Rise_Wallet } from './../../Wallets/Interfaces/Rise.js';

import { RiseWalletAdapter } from '@manahippo/aptos-wallet-adapter';
const Rise_Socket = () => {
	
	
}


/*
	https://docs.pontemwallet.xyz/guide/provider.html#detect-the-provider
*/
const Pontem_Socket = () => {
	
	
}

export const ask_for_opt_in_wallets = () => {
	const rise_wallet = new RiseWalletAdapter ();
	
	return [
		// "Continue with Google",
		// "Mizu Wallet"
		
		"Pontem",
		"Pontem Wallet",
		
		"Petra",
		"Nightly"
	];
}