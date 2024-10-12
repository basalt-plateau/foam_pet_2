



/*
	import { wait_for } from '$lib/taverns/procedures/wait_for'
	await wait_for (1000)	
*/
export const wait_for = async function (duration) {
	await new Promise (F => {
		setTimeout (() => {
			F ()
		}, duration)
	})
}