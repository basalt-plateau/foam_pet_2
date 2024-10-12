


<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Slang from '$lib/trinkets/Slang/Trinket.svelte'

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

	



</script>


<div class="card p-2 variant-soft">
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<div
					style="
						text-align: center;
						font-size: 1.5em;
					"
				>
					<p>Offline Wallet Preparation Tutorial</p>
				</div>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div
					class="card variant-soft-surface p-4"
					style="
						max-width: 15cm;
						margin: 0 auto;
					"
				>
					<div class="flex-auto">
						<span>Obtain the soft where (foam where) from </span>
						
						<Milieus_Button
							name={ "Garden" }
							location={[ "Scholars", "Garden" ]}
							is_open_location={[ "Scholars", "Garden" ]}
							style="display: inline-block"
						/>
					</div>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>