

/*
	import { open_adapation_panel } from '$lib/Les_Talents/Adaptation/Open'	
	open_adapation_panel ({
		modal_store
	})
*/

import Adaptation_Modal from '$lib/Les_Talents/Adaptation/Panel.svelte'

export const open_adapation_panel = ({
	modal_store
}) => {
	modal_store.trigger ({
		type: 'component',
		
		backdropClasses: '!p-0',
		
		component: {
			ref: Adaptation_Modal,
			props: { 
				modal_store
			}
		}
	});
}