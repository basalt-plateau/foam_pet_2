





<script>
	


///
//
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Stats_Wall from '$lib/Les_Talents/Stats/Wall.svelte'
//
import { parse_styles } from '$lib/trinkets/styles/parse'
import { open_bit_throw } from '$lib/Les_Talents/Bit_Pack/open'
//
//
import { modal_plugs, trends } from './Trinket'
//
//\


import Extension_Network_Status from '$lib/Singles/Extension_Winch/Status/Tome.svelte'
import Dapp_Network_Status from '$lib/Versies/Tomes/Network_Status/Bothy.svelte'
import Dapp_Network_Cohesion from '$lib/Versies/Tomes/Network_Cohesion/Bothy.svelte'


////
//
//	Frontiers (Porticos)
//
//
import Adaptation_Portico from '$lib/Les_Talents/Adaptation/Portico/Trinket.svelte'
import Digital_Assets_Portico from '$lib/Les_Talents/Digital_Assets/Portico/Trinket.svelte'
import Rondovals_Portico from '$lib/Les_Talents/Rondovals/Portico/Trinket.svelte'
import Mercy_Frontier from '$lib/Les_Talents/Mercy/Frontier/Trinket.svelte'
import Harvests_Portico from '$lib/Les_Talents/Harvests/Portico/Trinket.svelte'
import Venues_Portico from '$lib/Les_Talents/Venues/Portico/Trinket.svelte'
import Drink_Shop from '$lib/Les_Talents/Drink_Shop/Frontier/Trinket.svelte'
import APT_Passes from '$lib/Les_Talents/APT_Passes/Frontier/Tome.svelte'
import Water_Balloons from '$lib/Les_Talents/Water_Balloons/Frontier/Tome.svelte'
//
//
////


import APT_Entrust_Mode_1_Loyals_Panel from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Trinket.svelte'



const modal_store = getModalStore ();

const {
	octas_gifts_v1,
	open_faucet,
	open_transaction_modal,
	open_coin_transfer,
	open_address_search
} = modal_plugs ({
	modal_store
});

const open_consideration_modal = async () => {
	console.log ('open_consideration_modal')
	
	modal_store.trigger ({
		type: 'component',
		
		backdropClasses: '!p-0',
		
		component: {
			ref: APT_Entrust_Mode_1_Loyals_Panel,
			props: { 
				modal_store
			}
		}
	});
}

const mode = check_roomies_truck ().freight.mode;



</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}

</style>

<nav>	
	<div style="height: 0.3cm"></div>
	
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

	<div style="height: 0.3cm"></div>

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
		{#if mode === "nurture" }
		<Panel styles={ trends.panel }>		
			<Mercy_Frontier { modal_store }/>	
		</Panel>
		
		<Panel styles={ trends.panel }>	
			<Water_Balloons />
		</Panel>
		{/if}
		
		
		
		<Panel styles={ trends.panel }>	
			<APT_Passes />
		</Panel>
		
		{#if mode === "nurture" }
		<Panel styles={ trends.panel }>	
			<Drink_Shop />
		</Panel>
		{/if}
		
		<Panel styles={ trends.panel }>		
			<div class="relative inline-block">
				<button 
					aptos_account_transfer
					
					on:click={ open_address_search }
					type="button" 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					style="
						font-size: 1.3em;
						padding: 12px 54px;
						margin-top: 10px;
						
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
					"
				>
					<p>Address Search</p>
				</button>
			</div>
		</Panel>
	</section>
	
	<section
		monitor="Greetings talents"		
		
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
		
	
		<Panel styles={ trends.panel }>	
			<p
				style="font-size: 1.3em"
			>
				<span>APT Entrust</span>
			</p>
		
			<div class="relative inline-block">
				<button 
					aptos_account_transfer
					
					on:click={ octas_gifts_v1 }
					type="button" 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					style="
						font-size: 1.3em;
						padding: 12px 54px;
						margin-top: 10px;
						
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
					"
				>
					<p>Petition</p>
				</button>
			</div>
			
			<p>This requires <Slang text="Label_Wallet_Extension" />.</p>
		</Panel>
		
		<Panel styles={ trends.panel }>		
			<div class="relative inline-block">
				<button 
					monitor="bit pitch"
					
					on:click={ () => { open_bit_throw ({ modal_store }); } }
					type="button" 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					style="
						font-size: 1.3em;
						padding: 12px 54px;
						margin-top: 10px;
						
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
					"
				>
					<p>Bit Pack</p>
				</button>
			</div>
			<div style="height: 0.25cm" />
			<p>This requires <Slang text="Label_Wallet_Extension" />.</p>
		</Panel>
	</section>
	
	
	
	
	{#if mode === "nurture" }
	<section
		monitor="talents_list_nurture"
	
		style={ parse_styles ({
			position: 'relative',
			display: 'grid',
			'width': '100%',
			'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))',
			'grid-gap': '10px',
			
			'padding-bottom': '5cm'
		}) }
	>
		<Panel styles={ trends.panel }>		
			<div class="relative inline-block">
				<button 
					faucet
					monitor="faucet"
					
					on:click={ open_faucet }
					type="button" 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					style="
						font-size: 1.3em;
						padding: 12px 54px;
						margin-top: 10px;
						
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
					"
				>
					<p>Faucet</p>
					<span 
						class="badge variant-filled-primary"
						style="margin: 0; display: none;"
					>Iteration 1</span>
				</button>
				
			</div>
		</Panel>
		
		
		
		<Panel styles={ trends.panel }>		
			<Venues_Portico { modal_store }/>	
		</Panel>
		
		<Panel styles={ trends.panel }>		
			<Harvests_Portico { modal_store }/>	
		</Panel>
		
		<Panel 
			styles={ trends.panel }
		>		
			<Adaptation_Portico { modal_store }/>
		</Panel>
		<Panel 
			styles={ trends.panel }
		>		
			<Digital_Assets_Portico { modal_store }/>	
		</Panel>
		<Panel 
			styles={ trends.panel }
		>		
			<Rondovals_Portico { modal_store }/>	
		</Panel>
		<Panel 
			styles={ trends.panel }
		>		
			<div class="relative inline-block">

				<button 
					octas_gifts__version_1
					
					on:click={ open_coin_transfer }
					type="button" 
					class="btn bg-gradient-to-br variant-gradient-primary-secondary"
					style="
						font-size: 1.3em;
						padding: 12px 54px;
						margin-top: 10px;
						
						display: flex;
						flex-direction: column;
						justify-content: center;
						align-items: center;
					"
				>
					<p>Coin Transfer</p>
					<span 
						class="badge variant-filled-primary"
						style="margin: 0; display: none;"
					>Iteration 1</span>
				</button>
			</div>

			<div style="height: 12px" />

			<span class="badge variant-soft"
				style="
					position: relative;
					font-size: 1.2em;
				"
			>
				<span>Function</span>
				<span class="badge variant-filled-surface">0x1::coin::transfer</span>
			</span>
		</Panel>
	</section>
	{/if}
</nav>
