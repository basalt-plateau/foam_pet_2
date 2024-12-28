

/*
	import { create_count_loop } from '$lib/PTO/APT/Count_Loop'
	const Count_Loop = create_count_loop ({
		on_change ({ Octa_count }) {
			console.log ("Octa_count:", Octa_count)
		}
	});

	Count_Loop.play ({
		address_hexadecimal_string: "",
		net_path: ""
	})
	Count_Loop.stop ()
	Count_Loop.play ({
		address_hexadecimal_string: "",
		net_path: ""
	})
*/

import { ask_APT_count } from '$lib/PTO/APT/Count'
import { loop } from '$lib/taverns/loop'
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
		

export const create_count_loop = ({
	on_change
}) => {
	let address_hexadecimal_string = "";
	let net_path = "";
	
	const loop_1 = loop ({
		wait: 2000,
		action: async () => {
			const APT_count_ask = await ask_APT_count ({ 
				address_hexadecimal_string,
				net_path
			});
			if (APT_count_ask.effective !== "yes") {
				console.error ("ineffective");
				// APT_count_ask.exception
				return;
			}

			let Octa_count = APT_count_ask.Octa_count;
			const APT_count = ask_convert_Octas_to_APT ({ Octas: Octa_count })
			
			on_change ({
				Octa_count,
				APT_count
			})
		}
	});
	
	return {
		play (packet) {
			address_hexadecimal_string = packet.address_hexadecimal_string;
			net_path = packet.net_path;
			loop_1.play ()
		},
		stop () {
			try {
				loop_1.stop ()
			}
			catch (imperfection) {
				console.error (imperfection);				
			}
		}
	}
}