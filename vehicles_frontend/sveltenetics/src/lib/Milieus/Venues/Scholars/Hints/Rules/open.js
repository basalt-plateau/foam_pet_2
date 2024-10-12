

/*
	import { open_rules } from '$lib/Milieus/Venues/Scholars/Hints/Rules/open'
	open_rules ({ modal_store });
*/

import Regolith from './Trinket.svelte'

export const open_rules = ({ modal_store }) => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0 !fixed',
		component: {
			ref: Regolith,
			props: { 
				modal_store
			}
		}
	});
}

