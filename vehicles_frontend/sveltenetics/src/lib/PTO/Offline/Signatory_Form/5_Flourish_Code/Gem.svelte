
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

import Signatory_Truck from '$lib/PTO/Offline/Signatory_Form/Truck/Ride.svelte'
let ST_Freight = false

	

</script>

<div>
	<Signatory_Truck on_change={ ({ pro_freight }) => { ST_Freight = pro_freight; } } />
	{#if typeof ST_Freight === "object"}
	<div
		style="
			text-align: center;
			padding: 0cm 0 .3cm;
		"
	>
		<p>
			<span>This <Slang text="signature" /> can be sent to the publicist.</span>			
		</p>
	</div>
	{/if}
</div>