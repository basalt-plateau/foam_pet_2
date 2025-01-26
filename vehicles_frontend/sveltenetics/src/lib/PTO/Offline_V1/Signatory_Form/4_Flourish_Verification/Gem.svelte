
<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

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
		<p>This is the <Slang text="signature" /> as a bracket.</p>
	</div>
	
	<div monitor="signature bracket panel">
		<Code_Wall
			text={ ST_Freight.petition_signature_fiberized }
			can_clone={ "no" }
		/>
	</div>
		
	{/if}
</div>