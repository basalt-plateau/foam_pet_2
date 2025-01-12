

/*
	import { find_transaction_by_hash_loop } from '$lib/PTO/Transaction/find_by_hash_loop'
	find_transaction_by_hash_loop ({
		bracket: {
			net_path,
			transaction_hash
		},
		
		discovered ({ note, bracket }) {
			
		},
		otiose () {
			
		}
	});
*/

////
//
import { find_transaction_by_hash } from '$lib/PTO/Transaction/find_by_hash'
import { loop } from '$lib/taverns/loop'
//
////

export const find_transaction_by_hash_loop = async ({
	bracket,
	discovered,
	otiose
}) => {
	console.info ("find_transaction_by_hash_loop");
	
	try {
		const loop_1 = loop ({
			wait: 2000,
			wait_for_response: "yes",
			action: async () => {
				console.log ("searching for transaction hash:", bracket.transaction_hash);
				
				const { enhanced, transaction_fiberized } = await find_transaction_by_hash ({
					net_path: bracket.net_path,
					transaction_hash: bracket.transaction_hash
				});
				if (enhanced.success === true) {
					loop_1.stop ()
					
					discovered ({
						note: "The transaction was successful.",
						bracket: transaction_fiberized,
					})
					return;
				}
			}
		});
		
		loop_1.play ();
		
		setTimeout (() => {
			loop_1.stop ();
			otiose ();
		}, 10000)
	}
	catch (imperfection) {
		console.error (imperfection);
		otiose ();
	}
}