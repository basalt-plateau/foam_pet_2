

<script>

/*
	import Template_Frontier from "$lib/Les_Talents/__Template/Frontier/Tome.svelte"
*/

/*
	Frontier, Event Horizon, Opener
*/

import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();



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




</script>


<button 
	monitor="glyph for adaptation"
	
	on:click={ open }
	type="button" 
	class="btn bg-gradient-to-br variant-gradient-primary-secondary"
	style="
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		
		padding: 0.1cm 0;
		
		white-space: break-spaces;
	"
>
	<p>Glam</p>
</button>
