

<script>

/*
	import Textboard_Rules_Frontier from "$lib/Les_Talents/Textboard_Rules/Frontier/Tome.svelte"
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


<div class="relative inline-block">
	<button 
		monitor="glyph for adaptation"
		
		on:click={ open }
		type="button" 
		class="btn bg-gradient-to-br variant-gradient-primary-secondary"
		style="
			font-size: 1.3em;
			padding: 0.05cm 0.5cm;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			white-space: break-spaces;
		"
	>
		<p>Rules</p>
	</button>
</div>
