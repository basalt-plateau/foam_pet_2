

<script>

//\\
//
//
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
//
////

let Milieus_Freight = "";

</script>

<div
	style="
		padding: 2cm 1cm;
	"
>
	<Milieus_Truck on_change={ ({ freight }) => { Milieus_Freight = freight; } } />
	{#if typeof Milieus_Freight === "object" }
	<Milieus_Button
		monitor="Resilience"
	
		name={ Milieus_Freight.nav_linguistics === "yes" ? Milieus_Freight.linguistics ["Vows"] : "Vows" }
		location={[ "Ecology", "Resilience", "Leaf" ]}
		is_open_location={[ "Ecology", "Resilience" ]}
		
		style="
			padding: 0.25cm 1cm;
		"
	/>
	{/if}
</div>