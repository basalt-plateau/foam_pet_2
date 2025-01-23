
/*
	perhaps relevant:
		AIP 62 Standard
		import { RiseWalletAdapter } from '@manahippo/aptos-wallet-adapter';
		https://docs.risewallet.io/introduction/integrations/integrate-rise-wallet/with-the-wallet-adapter
*/

import _get from "lodash/get"


/*
	Freight is the pro (proxy) object with an overriden
	get and set.
	
	Modifying "this" as it pertains to the object won't
	alert the monitor as to changes in the wallet talkie.
*/
export const Rise_stage_creator = async ({ freight }) => {
	const rise = window.rise;
	
	const _stage = () => {
		return freight.stages.Rise;
	}
	
	const reset = async () => {
		const stage = _stage ();
					
		stage.account.address = "";
		stage.account.public_key = "";
		
		stage.network.name = "";
		stage.network.address = "";
		stage.network.chain_id = "";
	}
	
	return {
		name: "Rise",
		url: "https://risewallet.io",
		icon: "",
		installed: "",
		network: {
			name: "",
			address: "",
			chain_id: ""
		},
		account: {
			address: "",
			public_key: ""
		},

		async prompt ({ petition }) {
			const stage = _stage ();
			const pending_transaction = await window.rise.signAndSubmitTransaction (petition);
			const pending_transaction_hash = _get (pending_transaction, "hash", "");
			
			return {
				pending_transaction_hash
			}
		},

		async status () {
			const stage = _stage ();
			
			try {
				stage.installed = await stage.is_installed ();
				if (stage.installed !== "yes") {
					stage.connected = "no";
					reset ();
					return;
				}
				
				stage.connected = await stage.is_connected ();
				if (stage.connected !== "yes") {
					reset ();
					return;
				}

				const account = await rise.account ();
				stage.account.address = account.address;
				stage.account.public_key = account.publicKey;
				
				const network = await rise.network ();
				stage.network.name = network.name;
				stage.network.address = network.api;
				stage.network.chain_id = network.chainId;
			}
			catch (imperfection) {
				console.error ("status imperfection:", imperfection);
			}
		},
		async is_installed () {
			try {
				if (rise.isRise === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async is_connected () {
			const stage = _stage ();
			
			if (await stage.is_installed () !== "yes") { return "no" }
			
			try {
				if (rise.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = _stage ();
			
			await rise.connect ();
			await stage.status ();
			
			rise.onAccountChange (account => {
				console.log ("onAccountChange bridges:", { account });
				stage.status ();
			});
			rise.onNetworkChange (network => {
				console.log ("onNetworkChange bridges:", { network });
				stage.status ();
			});
		
			
		},
		async disconnect () {
			rise.removeAllListeners ();
		}
	}
}