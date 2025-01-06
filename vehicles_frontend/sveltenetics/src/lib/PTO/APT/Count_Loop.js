

/*
	import { create_count_loop } from '$lib/PTO/APT/Count_Loop'
	const Count_Loop = create_count_loop ({
		on_change (packet) {
			if (packet.effective !== "yes") {
				return;
			}
			
			const APT_count = packet.APT_count;
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

////
//
import { loop } from '$lib/taverns/loop'
import { ask_convert_Octas_to_APT } from '$lib/taverns/APT/Octas_to_APT.js'
//
import { ask_APT_count } from '$lib/PTO/APT/Count'
//
////
		

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
				on_change ({
					effective: "no",
					Octa_count: "",
					APT_count: ""
				})
				
				console.error ("ineffective");
				return;
			}

			let Octa_count = APT_count_ask.Octa_count;
			const APT_count = ask_convert_Octas_to_APT ({ Octas: Octa_count })
			
			on_change ({
				effective: "yes",
				Octa_count,
				APT_count
			})
		}
	});
	
	return {
		play (packet) {
			address_hexadecimal_string = packet.address_hexadecimal_string;
			net_path = packet.net_path;
			
			loop_1.stop ()
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