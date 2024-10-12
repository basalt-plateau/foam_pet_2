






<script>



import Panel from '$lib/trinkets/panel/trinket.svelte'

import { AppRail, AppRailTile, AppRailAnchor } from '@skeletonlabs/skeleton';
import { parse_styles } from '$lib/trinkets/styles/parse'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

const trends = {
	panel: {
		position: 'relative',
		display: 'inline-flex',
		'width': '32%', 
		'height': '150px',
		'align-items': 'center',
		'justify-content': 'center',
		
		margin: '4px',
		
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


<div>
	<div 
		style="padding: 25px 0"
		class="text-column"
	>
		<h1>Technicians</h1>
		
		<div style="height: 20px"></div>
		<p 
			style="text-align: center"
		>This region is for verifying and ensuring the health and continuity of the dapp.</p>
		<p
			style="text-align: center"
		>It's status checks that don't have an impact on the rest of the dapp.</p>
	</div>


	<section
		monitor="technicians buttons"
		styles={{
			position: 'relative',
			display: 'grid',
			'width': '100%'
		}}
	>
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Net Choices with Text" }
				location={[ "Technicians", "Net Choices with Text" ]}
				is_open_location={[ "Technicians", "Net Choices with Text" ]}
			/>
		</Panel>
	
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Amount Field" }
				location={[ "Technicians", "Amount Field" ]}
				is_open_location={[ "Technicians", "Amount Field" ]}
			/>
		</Panel>
		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Hone Focus" }
				location={[ "Technicians", "Hone Focus" ]}
				is_open_location={[ "Technicians", "Hone Focus" ]}
			/>
		</Panel>
		
		
		
		<hr 
			class="!border-t-4"
			style="margin: 4px 0 12px"
		>
		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Address Qualities with Address" }
				location={[ "Technicians", "Address Qualities with Address" ]}
				is_open_location={[ "Technicians", "Address Qualities with Address" ]}
			/>
		</Panel>
		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Address Qualities" }
				location={[ "Technicians", "Address Qualities" ]}
				is_open_location={[ "Technicians", "Address Qualities" ]}
			/>
		</Panel>
		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Nets Choices" }
				location={[ "Technicians", "Nets Choices" ]}
				is_open_location={[ "Technicians", "Nets Choices" ]}
			/>
		</Panel>
		
		

		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Consensus Transactions" }
				location={[ "Technicians", "Consensus Transactions" ]}
				is_open_location={[ "Technicians", "Consensus Transactions" ]}
			/>
		</Panel>
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Polytope" }
				location={[ "Technicians", "Polytope" ]}
				is_open_location={[ "Technicians", "Polytope" ]}
			/>
		</Panel>
		
		<Panel 
			styles={ trends.panel }
		>
			<Milieus_Button
				name={ "Slang" }
				location={[ "Technicians", "Slang" ]}
				is_open_location={[ "Technicians", "Slang" ]}
			/>
		</Panel>
		
		<hr 
			class="!border-t-4"
			style="margin: 4px 0 12px"
		>
	</section>
	
	<Panel 
		styles={ trends.panel }
	>
		<Milieus_Button
			name={ "Field" }
			location={[ "Technicians", "Field" ]}
			is_open_location={[ "Technicians", "Field" ]}
		/>
	</Panel>
	
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
</div>
