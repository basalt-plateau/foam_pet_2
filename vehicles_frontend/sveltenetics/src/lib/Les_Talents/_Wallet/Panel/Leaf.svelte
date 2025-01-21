

<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Extension_Winch_Ride from '$lib/Singles/Extension_Winch/Ride.svelte'
import Extension_Wallets from './Extension_Wallets/Trinket.svelte'
import Greetings from "$lib/Greetings/Trinket.svelte"


let Extension_Winch_Freight = false
let leaf = "Extensions"

</script>


<div>
	<Extension_Winch_Ride on_change={ ({ pro_freight }) => { Extension_Winch_Freight = pro_freight; } } />
	{#if typeof Extension_Winch_Freight === "object"}	
	<div
		style="
			width: 100%;
			
			padding: 0.25cm;
			
			display: flex;
			justify-content: center;
			align-items: center;
			
			flex-direction: column;
			
			gap: 0.25cm;
		"
	>
		<Extension_Wallets />
	</div>
	{/if}
</div>