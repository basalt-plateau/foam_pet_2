

export const Pontem_stage_creator = ({ freight }) => {
	const Pontem = window.pontem;
	
	return {
		name: "Pontem",
		icon: "",
		installed: "yes",
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
			
			this_bridge.installed = await this_bridge.is_installed ();
			this_bridge.connected = await this_bridge.is_connected ();

			this_bridge.account.address = await Pontem.account ();
			this_bridge.account.public_key = await Pontem.publicKey ();
			
			const network = await Pontem.network ();
			console.log ({ network });
			
			this_bridge.network.name = network.name;
			this_bridge.network.address = network.api;
			this_bridge.network.chain_id = network.chainId;
		},
		async is_installed () {
			try {
				if (typeof Pontem.version === "string") {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async is_connected () {
			const this_bridge = freight.bridge;
			if (await this_bridge.is_installed () !== "yes") { return "no" }
			
			try {
				if (Pontem.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = freight.bridge;

			await Pontem.connect ();
			await stage.status ();
			
			Pontem.onAccountChange (account => {
				console.log ("Pontem onAccountChange bridges:", { account });
				stage.status ();
			});
			Pontem.onNetworkChange (network => {
				console.log ("Pontem onNetworkChange bridges:", { network });
				stage.status ();
			});
		},
		async disconnect () {
			await Pontem._clearListeners ();
		}
	}
	
}