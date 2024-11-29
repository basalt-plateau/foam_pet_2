
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
			padding: 0.25cm 0;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: .2cm 0;
			"
		><Slang text="Signature" /> Verfication</header>
		<p>This <Slang text="signature" /> should be the same as the one that was created on the other trinket.</p>
	</div>
	{/if}
</div>