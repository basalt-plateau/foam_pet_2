

<script>

/*
	import Template_Frontier from "$lib/Les_Talents/__Template/Frontier/Trinket.svelte"
*/

/*
	Frontier, Event Horizon
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
		monitor="Extension APT Throw"
		
		on:click={ open }
		type="button" 
		class="btn bg-gradient-to-br variant-gradient-primary-secondary"
		style="
			font-size: 1.3em;
			padding: 12px 54px;
			margin-top: 10px;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			
			white-space: break-spaces;
		"
	>
		<p
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
			"
		>
			<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
			<span>APT Transfer</span>
		</p>
	</button>
</div>
