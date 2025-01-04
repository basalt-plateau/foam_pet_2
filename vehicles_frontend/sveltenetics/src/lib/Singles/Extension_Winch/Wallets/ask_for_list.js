


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

import { build_Rise_bridge } from './Rise_Bridge/index.js'
import { build_Petra_bridge } from './Petra_Bridge/index.js'


/*
	perhaps:
		assertions for bridges
*/
export const ask_for_wallets_list = ({ EW_Freight }) => {
	const { rise_bridge } = build_Rise_bridge ({ EW_Freight });
	const petra_bridge = build_Petra_bridge ();
	
	return [
		rise_bridge,
		petra_bridge
	]
}

