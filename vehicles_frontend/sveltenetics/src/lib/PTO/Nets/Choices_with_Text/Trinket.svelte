


<script>

/*
import Net_Choices_with_Text from '$lib/PTO/Nets/Choices_with_Text/Trinket.svelte'

<Net_Choices_with_Text 
	prepare={() => {
		return {
			net_name: "mainnet"
		}
	}}
	every_enhance={({
		net_name,
		net_path,
		chain_id
	}) => {
		console.info ({
			net_name,
			net_path,
			chain_id
		})
	}}
/>
*/


////
//
import { ConicGradient } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte'
//
//
import Net_Choices from '$lib/PTO/Nets/Choices.svelte'
import Problem_Alert from '$lib/trinkets/Alerts/Problem.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'
//
import { loop } from '$lib/taverns/loop'
import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'
import { has_field } from '$lib/taverns/procedures/object/has_field'
//
//
//


export let prepare = () => {
	return {
		net_name
	}
};
export let every_enhance = () => {};


let ICANN_addresses = {}


/*
	"testnet": {
		"name": "testnet",
		"path": "https://api.testnet.aptoslabs.com/v1"
	},
*/
const nets = {
	"mainnet": {
		"name": "mainnet",
		"path": "https://api.mainnet.aptoslabs.com/v1"
	},
	"devnet": {
		"name": "devnet",
		"path": "https://api.devnet.aptoslabs.com/v1"
	},
	"other": {
		"name": "other",
		"path": ""
	}
}

$: prepared = "no"

$: net_name = "mainnet"
$: net_path = ""
$: chain_id = ""
$: block_height = ""
$: epoch = ""
$: alert_problem_text = ""
$: other_address_confirmed = "no"
$: ledger_info_loop_allowed = "no"

let ledger_ask_count = 0;

const clear_info = () => {
	console.info ("clear info")
	
	chain_id = "";
	block_height = "";
	epoch = "";
	//
	other_address_confirmed = "no"
	//
	alert_problem_text = ""
}

//
//	ICANN_net_path
//
//
const on_change = async () => {}



const the_ledger_ask_loop = loop ({
	wait: 2000,
	wait_for_response: "yes",
	action: async () => {
		const there_is_a_net_path = typeof net_path === "string" && net_path.length >= 1;
		if (there_is_a_net_path !== true) {
			console.info (`There's not a "net path" for the ledger loop.`)
			return;
		}
		
		ledger_ask_count += 1
		const curren_ledger_ask_count = ledger_ask_count;
		
		try {
			const { enhanced } = await request_ledger_info ({ net_path })
			
			//
			//	If the UI changed, after the ask, this filters
			//	the info that was returned from the ask.
			//
			if (ledger_ask_count == curren_ledger_ask_count) {
				console.info ("Modifying the latest stats.")
				
				const { chain_id: _chain_id } = enhanced;
				chain_id = _chain_id;
				block_height = enhanced.block_height;
				epoch = enhanced.epoch;
				
				alert_problem_text = "";
				
				every_enhance ({
					net_name,
					net_path,
					net_connected: "yes",
					chain_id
				})
			}
		}
		catch (exception) {
			
			alert_problem_text = exception.message;
			
			every_enhance ({
				net_name,
				net_path,
				net_connected: "no",
				chain_id: ""
			})
		}
	}
})




const on_select_change = async (event) => {
	the_ledger_ask_loop.stop ()
	clear_info ()
	
	net_name = event.target.value;
	let net = nets [ net_name ]
	net_path = net.path;
	other_address_confirmed = "no"
	
	console.log ({ net })
	
	if (net_name === "other") {
		// don't start the loop		
		return;
	}
	
	the_ledger_ask_loop.play ()
}

//
//	Unconfirm
//
//
const on_other_textarea_change = async (event) => {
	the_ledger_ask_loop.stop ()
	clear_info ()
	
	net_path = event.target.value;
	// net_name = "other"
	
	other_address_confirmed = "no"
	
	// the_ledger_ask_loop.play ()
}
const after_confirm_other_address = () => {
	the_ledger_ask_loop.stop ()
	clear_info ()
	
	
	other_address_confirmed = "yes"
	the_ledger_ask_loop.play ()
}

const on_mount_prepare = () => {
	the_ledger_ask_loop.stop ()
	clear_info ()
	
	const preparations = prepare ()
	net_name = preparations.net_name;
	let net = nets [ net_name ]
	net_path = net.path;
	
	
	prepared = "yes"
	
	the_ledger_ask_loop.play ()
}



