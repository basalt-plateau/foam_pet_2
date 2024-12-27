

<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

/*
	Activities
	Options
*/

/*
	1. (Tough) Adoption.
	2. Choose a Players
	3. Go on a vacation
*/

</script>


<div class="card p-4">
	<div class="card p-4 variant-soft-surface">
		<header
			style="
				font-size: 1.5em;
				text-align: center;
			"
		>Activities</header>
	</div>

	<div style="height: 0.25cm" />

	<div class="card p-2 variant-soft-surface">
	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: left;
							font-size: 1.5em;
						"
					>
						<p>Friendships with <Slang text="Pets" /></p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div style="height: 0.5cm"></div>
				
					<div style="text-align: center;">
						<span><Slang text="Pets" /> can be found around the </span>
						
						<Milieus_Button
							name={ "Garden" }
							location={[ "Ecology", "Garden" ]}
							is_open_location={[ "Ecology", "Garden" ]}
							style="display: inline-block"
						/>
					</div>
					
					<div style="height: 0.5cm"></div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.5cm" />
	
	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: left;
							font-size: 1.5em;
						"
					>
						<p>Choose <Slang text="an_Account" /></p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p style="text-align: center;">
						<span><Slang text="Accounts" /> are necessary for interacting with <Slang text="Aptos" />.</span>
					</p>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.5cm" />
	
	<div class="card p-2">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: left;
							font-size: 1.5em;
						"
					>
						<p>Talents</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p style="text-align: center;">

						<span>If asked politely, A <Slang text="Pet" /> might perform one of these</span>
				
						<Milieus_Button
							name={ "Talents" }
							location={[ "Talents" ]}
							is_open_location={[ "Talents" ]}
							style="display: inline-block"
						/>
					</p>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	</div>
</div>