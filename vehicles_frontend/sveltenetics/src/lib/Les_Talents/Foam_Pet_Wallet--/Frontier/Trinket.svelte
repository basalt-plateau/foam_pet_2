

<script>

/*
	import Foam_Pet_Wallet_Frontier from "$lib/Les_Talents/Foam_Pet_Wallet/Frontier/Trinket.svelte"
	<Foam_Pet_Wallet_Frontier />
*/

import { Modal, getModalStore } from '@skeletonlabs/skeleton';

const modal_store = getModalStore ();
let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Panel/Trinket.svelte')).default,
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
			padding: 6px 34px;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		"
	>
		<p>Foam Pet Wallet</p>
	</button>
</div>
