




/*
	import { Flourisher } from "$lib/PTO/Flourisher"
	const flourisher = await Flourisher ();
*/



/*
	const wallet_connection = await wallet_link.connect (name);
*/
	
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
import * as Aptos_Wallets from "@aptos-labs/wallet-adapter-core";
//
//
import { create_wallet_template } from "$lib/PTO/Flourisher/Wallets/_template.js"
//
//
import {
	RiseWalletAdapter,
} from '@manahippo/aptos-wallet-adapter';

import * as Truck_1 from './_Truck/index.js'

	

import { has_field } from 'procedures/object/has_field'




/*
	https://github.com/aptos-labs/aptos-wallet-adapter/blob/6da7c3874dfa72388fa2582c4712c1ce23818058/packages/wallet-adapter-react/src/WalletProvider.tsx#L57
*/
/*
	<AptosWalletAdapterProvider
		autoConnect={true}
		dappConfig={{ network: NETWORK, aptosApiKey: APTOS_API_KEY }}
		optInWallets={["Continue with Google","Petra","Nightly","Pontem Wallet", "Mizu Wallet"]}
		onError={(error) => {
			toast({
				variant: "destructive",
				title: "Error",
				description: error || "Unknown wallet error",
			});
		}}
	>
		{children}
	</AptosWalletAdapterProvider>
*/
export class Signatory {
	constructor () {
		Truck_1.make ()
		
		const { plugins, opt_in_wallets } = this.ask_for_config ();
		const wallet_link = new WalletCore (
			plugins,
			opt_in_wallets
			// dappConfig,
			// disableTelemetry
		);
		
		const allowed_wallets = {
			"Nightly": "",
			"Petra": "",
			"Pontem Wallet": "",
			"Rise Wallet": ""
		}
		
		this.wallet = wallet
		
		// ...wallet_link._all_wallets, 
		// ...wallet_link._optInWallets,
		// ...wallet_link._standard_wallets
		this.wallets_list = [ 
			...wallet_link.wallets,
		].filter (_wallet => {
			if (has_field (allowed_wallets, _wallet.name)) {
				return true;
			}
			
			return false;
		})
	}
	
	
	
	ask_for_config () {
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
			plugins: ask_for_plugins,
			opt_in_wallets: ask_for_opt_in_wallets
		}
	}
	
	_connect () {
		console.log ("_connect", this)
		
		/*
			const connect_to_signatory = async ({ wallet_link, wallet_name }) => {
				await wallet_link.connect (wallet_name);
				localStorage.setItem ("AptosWalletName", wallet_name);
			}
		*/
		
		// walletCoreMock.setWallet(walletMock);
	}
}





export const create_wallet_link = async () => {
	const signatory = new Signatory ();
	signatory._connect ();
	
	return {
		wallet_link: signatory.wallet_link,
		signatory
	};
}