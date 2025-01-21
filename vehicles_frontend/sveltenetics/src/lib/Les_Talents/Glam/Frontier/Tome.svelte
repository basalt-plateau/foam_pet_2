

<script>

/*
	import Glam_Frontier from "$lib/Les_Talents/Glam/Frontier/Tome.svelte"
*/

/*
	Frontier, Event Horizon, Opener
*/

import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();

export let style = "";


let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Panel/Tome.svelte')).default,
			props: { 
				modal_store
			}
		}
	});
}

import { parse_styles } from '$lib/trinkets/styles/parse'



</script>


<button 
	monitor="glyph for adaptation"
	
	on:click={ open }
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style={ 
		parse_styles (Object.assign ({}, {
			display: 'flex',
			'flex-direction': 'column',
			'justify-content': 'center',
			'align-items': 'center',
			
			padding: '0.1cm 0',
			
			'white-space': 'break-spaces'
		}, style))
	}
>
	<p>Glam</p>
</button>
