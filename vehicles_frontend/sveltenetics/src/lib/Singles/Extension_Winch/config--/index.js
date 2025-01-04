

/*
	const { plugins, opt_in_wallets } = ask_for_the_config ();
*/

/*
	asks:
		* Petra Wallet
			* exists?
			
		* Rise Wallet
			* exists


*/

import { WalletCore } from "@aptos-labs/wallet-adapter-core";
import { RiseWalletAdapter } from '@manahippo/aptos-wallet-adapter';
//
//
import { create_wallet_template } from "$lib/Singles/Extension_Winch/Wallets/_template.js"

import { ask_for_opt_in_wallets } from "./opt_in_wallets/index.js"


const search_Petra = () => {}





export const ask_for_the_config = () => {
	const dappConfig = {}
	/*
		const dappConfig = { 
			network: NETWORK,
			aptosApiKey: APTOS_API_KEY
		}
	*/
	
	const disableTelemetry = []
	
	const ask_for_plugins = () => {
		return [
			// without this, the adapter doesn't work for some reason...
			create_wallet_template (),
			
		]
	}
	
	const plugins = ask_for_plugins ()
	const opt_in_wallets = ask_for_opt_in_wallets ()

	const wallet_core = new WalletCore (
		plugins,
		opt_in_wallets
		// dappConfig,
		// disableTelemetry
	);

	return {
		wallet_core,
		
		plugins,
		opt_in_wallets,
		
		dappConfig,
		disableTelemetry
	}
	
	
}