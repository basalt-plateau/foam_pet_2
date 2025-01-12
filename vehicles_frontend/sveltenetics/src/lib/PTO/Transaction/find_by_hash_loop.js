

/*
	const { result } = await find_by_hash_loop ();
	if (result !== "found") {
		
	}
*/

/*
	result:
		"otiose"
		"found"
*/

////
//
import { find_transaction_by_hash } from '$lib/PTO/Transaction/find_by_hash'
import { loop } from '$lib/taverns/loop'
//
////

export find_by_hash_loop = async ({
	
}) => {
	return new Promise (async (resolve) => {
		try {
			const loop_1 = loop ({
				wait: 2000,
				wait_for_response: "yes",
				action: async () => {
					const { enhanced, transaction_fiberized } = await find_transaction_by_hash ({
						net_path,
						transaction_hash
					});
					if (enhanced.success === true) {
						loop_1.stop ()
						
						resolve ({
							message: "The transaction was successful.",
							bracket: transaction_fiberized,
							result: "otiose"
						});
						return;
					}
				}
			});
			
			
			setTimeout (() => {
				loop_1.stop ();
				resolve ({
					result: "otiose"
				});
			}, 10000)
		}
		catch (imperfection) {
			console.error (imperfection);
			resolve ({
				result: "otiose"
			});
		}
	});
}