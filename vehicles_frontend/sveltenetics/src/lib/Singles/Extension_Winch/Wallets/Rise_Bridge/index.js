

/*
	perhaps:
		* wallet template
		* runtime check that wallets are fonctioning correctly
*/

/*
	perhaps relevant:
		AIP 62 Standard
*/

export const build_Rise_bridge = () => {
	const rise = window.rise;
	
	const Rise_Bridge = Object.create ({
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
			await rise.connect ();
			await this.status ();
			
			console.log ("Rise:", this);
		},
		disconnect () {},
		
		monitor_account () {},
		monitor_network () {}
	});
	Rise_Bridge.build ();

	return Rise_Bridge;
}

