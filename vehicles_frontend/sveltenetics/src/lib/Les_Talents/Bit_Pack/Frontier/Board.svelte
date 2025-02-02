

<script>

/*
	import Template_Frontier from "$lib/Les_Talents/__Template/Frontier/Tome.svelte"
*/

/*
	Frontier, Event Horizon
*/

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();

let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Trinket.svelte')).default,
			props: { 
				modal_store
			}
		}
	});
}




</script>


<div 
	style="
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	"
	class="relative inline-block"
>
	<button 
		monitor="glyph for adaptation"
		
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
		"
	>
		<p>Bit Pack</p>
	</button>
	
	<div style="height: 0.25cm" />
	<p
		style="
			text-align: center;
		"
	>This requires <Slang text="Label_Wallet_Extension" />.</p>
</div>
