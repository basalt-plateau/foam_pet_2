

export const Pontem_stage_creator = ({ freight }) => {
	const Pontem = window.pontem;
	
	const _stage = () => {
		return freight.wallets_list.find (w => {
			return w.name === "Pontem"
		});
	}
	
	return {
		name: "Pontem",
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
			const stage = _stage ();
			
			stage.installed = await stage.is_installed ();
			if (stage.installed !== "yes") {
				stage.connected = "no"
				
				stage.account.address = "";
				stage.account.public_key = "";
				
				stage.network.name = "";
				stage.network.address = "";
				stage.network.chain_id = "";
				
				return;
			}
			
			stage.connected = await stage.is_connected ();

			stage.account.address = await Pontem.account ();
			stage.account.public_key = await Pontem.publicKey ();
			
			const network = await Pontem.network ();
			console.log ({ network });
			
			stage.network.name = network.name;
			stage.network.address = network.api;
			stage.network.chain_id = network.chainId;
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
			const stage = _stage ();
			
			if (await stage.is_installed () !== "yes") { return "no" }
			
			try {
				if (Pontem.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = _stage ();

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
			Pontem.eventListeners.onAccountChange = []
			Pontem.eventListeners.onNetworkChange = []			
		}
	}
	
}