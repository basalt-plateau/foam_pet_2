


/*
	Freight is the pro (proxy) object with an overriden
	get and set.
	
	Modifying "this" as it pertains to the object won't
	alert the monitor as to changes in the wallet talkie.
*/
export const Rise_stage_creator = ({ freight }) => {
	const rise = window.rise;
	
	const _stage = () => {
		return freight.stages.Rise;
		
		/*
		return freight.wallets_list.find (w => {
			return w.name === "Rise"
		});
		*/
	}
	
	return {
		name: "Rise",
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
			
			try {
				console.log ("rise stage:", { stage });
				
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
			
			if (stage.is_installed () !== "yes") { return "no" }
			
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