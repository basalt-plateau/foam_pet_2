






<script>

import { AppRail, AppRailTile, AppRailAnchor } from '@skeletonlabs/skeleton';


import Panel from '$lib/trinkets/panel/trinket.svelte'

import { parse_styles } from '$lib/trinkets/styles/parse'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'


let mode = ""

import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false
$:{
	mode = Versies_Freight.mode;
}
	

	
	

const trends = {
	panel: {
		position: 'relative',
		display: 'inline-flex',
		
		'height': '150px',
		
		'align-items': 'center',
		'justify-content': 'center',
		
		'box-sizing': 'border-box'
	},
	anchor: parse_styles ({
		position: 'absolute',
		height: '100%',
		width: '100%',
		
		display: 'flex',
		'align-items': 'center',
		'justify-content': 'center',
		'text-decoration': 'none',
		'text-align': 'center',
		'font-size': '2em'
	})
}

const Resilience = {
	Hakka: {
		language: "Hakka",
		english: "Resilience",
		pronunciation: "Mian-yik",
		glyphs: "免疫",
	}
}

</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}
a {
	line-height: 110%;
}

</style>


<Leaf>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	
	
	{#if typeof Versies_Freight === "object"}
	<div 
		class="card p-4"
		style="padding: 1cm"
	>
		<p 
			style="text-align: center"
		>This place is for guaranteeing and ensuring the resilience of the dapp.</p>
		<p
			style="text-align: center"
		>These monitors don't have an impact on the rest of the dapp.</p>
	</div>

	<div style="height: 1cm" />

	<section monitor="technicians buttons">
		<div 
			style="
				position: relative;
				
				display: grid;
				grid-template-columns: 1fr 1fr 1fr;
				gap: 0.25cm;
			"
		>
			<Panel styles={ trends.panel }>
				<Milieus_Button
					name={ "APT Petition Button" }
					
					location={[ "Ecology", "Resilience", "APT Petition Button" ]}
					is_open_location={[ "Ecology", "Resilience", "APT Petition Button" ]}
				/>
			</Panel>
		
			<Panel styles={ trends.panel }>
				<Milieus_Button
					name={ "Net Choices with Text" }
					location={[ "Ecology", "Resilience", "Net Choices with Text" ]}
					is_open_location={[ "Ecology", "Resilience", "Net Choices with Text" ]}
				/>
			</Panel>
		
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Amount Field" }
					location={[ "Ecology", "Resilience", "Amount Field" ]}
					is_open_location={[ "Ecology", "Resilience", "Amount Field" ]}
				/>
			</Panel>
			
			{#if mode === "nurture" }
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Hone Focus" }
					location={[ "Ecology", "Resilience", "Hone Focus" ]}
					is_open_location={[ "Ecology", "Resilience", "Hone Focus" ]}
				/>
			</Panel>
			{/if}
		</div>

		<hr 
			class="!border-t-4"
			style="margin: 12px 0 12px"
		>
		
		
		{#if mode === "nurture" }
		<div 
			style="
				position: relative;
				
				display: grid;
				grid-template-columns: 1fr 1fr 1fr;
				gap: 0.25cm;
			"
		>
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "React Verse" }
					location={[ "Ecology", "Resilience", "React Verse" ]}
					is_open_location={[ "Ecology", "Resilience", "React Verse" ]}
				/>
			</Panel>
		
			<Panel styles={ trends.panel }>
				<Milieus_Button
					name={ "Adaptation Prebuilt" }
					location={[ "Ecology", "Resilience", "Adaptation Prebuilt" ]}
					is_open_location={[ "Ecology", "Resilience", "Adaptation Prebuilt" ]}
				/>
			</Panel>
		
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Adaptation" }
					location={[ "Ecology", "Resilience", "Adaptation" ]}
					is_open_location={[ "Ecology", "Resilience", "Adaptation" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Wallet Socket" }
					location={[ "Ecology", "Resilience", "Wallet Socket" ]}
					is_open_location={[ "Ecology", "Resilience", "Wallet Socket" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Address Qualities with Address" }
					
					location={[ "Ecology", "Resilience", "Address Qualities with Address" ]}
					is_open_location={[ "Ecology", "Resilience", "Address Qualities with Address" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Address Qualities" }
					location={[ "Ecology", "Resilience", "Address Qualities" ]}
					is_open_location={[ "Ecology", "Resilience", "Address Qualities" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Nets Choices" }
					location={[ "Ecology", "Resilience", "Nets Choices" ]}
					is_open_location={[ "Ecology", "Resilience", "Nets Choices" ]}
				/>
			</Panel>
			
			

			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Consensus Transactions" }
					location={[ "Ecology", "Resilience", "Consensus Transactions" ]}
					is_open_location={[ "Ecology", "Resilience", "Consensus Transactions" ]}
				/>
			</Panel>
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Polytope" }
					location={[ "Ecology", "Resilience", "Polytope" ]}
					is_open_location={[ "Ecology", "Resilience", "Polytope" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Slang" }
					location={[ "Ecology", "Resilience", "Slang" ]}
					is_open_location={[ "Ecology", "Resilience", "Slang" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Field" }
					location={[ "Ecology", "Resilience", "Field" ]}
					is_open_location={[ "Ecology", "Resilience", "Field" ]}
				/>
			</Panel>
		</div>
		{/if}
		
		<hr 
			class="!border-t-4"
			style="margin: 4px 0 12px"
		>
	</section>
	
	
	{#if mode === "nurture" }
	<Panel styles={{
		'margin': '4px',
		'width': '100%',
		'padding': '0.5cm'
	}}>
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0.5cm 0;
			"
		>Links</header>
		
		<p>
			<a 
				target="_blank"
				href="https://aptosfoundation.org/"
			>
				https://aptosfoundation.org/
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://aptos.dev"
			>
				https://aptos.dev
			</a>
		</p>
		
		
		<p>
			<a 
				target="_blank"
				href="https://aptos-labs.github.io/aptos-ts-sdk/@aptos-labs/ts-sdk-1.22.2/"
			>
				https://aptos-labs.github.io/aptos-ts-sdk/@aptos-labs/ts-sdk-1.22.2/
			</a>
		</p>
		
		
		<p>
			<a 
				target="_blank"
				href="https://www.svelvet.io"
			>
				https://www.svelvet.io/
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://flowbite-svelte.com/docs/components/buttons"
			>
				https://flowbite-svelte.com/docs/components/buttons
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://svar.dev/svelte/core/"
			>
				https://svar.dev/svelte/core/
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://svelteui.dev/basics"
			>
				https://svelteui.dev/basics
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://kitschpatrol.com/svelte-tweakpane-ui"
			>
				https://kitschpatrol.com/svelte-tweakpane-ui
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://www.npmjs.com/package/@noble/curves"
			>
				https://www.npmjs.com/package/@noble/curves
			</a>
		</p>
		
		<p>
			<a 
				target="_blank"
				href="https://svelte-tiny-virtual-list.jonasgeiler.com/examples/elements-of-equal-height"
			>
				https://svelte-tiny-virtual-list.jonasgeiler.com/examples/elements-of-equal-height
			</a>
		</p>
	</Panel>
	{/if}
	{/if}
</Leaf>
