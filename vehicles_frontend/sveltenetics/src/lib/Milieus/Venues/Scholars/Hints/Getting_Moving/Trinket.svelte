

<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'


/*
	1. (Tough) Foam Pet Adoption.
	2. Choose a Players
	3. Go on a vacation
*/

</script>


<div class="card p-4">
	<header
		style="
			font-size: 1.5em;
			text-align: center;
		"
	>Getting Moving</header>

	<div style="height: 0.5cm" />

	<div class="card p-2 variant-filled-primary">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>1. (Tough) Foam Pet Adoption</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<div style="height: 0.5cm"></div>
				
					<div style="text-align: center;">
						<span>A <Slang text="Pet" /> can be adopted from </span>
						
						<Milieus_Button
							name={ "Garden" }
							location={[ "Scholars", "Garden" ]}
							is_open_location={[ "Scholars", "Garden" ]}
							style="display: inline-block"
						/>
					</div>
					
					<div style="height: 0.5cm"></div>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.5cm" />
	
	<div class="card p-2 variant-filled-primary">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>2. Choose <Slang text="an_Account" /></p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p style="text-align: center;">
						<span><Slang text="Accounts" /> are necessary for interacting with <Slang text="Aptos" />.</span>
					</p>
					
					<p style="text-align: center;">
						<span><Slang text="An_Account" /> can be found at</span>
						<Milieus_Button
							name={ "Accounts" }
							location={[ "Loyals", "Accounts" ]}
							is_open_location={[ "Loyals", "Accounts" ]}
							style="display: inline-block"
						/>
					</p>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	
	<div style="height: 0.5cm" />
	
	<div class="card p-2 variant-filled-primary">
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>3. Go on a Vacation</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p style="text-align: center;">
						<span>Talents can be found at</span>
						<Milieus_Button
							name={ "Talents" }
							location={[ "Friends", "Talents" ]}
							is_open_location={[ "Friends", "Talents" ]}
							style="display: inline-block"
						/>
					</p>
					
					<p style="text-align: center;">
						<span>To allow a vacation, the vacation <Slang text="Petition" /> needs to be <Slang text="signed" /> for at</span>
						<Milieus_Button
							name={ "Signatures" }
							location={[ "Loyals", "Signatures" ]}
							is_open_location={[ "Loyals", "Signatures" ]}
							style="display: inline-block"
						/>
					</p>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
</div>