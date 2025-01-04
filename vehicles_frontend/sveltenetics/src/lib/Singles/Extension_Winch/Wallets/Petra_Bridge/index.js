

/*
	perhaps:
		* wallet template
		* runtime check that wallets are fonctioning correctly
*/

export const build_Petra_bridge = () => {
	const bridge = Object.create ({
		status () {
			//
			// These are the (non-prototype) properties of the object
			//
			//
			this.installed = this.is_installed ();
			this.connected = this.is_connected ();
			
			this.name = "Petra"
			this.icon = ""
		},
		is_installed () {
			try {
				if ("petra" in window) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		is_connected () {
			if (this.is_installed () !== "yes") { return "no" }
			
			try {
				if (window.petra.isConnected === true) {
					return "yes";
				}
			}
			catch (imperfection) {}
			return "no";
		},
		
		monitor_account () {
			
		},
		monitor_network () {
			
		}
	});
	bridge.status ();

	return bridge;
}

