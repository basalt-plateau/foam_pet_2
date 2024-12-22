

/*
	const { plugins, opt_in_wallets } = ask_for_the_config ();
*/

import {
	RiseWalletAdapter,
} from '@manahippo/aptos-wallet-adapter';
//
//
import { create_wallet_template } from "$lib/PTO/Flourisher/Wallets/_template.js"


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
			create_wallet_template ()
		]
	}

	const ask_for_opt_in_wallets = () => {
		const rise_wallet = new RiseWalletAdapter ();
		
		return ["Continue with Google","Petra","Nightly","Pontem Wallet", "Mizu Wallet"];
		
		return [
			// rise_wallet
		]
	}
	
	return {
		dappConfig,
		disableTelemetry,
		plugins: ask_for_plugins (),
		opt_in_wallets: ask_for_opt_in_wallets ()
	}
}