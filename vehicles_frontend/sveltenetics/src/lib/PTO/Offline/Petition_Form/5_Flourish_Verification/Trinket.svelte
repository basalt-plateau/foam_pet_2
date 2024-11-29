
<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false



let show = "Bracket";


</script>

<div>
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}
	<div
		style="
			text-align: center;
			padding: 0.25cm 0;
		"
	>
		<p>This <Slang text="signature" /> should be the same as the one that was created on the other trinket.</p>
	</div>
	
	<div
		style="
			text-align: center;
		"
	>
		<RadioGroup>
			<RadioItem bind:group={ show } name="justify" value={ "Bracket" }>
				<span monitor="bracket pad">Bracket</span>
			</RadioItem>
			<RadioItem bind:group={ show } name="justify" value={ "Hexadecimal" }>
				<span monitor="hexadecimal pad">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>
	
	<div style="padding: 0.25cm 0" ></div>

	<div>
		{#if show === "Bracket" }
		<div monitor="signature bracket panel">
			<!-- <Code_Wall text={  } /> -->
		</div>
		{:else if show === "Hexadecimal" }
		<div monitor="signature hexadecimal panel">
			<!-- <Code_Wall text={  } /> -->
		</div>
		{/if}
	</div>
	
	{/if}
</div>