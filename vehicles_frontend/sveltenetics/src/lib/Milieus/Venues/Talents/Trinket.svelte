





<script>
	


///
//
import Versies_Truck from '$lib/Versies/Trucks.svelte'
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse'
//
//
import { trends } from './Trinket'
//
//\

////
//
import Extension_Network_Status from '$lib/Singles/Extension_Winch/Status/Tome.svelte'
import Dapp_Network_Status from '$lib/Versies/Tomes/Network_Status/Bothy.svelte'
import Dapp_Network_Cohesion from '$lib/Versies/Tomes/Network_Cohesion/Bothy.svelte'
import Dapp_Network_Frontier from '$lib/Les_Talents/Dapp_Network/Frontier/Tome.svelte'
//
////


////
//
//	Frontiers (Porticos)
//
import Address_Search from '$lib/Les_Talents/Address_Search/Frontier/Board.svelte'
import APT_Passes from '$lib/Les_Talents/APT_Passes/Frontier/Tome.svelte'
import APT_Entrust_Friends from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Frontier/Board.svelte'
import Adaptation_Portico from '$lib/Les_Talents/Adaptation/Portico/Trinket.svelte'
import Bit_Pack from '$lib/Les_Talents/Bit_Pack/Frontier/Board.svelte'
import Digital_Assets_Portico from '$lib/Les_Talents/Digital_Assets/Portico/Trinket.svelte'
import Drink_Shop from '$lib/Les_Talents/Drink_Shop/Frontier/Trinket.svelte'
import Faucet from '$lib/Les_Talents/Faucet/Frontier/Board.svelte'
import Harvests_Portico from '$lib/Les_Talents/Harvests/Portico/Trinket.svelte'
import Mercy_Frontier from '$lib/Les_Talents/Mercy/Frontier/Trinket.svelte'
import Rondovals_Portico from '$lib/Les_Talents/Rondovals/Portico/Trinket.svelte'
import Venues_Portico from '$lib/Les_Talents/Venues/Portico/Trinket.svelte'
import Sport_Pack from '$lib/Les_Talents/Sport_Pack/Frontier/Tome.svelte'
//
//
////
import Glam_Frontier from "$lib/Les_Talents/Glam/Frontier/Tome.svelte"
import Franchise_Frontier from "$lib/Les_Talents/Franchise/Frontier/Tome.svelte"

const Les_Talents = [
	{
		"Frontier": Sport_Pack,
		"Mode": "nurture"
	},
	
	

	{
		"Frontier": Address_Search,
		"Mode": "business"
	},
	{
		"Frontier": APT_Entrust_Friends,
		"Mode": "business"
	},
	{
		"Frontier": APT_Passes,
		"Mode": "business"
	},
	{
		"Frontier": Adaptation_Portico,
		"Mode": "nurture"
	},
	{
		"Frontier": Bit_Pack,
		"Mode": "nurture"
	},
	{
		"Frontier": Digital_Assets_Portico,
		"Mode": "nurture"
	},
	{
		"Frontier": Drink_Shop,
		"Mode": "nurture"
	},
	{
		"Frontier": Faucet,
		"Mode": "nurture"
	},
	{
		"Frontier": Harvests_Portico,
		"Mode": "nurture"
	},
	{
		"Frontier": Mercy_Frontier,
		"Mode": "nurture"
	},
	{
		"Frontier": Rondovals_Portico,
		"Mode": "nurture"
	},
	{
		"Frontier": Venues_Portico,
		"Mode": "nurture"
	}
]


let Versies_Freight = false;


</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}

</style>


<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
{#if typeof Versies_Freight === "object"}
<nav>	
	{#if Versies_Freight.mode  === "nurture" }
	<div 
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
			grid-gap: 0.25cm;
		"
		class="card p-2"
	>
		<Dapp_Network_Frontier />
		<Glam_Frontier />
		<Franchise_Frontier />
	</div>
	{/if}
	
	<div style="height: 0.1cm"></div>
	
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
			grid-gap: 0.25cm;
		"
	>
		<div class="card p-1">
			<Dapp_Network_Status />
		</div>
		<div class="card p-1">
			<Extension_Network_Status />
		</div>
	</div>
	
	<div style="height: 0.1cm"></div>
	

	
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
			grid-gap: 0.25cm;
		"
	>
		<Dapp_Network_Cohesion />
	</div>

	<div style="height: 0.3cm"></div>

	<section
		quests_address
		
		monitor="talents_list"
		
		style={ parse_styles ({
			position: 'relative',
			display: 'grid',
			'width': '100%',
			'margin': '0 auto',
			
			// 'grid-template-columns': 'repeat(auto-fit, minmax(500px, 1fr))',
			'grid-template-columns': 'repeat(auto-fit, minmax(100px, 500px))',
			'grid-gap': '10px',
			'justify-content': 'center',
			
			'padding-bottom': '1cm'
		}) }
	>
		{#each Les_Talents as Le_Talent }
		{#if Versies_Freight.mode === "business" && Le_Talent.Mode !== "business" }
		
		{:else}
		<Panel 
			styles={
				Object.assign ({}, trends.panel, {
					...(Le_Talent.Mode !== "business" ? {
						border: '20px solid rgb(var(--color-warning-500))'
					} : {})
				}) 
			}
		>		
			<svelte:component this={ Le_Talent.Frontier }  />
			{#if Le_Talent.Mode === "nurture"}
			<div style="height: 0.25cm" />
			<div class="card" style="padding: 0.1cm 0.5cm">
				<p>{ Le_Talent.Mode }</p>
			</div>
			{/if}
		</Panel>
		{/if}
		{/each}
	</section>
</nav>
{/if}