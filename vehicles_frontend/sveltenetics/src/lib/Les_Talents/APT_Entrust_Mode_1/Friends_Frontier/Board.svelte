

<script>

/*
	import Template_Frontier from "$lib/Les_Talents/__Template/Frontier/Tome.svelte"
*/

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

import { Modal, getModalStore } from '@skeletonlabs/skeleton';
const modal_store = getModalStore ();



let open = async () => {
	modal_store.trigger ({
		type: 'component',
		backdropClasses: '!p-0',
		component: {
			ref: (await import ('./../Friends_Panel/Trinket.svelte')).default,
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
		monitor="APT Transfer Petition Frontier Button"
		
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
		<p
			style="
				display: flex;
				align-items: center;
				gap: 0.25cm;
			"
		>
			<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
			<span>APT Entrust</span>
		</p>
	</button>
	<div style="height: 0.25cm" />
	<p>This requires <Slang text="Label_Wallet_Extension" />.</p>
</div>
