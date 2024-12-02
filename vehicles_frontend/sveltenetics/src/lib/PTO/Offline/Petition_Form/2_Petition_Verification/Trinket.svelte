


<script>

////
//
import { onMount, onDestroy } from 'svelte'
//
//
//
//
import * as PT from './../Truck/index.js'
//
////


import Petition_Truck from '$lib/PTO/Offline/Petition_Form/Truck/Ride.svelte'
let PT_Freight = false



import Petition2_Bracket from '$lib/PTO/Offline/Petition/Bracket/Gem.svelte'
import Petition2_Bracket_Details from '$lib/PTO/Offline/Petition/Bracket/Details.svelte'
	
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 


</script>

<div
	style="
		display: flex;
		gap: 0.25cm;
		
		flex-direction: column;
		
		padding: 0.25cm 0.25cm 5cm; 
	"
>
	<Petition_Truck on_change={ ({ pro_freight }) => { PT_Freight = pro_freight; } } />
	{#if typeof PT_Freight === "object"}
	<Petition2_Bracket_Details />

	<div class="card p-1 variant-filled-primary">
		<Accordion>
			<AccordionItem open>
				<svelte:fragment slot="summary">
					<header
						style="
							text-align: center;
							font-size: 1em;
						"
					><Slang text="Transaction_Petition" /> Bracket with Notes</header>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<Code_Wall text={ PT_Freight.petition_envelope_fiberized } />
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	{/if}
</div>