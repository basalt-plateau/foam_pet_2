
/*
	import { Modal, getModalStore } from '@skeletonlabs/skeleton';
	import { show_wallets_panel } from "$lib/Les_Talents/_Wallet/Panel/Show.js"
	
	const modal_store = getModalStore ();
	await show_wallets_panel ({ modal_store })
*/

export const show_wallets_panel = async ({ modal_store }) => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./Trinket.svelte')).default,
			props: { 
				modal_store
			}
		}
	});
}