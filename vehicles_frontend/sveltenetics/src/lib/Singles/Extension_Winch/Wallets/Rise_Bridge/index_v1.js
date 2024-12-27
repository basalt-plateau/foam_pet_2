

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
	const Rise_Bridge = {
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

			const account = await rise.account ();
			this.account = {
				address: account.address,
				public_key: account.publicKey
			};
			
			const network = await rise.network ();
			this.network = {
				name: network.name,
				address: network.api,
				chain_id: network.chainId
			};
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
		
		async connect () {
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
			
			rise.onAccountChange (function () {
				console.log ("onAccountChange:", arguments);
				bridge.status ();
			});
			rise.onNetworkChange (network => {
				console.log ("onNetworkChange:", { network });
				bridge.status ();
			});
			
			console.log ("Rise:", this);
		},
		async disconnect () {
			rise.removeAllListeners ();
		},
		
		monitor_account () {},
		monitor_network () {}
	};
	Rise_Bridge.build ();

	return Rise_Bridge;
}

