


<script>

import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'

import Offline_Petition from '$lib/PTO/Offline/Petition_Form/Trinket.svelte'
import Offline_Signatory from '$lib/PTO/Offline/Signatory_Form/Trinket.svelte'

</script>



<Leaf>
	<header>Adaptation</header>
	
	<div
		style="
			height: 70vh;
			overflow: scroll;
		"
		
	>
		<Offline_Petition />
		
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