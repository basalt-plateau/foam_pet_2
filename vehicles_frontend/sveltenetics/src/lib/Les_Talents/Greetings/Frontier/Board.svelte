

<script>

/*
	import Greetings_Frontier from "$lib/Les_Talents/Greetings/Frontier/Board.svelte"
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
		font-size: 1em;
		
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		padding: 0.25cm 1cm;
		white-space: break-spaces;
		
		box-shadow: 0 0 0px 2px rgb(var(--color-surface-500));
	"
>
	<p>Greetings</p>
</button>
