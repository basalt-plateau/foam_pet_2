
<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

export let petition_AO_fiberized = ""

</script>

<div class="card p-1">
	<Accordion>
		<AccordionItem open>
			<svelte:fragment slot="summary">
				<header
					style="
						text-align: center;
						font-size: 1em;
						font-weight: bold;
					"
				>Bracket</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<Code_Wall text={ petition_AO_fiberized } />
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>