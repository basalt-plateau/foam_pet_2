





<script>
	
/*
	Talents:
		@ Plays

	Friends_Moves:
		@ Friends_Moves
		@ Activities
		@ Adventures
		
		@ Postures
		@ Presences
*/

///
//
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import Stats_Wall from '$lib/Les_Talents/Stats/Wall.svelte'
//
import { parse_styles } from '$lib/trinkets/styles/parse'
//
import { open_bit_throw } from '$lib/Les_Talents/Bit_Pack/open'
//
//
import { modal_plugs, trends } from './Trinket'
//
//\





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



const mode = check_roomies_truck ().freight.mode;

let friends_name = "ጓደኛዎች"
let friends_language = "Amharic"
let friends_pronunciation = "gwadenyawotch"

</script>

<style>

@media (max-width: 600px) {
    .latest-block-panel {
		flex-direction: column !important;
	}
}

</style>

<svelte:head>
	<title>Talents</title>
	<meta name="description" content="Talents" />
</svelte:head>


<Leaf>
	<div
		class="card p-1"
		style="
			width: 100%;
		"
	>
		<p
			style="
				text-align: center;
			"
		>"{ friends_name }", pronounced "{ friends_pronunciation }", might be { friends_language } for "friends".</p>
	</div>

	<div style="height: 0.2cm"></div>

	<div
		class="card p-4"
		style="
			padding: 1cm;
			width: 100%;
		"
	>
		<header
			style="
				font-size: 2.5em;
				text-align: center;
			"
		>Talents</header>
		<p
			style="
				text-align: center;
				font-size: 1.2em;
			"
		>These require a connection to <Slang text="Aptos" />.</p>
	</div>
	
	<div style="height: 0.3cm"></div>
	
	<div class="card p-4">
		<Stats_Wall />
	</div>

	<div style="height: 0.3cm"></div>

	<section
		quests_address
		style={ parse_styles ({
			position: 'relative',
			display: 'grid',
			'width': '100%',
			'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))',
			'grid-gap': '10px'
		}) }
	>
		<Panel styles={ trends.panel }>		
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
					<p>APT Entrust</p>
				</button>
			</div>

			<div style="height: 12px" />

			<span 
				open_transaction_modal
				class="badge variant-filled-surface"
				style="margin: 0;"
			>Mode 1</span>

			<!-- 
			
			<div style="height: 12px" />

			<span class="badge variant-soft"
				style="
					position: relative;
					font-size: 1.2em;
				"
			>
				<span>Function</span>
				<span class="badge variant-filled-surface">0x1::aptos_account::transfer</span>
			</span> 
			
			-->
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
		</Panel>
		
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
	
		{#if mode === "nurture" }
		<Panel styles={ trends.panel }>		
			<div class="relative inline-block">
				<button 
					faucet
					
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
		{/if}
		
		{#if mode === "nurture" }
		<Panel 
			styles={ trends.panel }
		>		
			<div class="relative inline-block">

				<button 
					octas_gifts__version_1
					
					on:click={ open_transaction_modal }
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
					<p>Story</p>
					<span 
						class="badge variant-filled-primary"
						style="margin: 0; display: none;"
					>Iteration 1</span>
				</button>
			</div>
		</Panel>
		{/if}

		
		
		{#if mode === "nurture" }
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
		{/if}
	</section>
</Leaf>
