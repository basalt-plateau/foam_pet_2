


<script>

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'

import Offline_Petition from '$lib/PTO/Offline/Petition_Form/Trinket.svelte'
import Offline_Signatory from '$lib/PTO/Offline/Signatory_Form/Trinket.svelte'

/*
const allow = {
	"0x1": "*",
	"0x4939": {
		"module_1": "*",
		"module_2": [ "fonction_1" ]				
	}
}
*/

const allow = {
	"0x1": {
		"aptos_account": "every"
	},
	"0x2": "every",
	"0x3": "every",
	"0x4": "every"	
}


</script>



<Leaf>
	<header>Adaptation</header>
	
	<div
		style="
			height: 70vh;
			overflow: scroll;
		"
		
	>
		<Offline_Petition
			allow={ allow }
		/>
		
	</div>
	
	<div 
		style="
			height: 1cm;
		" 
	/>
	
	<div
		style="
			height: 70vh;
			overflow: scroll;
		"
		
	>
		<Offline_Signatory />
		
	</div>
</Leaf>