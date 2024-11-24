






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

const Immunity = {
	Hakka: {
		language: "Hakka",
		english: "Immunity",
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

<svelte:head>
	<title>Technicians, Theme</title>
	<meta name="description" content="Technicians" />
</svelte:head>


<Leaf>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	
	
	{#if typeof Versies_Freight === "object"}
	<div 
		class="card p-4"
		style="padding: 1cm"
	>
		<header
			style="
				padding: 0.25cm;
				font-size: 3em;
				
				text-align: center;
			"
		>免疫</header>
		
		<div
			class="card p-1 variant-soft-surface"
			style="
				width: 100%;
			"
		>
			<p
				style="
					text-align: center;
				"
			><b>{ Immunity.Hakka.glyphs }</b>, perhaps occassionally spoken as <b>{ Immunity.Hakka.pronunciation }</b>,</p>
			<p
				style="
					text-align: center;
				"
			>might be how to say <b>{ Immunity.Hakka.english }</b> with the <b>{ Immunity.Hakka.language }</b> language.</p>
		</div>
		
		<div style="height: 20px"></div>
		<p 
			style="text-align: center"
		>This region is for verifying and ensuring the health and continuity of the dapp.</p>
		<p
			style="text-align: center"
		>It's status checks that don't have an impact on the rest of the dapp.</p>
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
					name={ "Net Choices with Text" }
					location={[ "Scholars", "Immunity", "Net Choices with Text" ]}
					is_open_location={[ "Scholars", "Immunity", "Net Choices with Text" ]}
				/>
			</Panel>
		
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Amount Field" }
					location={[ "Scholars", "Immunity", "Amount Field" ]}
					is_open_location={[ "Scholars", "Immunity", "Amount Field" ]}
				/>
			</Panel>
			
			{#if mode === "nurture" }
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Hone Focus" }
					location={[ "Scholars", "Immunity", "Hone Focus" ]}
					is_open_location={[ "Scholars", "Immunity", "Hone Focus" ]}
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
					name={ "Adaptation" }
					location={[ "Scholars", "Immunity", "Adaptation" ]}
					is_open_location={[ "Scholars", "Immunity", "Adaptation" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Wallet Socket" }
					location={[ "Scholars", "Immunity", "Wallet Socket" ]}
					is_open_location={[ "Scholars", "Immunity", "Wallet Socket" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Address Qualities with Address" }
					location={[ "Scholars", "Immunity", "Address Qualities with Address" ]}
					is_open_location={[ "Scholars", "Immunity", "Address Qualities with Address" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Address Qualities" }
					location={[ "Scholars", "Immunity", "Address Qualities" ]}
					is_open_location={[ "Scholars", "Immunity", "Address Qualities" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Nets Choices" }
					location={[ "Scholars", "Immunity", "Nets Choices" ]}
					is_open_location={[ "Scholars", "Immunity", "Nets Choices" ]}
				/>
			</Panel>
			
			

			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Consensus Transactions" }
					location={[ "Scholars", "Immunity", "Consensus Transactions" ]}
					is_open_location={[ "Scholars", "Immunity", "Consensus Transactions" ]}
				/>
			</Panel>
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Polytope" }
					location={[ "Scholars", "Immunity", "Polytope" ]}
					is_open_location={[ "Scholars", "Immunity", "Polytope" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Slang" }
					location={[ "Scholars", "Immunity", "Slang" ]}
					is_open_location={[ "Scholars", "Immunity", "Slang" ]}
				/>
			</Panel>
			
			<Panel 
				styles={ trends.panel }
			>
				<Milieus_Button
					name={ "Field" }
					location={[ "Scholars", "Immunity", "Field" ]}
					is_open_location={[ "Scholars", "Immunity", "Field" ]}
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
