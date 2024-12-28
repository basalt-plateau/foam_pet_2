
/*
	window.petra
		prototype
			prototype
				isConnected
*/
export const Petra_stage_creator = ({ freight }) => {
	const Petra = window.petra;
	
	const _stage = () => {
		return freight.wallets_list.find (w => {
			return w.name === "Petra"
		});
	}
	
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
		async reset () {
			const stage = _stage ();
					
			stage.account.address = "";
			stage.account.public_key = "";
			
			stage.network.name = "";
			stage.network.address = "";
			stage.network.chain_id = "";
		},
		async status () {
			const stage = _stage ();
			
			try {
				stage.installed = await stage.is_installed ();
				if (stage.installed !== "yes") {
					stage.connected = "no"
					stage.reset ();
					return;
				}
				
				stage.connected = await stage.is_connected ();
				if (stage.installed !== "yes") {
					stage.reset ();
					return;
				}

				const account = await Petra.account ();
				stage.account.address = account.address;
				stage.account.public_key = account.publicKey;
				
				const network = await Petra.getNetwork ();
				stage.network.name = network.name;
				stage.network.address = network.url;
				stage.network.chain_id = network.chainId;
			}
			catch (imperfection) {
				console.error ("status imperfection:", imperfection);
			}
		},
		async is_installed () {
			try {
				if (typeof Petra === "object") {
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
				if (Petra.isConnected () === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		async connect () {
			const stage = _stage ();

			await Petra.connect ();
			await stage.status ();
			
			Petra.onAccountChange (account => {
				console.log ("onAccountChange bridges:", { account });
				stage.status ();
			});
			Petra.onNetworkChange (network => {
				console.log ("onNetworkChange bridges:", { network });
				stage.status ();
			});
			Petra.onDisconnect (() => {
				console.log ("Petra onDisconnect");
				stage.status ();
			});
		},
		async disconnect () {
			Petra.removeAllListeners ();
		}
	}
}