onMount (() => {
	on_mount_prepare ()
})

onDestroy (() => {
	the_ledger_ask_loop.stop ()
})

</script>

{#if prepared === "yes"}
<div
	net_group_choices
	style="
		width: 100%;
	"
>
	<div
		class="card p-2 variant-soft-surface"
		style="
			padding: 0.2cm 1cm;
			margin: 0.2cm auto 0.5cm;
			max-width: 4cm;
			text-align: center;
		"
	>
		<header
			style="
				font-size: 1.4em;
				line-height: 100%;
			"
		>Group</header>
	</div>
	
	<div style="padding: 0 0 0.5cm">
		<p
			style="text-align: center; font-size: 1em"
		>This is for net that <Slang text="Town" /> connects to.</p>
		<div style="height: 12px"></div>
		<p
			style="text-align: center; font-size: 1em"
		>The <Slang text="Blockchain" /> is currently based on the response from one address.</p>
	</div>
	<select 
		nets-choices
		
		class="select" 
		bind:value={ net_name }
		on:change={ on_select_change }
	>
		<option value="mainnet">mainnet</option>
		<option value="devnet">devnet</option>
		
		<option value="other">other</option>
	</select>
	<div style="height: 6px"></div>
	
	{#if net_name === "other" }
	<div
		other_net_path_region
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
			gap: 4px;
		"
	>
		<div
			style="
				grid-column: span 1;
				grid-row: span 1;
				
				display: flex;
				width: 100%;
			"
		>
			<div 
				style="
					display: flex;
					align-items: center;
					justify-content: center;
					padding: 0 10px;
					
					opacity: { other_address_confirmed === "yes" ? 1 : 0}
				"
			>
				<ConicGradient 
					stops={[
						{ color: 'transparent', start: 0, end: 25 },
						{ color: 'rgb(var(--color-primary-500))', start: 75, end: 100 }
					]} 
					spin width="w-6"
				/>
				
				<div
					style="
						position: absolute;
						top: 10px;
						left: 10px;
					"
				>		
					<Radial_Progress />
				</div>
			</div>
		
			<div 
				class="card p-2"
				style="
					display: flex;
					flex-grow: 1;
					
					align-items: center;
				"
			>
				<span icann_net_address>Net Path</span>
			</div>
		</div>

		<textarea 
			icann_net_address
			
			on:keyup={ on_other_textarea_change }
			bind:value={ net_path }
			
			style="
				grid-column: span 2;
				grid-row: span 1;
			
				padding: 5px 10px
			"
	
			class="textarea"
			type="text" 
			placeholder=""
			
			rows="1"
		/>
		
		<div
			style="
				grid-column: span 1;
				grid-row: span 1;
				min-width: 100px;
			"
		>
			<button 
				type="button" 
				class="btn variant-filled"
				
				
				on:click={ after_confirm_other_address }
				disabled={ other_address_confirmed === "yes" }
			>Confirm Address</button>
		</div>
	</div>
	{:else}
	<div
		style="
			display: flex;
			gap: 5px;
			width: 100%;
		"
	>
		<div 
			style="
				position: relative;
			
				display: flex;
				align-items: center;
				justify-content: center;
			"
		>
			<div
				style="
					position: relative;
					top: 0;
					left: 0;
				"
			>		
				<Radial_Progress />
			</div>
		</div>
		<div class="card p-2"
			style="
			
			"
		>
			<span>ICANN Address</span>
		</div>
		<div class="card p-2"
			style="
				flex: 1 1 200px;
			"
		>
			<span icann_net_address>{ net_path }</span>
		</div>
	</div>
	{/if}
	
	{#if typeof chain_id === "number"}
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
			gap: 4px;
			width: 100%;
			margin: 4px 0;
		"
	>
		<span class="badge variant-soft"
			style="
				position: relative;
				font-size: 1.2em;
			"
		>
			<span>Chain ID</span>
			<span class="badge variant-filled-surface">{ chain_id }</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				font-size: 1.1em;
			"
		>
			<span>Epoch</span>
			<span class="badge variant-filled-surface">{ epoch }</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				font-size: 1.1em;
			"
		>
			<span>Block Height</span>
			<span class="badge variant-filled-surface">{ block_height }</span>
		</span>
	</div>
	{/if}
	
	{#if alert_problem_text.length >= 1}
	<Problem_Alert 
		text={ alert_problem_text }
	/>
	{/if}
</div>
{/if}