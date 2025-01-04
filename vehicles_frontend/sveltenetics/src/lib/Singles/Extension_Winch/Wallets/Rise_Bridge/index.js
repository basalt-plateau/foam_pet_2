

/*
	perhaps:
		* runtime check that wallets are fonctioning correctly
*/

/*
	Imperfections:
		* onAccountChange does not occur
*/

/*
	perhaps relevant:
		AIP 62 Standard
		import { RiseWalletAdapter } from '@manahippo/aptos-wallet-adapter';
		https://docs.risewallet.io/introduction/integrations/integrate-rise-wallet/with-the-wallet-adapter
*/

export const build_Rise_bridge = () => {
	const rise = window.rise;

	// 	const Rise_Bridge = Object.create ({
	const Rise_Bridge = Object.create ({
		network: {
			name: "",
			address: "",
			chain_id: ""
		},
		account: {
			address: "",
			public_key: ""
		},
		
		changes: 0,
		fonction () {
			this.changes++;
		},
		
		build () {
			this.name = "Rise"
			this.icon = ""	

			this.status ();
		},
		async status () {
			/*
				balance is from [view]..
			*/
			
			this.installed = this.is_installed ();
			this.connected = this.is_connected ();
			this.changes++;

			const account = await rise.account ();
			this.account = {
				address: account.address,
				public_key: account.publicKey
			};
			
			const network = await rise.network ();
			/*
			this.network = {
				name: network.name,
				address: network.api,
				chain_id: network.chainId
			};
			*/
			
			this.network.name = network.name;
			this.network.address = network.api;
			this.network.chain_id = network.chainId;
			
			
			console.log ('status changed:', this);
		},
		is_installed () {
			try {
				if (rise.isRise === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		is_connected () {
			if (this.is_installed () !== "yes") { return "no" }
			
			try {
				if (rise.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		
		async connect ({ freight }) {
			/*
			if (this.is_connected () !== "yes") {
				console.info ("Rise is already connected.");
				return;
			}
			*/
			
			const bridge = this;
			
			// connect might be called multiple times..
			rise.removeAllListeners ();
			
			await rise.connect ();
			await this.status ();
			
			rise.onAccountChange (account => {
				console.log ("onAccountChange:", { account });
				this.status ();
			});
			rise.onNetworkChange (network => {
				console.log ("onNetworkChange inside:", { network });
				this.status ();
				
				freight.bridge.status ();
			});
			
			console.log ("Rise:", this);
			
			return this;
		},
		async disconnect () {
			rise.removeAllListeners ();
		}
	});
	Rise_Bridge.build ();
	


	return { rise_bridge: Rise_Bridge };
}

