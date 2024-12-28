



export const Petra_bridge_creator = ({ freight }) => {
	const Petra = window.petra;
	
	return {
		name: "Petra",
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
		async status () {
			const this_bridge = freight.bridge;
			
			this_bridge.installed = this_bridge.is_installed ();
			this_bridge.connected = this_bridge.is_connected ();

			const account = await rise.account ();
			this_bridge.account.address = account.address;
			this_bridge.account.public_key = account.publicKey;
			
			const network = await rise.network ();
			this_bridge.network.name = network.name;
			this_bridge.network.address = network.api;
			this_bridge.network.chain_id = network.chainId;
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
			const this_bridge = freight.bridge;
			if (this_bridge.is_installed () !== "yes") { return "no" }
			
			try {
				if (rise.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const this_bridge = freight.bridge;

			await rise.connect ();
			await this_bridge.status ();
			
			rise.onAccountChange (account => {
				console.log ("onAccountChange bridges:", { account });
				this_bridge.status ();
			});
			rise.onNetworkChange (network => {
				console.log ("onNetworkChange bridges:", { network });
				this_bridge.status ();
			});
		},
		disconnect () {
			rise.removeAllListeners ();
		}
	}
}