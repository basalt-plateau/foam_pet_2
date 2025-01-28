











<script>

/*
	import Bit_Pack from '$lib/Les_Talents/Bit_Pack/Trinket.svelte'
	import { open_bit_throw } from '$lib/Les_Talents/Bit_Pack/open.js'
*/


//
//
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import _merge from 'lodash/merge'
//
//
import Polytope from '$lib/trinkets/Polytope/Fabric.svelte'
import Barcode_Visual from '$lib/trinkets/Barcode/Visual/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Barcode_Vision from '$lib/trinkets/Barcode/Vision/Trinket.svelte'
//
//
import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import Originals from './Trinkets/Originals.svelte'
import Other from './Trinkets/Other.svelte'


let panel_name = "Send Bits"


let rules_entire_link = "/Rules_Modules/Frontend/frontend_rules_entire.txt"
let rules_legend_link = "/Rules_Modules/Frontend/frontend_rules_legend.txt"
// let rules_legend_link = "/Rules_Originals/Frontend/Frontend_Rules_Originals.HTML"


let show = "Originals";
let clones_show = "Index"

</script>



<div 
	style="
		width: 100%;
		
		padding: 1cm 0 3cm;
		
		// display: flex;
		// justify-content: center;
		align-items: center;
		
		flex-direction: column;
		
		max-width: 25cm;
		
		margin: 0 auto;
		"
>
	<div
		style="
			padding: 0.25cm 0;
			text-align: center;
		"
	>
		<RadioGroup>
			<RadioItem bind:group={ show } name="justify" value={ "Originals" }>Originals</RadioItem>	
			<RadioItem bind:group={ show } name="justify" value={ "Topics" }>Crust</RadioItem>	
			<RadioItem bind:group={ show } name="justify" value={ "Other" }>Other</RadioItem>	
			<RadioItem bind:group={ show } name="justify" value={ "Estates" }>Estates</RadioItem>
		</RadioGroup>
	</div>
				
	<div style="height: 0.5cm"></div>			
				
	<div 
		style="
			width: 100%;
		"
		class="card p-4"
	>
		{#if show === "Originals" }
		<Originals />
		{/if}
		
		{#if show === "Other" }
		<Other />
		{/if}
	
		{#if show === "Estates" }
		<div
			style="
				text-align: center;
			"
		>
			<header
				style="
					font-size: 2em;
				"
			>Estates</header>
			
			<div style="height: 0.5cm"></div>	
		
			<span 
				style="
					display: none;
					line-height: 2em;
					text-align: center;
				"
				class="flex-auto"
			>
				<a 
					style="display: block"
					class="anchor" 
					href="https://github.com/basalt-plateau/foam_pet"
					target="_blank"
				>https://github.com/basalt-plateau/foam_pet</a>
				<a 
					style="display: block"
					class="anchor" 
					href="https://gitlab.com/basalt_plateau/foam_pet"
					target="_blank"
				>https://gitlab.com/basalt_plateau/foam_pet</a>
			</span>
		</div>
		{/if}
	
		{#if show === "Topics" }
			<div
				style="
					text-align: center;
				"
			>
				<!-- Surface, Skin, Topics, Crust, Hull, Interface -->
			
				<header
					style="
						font-size: 2em;
					"
				>Crust</header>
				
				<div style="height: 0.5cm"></div>
				
				<p><Slang text="Town" /> is made from these.</p>
				<p><b>Index</b> is the name of every Topics license.</p>
				<p><b>Entire</b> has the every Topics licenses.</p>
			
				<div style="height: 0.5cm"></div>	
			
				<RadioGroup>
					<RadioItem bind:group={ clones_show } name="justify" value={ "Index" }>Index</RadioItem>
					<RadioItem bind:group={ clones_show } name="justify" value={ "Entire" }>Entire</RadioItem>
				</RadioGroup>
				
				<div style="height: 0.5cm"></div>
			</div>
			
			<div class="card p-1">
				{#if clones_show === "Index" }
				<iframe
					src={ rules_legend_link }
					
					style="
						width: 100%;
						height: 25cm;
					"

					frameborder="0"
					title="Rules Index"
				>
				</iframe>
				{/if}
				
				{#if clones_show === "Entire" }
				<iframe
					src={ rules_entire_link }
					
					style="
						width: 100%;
						height: 25cm;
					"

					frameborder="0"
					title="Rules Entire"
				>
				</iframe>
				{/if}
			</div>
		{/if}
	</div>
</div>

