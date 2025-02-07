


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