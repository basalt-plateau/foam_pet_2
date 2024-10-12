

/*
	import { open_bit_throw } from '$lib/Les_Talents/Bit_Pack/open'
	open_bit_throw ({ modal_store });
*/

import Bit_Pack from './Trinket.svelte'

export const open_bit_throw = ({ modal_store }) => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0 !fixed',
		component: {
			ref: Bit_Pack,
			props: { 
				modal_store
			}
		}
	});
}