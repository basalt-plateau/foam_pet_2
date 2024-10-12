

<script>

//	
/*
	import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'

	let origin_address = {
		effective: "no",
		address_hexadecimal_string: "",
		exception: ""
	}

	const on_change = ({
		effective,
		address_hexadecimal_string,
		exception
	}) => {
		origin_address.effective = effective;
		origin_address.address_hexadecimal_string = address_hexadecimal_string;
		origin_address.exception = exception;
	}
	
	let address_trinket = ""
	const on_prepare = () => {
		address_trinket.change_address_hexadecimal_string ("")
	}

	<Address_Qualities_Trinket 
		bind:this={ address_trinket }
		name="Origin Address"
		on_change={ on_change }
		on_prepare={ on_prepare }
	/>
*/
import Panel from '$lib/trinkets/panel/trinket.svelte'
import { ConicGradient } from '@skeletonlabs/skeleton';
import { SlideToggle } from '@skeletonlabs/skeleton';
import * as AptosSDK from "@aptos-labs/ts-sdk";
import { onMount, onDestroy } from 'svelte'
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import { ask_APT_count } from '$lib/PTO/APT/Count'
//
import { loop } from '$lib/taverns/loop'
import {
	check_roomies_truck,
	monitor_roomies_truck
} from '$lib/Versies/Trucks'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
import { ProgressBar } from '@skeletonlabs/skeleton';
//
import { ProgressRadial } from '@skeletonlabs/skeleton';
import anime from 'animejs/lib/anime.es.js';
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	

export let name = "Address"
export let on_change = () => {}
export let on_prepare = () => {}

let address_hexadecimal_string = ""
let balance = ""

let Octa_count = ""
let APT_count = ""
let table_opacity = 0

let alert_exception = ""
let alert_caution = ""
let alert_info = "Waiting for an address."
let alert_proceeds = "no"

$: asking = true;
$: {
	asking;
	
	if (asking === true) {
		suggest_loop.play ()
	}
	else {
		suggest_loop.stop ()
		show.info ({
			info: ""
		})
	}
}

export const change_address_hexadecimal_string = (address) => {
	address_hexadecimal_string = address;
}

const suggest_loop = loop ({
	wait: 2000,
	action: async () => {
		// console.info ({ asking })
		
		if (asking === true) {
			ask_balance ()
		}
	}
})

const send_on_change = () => {
	on_change ({
		effective: alert_proceeds,
		address_hexadecimal_string,
				
		exception: alert_exception
	})
}


/*
<ProgressBar 
	value={undefined} 
	animIndeterminate="anim-progress-bar"
	class="h-1"
	meter="bg-secondary-500"
/>

{#if false}
<ProgressRadial 
	value={undefined} 
	width="w-8"
/>
{/if}
*/



const show = {
	exception ({ exception }) {
		Octa_count = "?"
	
		alert_exception = exception;
		alert_caution = ""
		alert_info = ""
		alert_proceeds = "no";
		
		send_on_change ()
	},
	caution ({ caution }) {
		Octa_count = "?"
	
		alert_exception = ""
		alert_caution = caution
		alert_info = ""
		alert_proceeds = "no";
		
		send_on_change ()
	},
	info ({ info }) {
		// This is called if..
	
		alert_exception = ""
		alert_caution = ""
		alert_info = info
		alert_proceeds = "no";
		
		send_on_change ()
	},
	proceeds ({ Octas }) {
		alert_exception = ""
		alert_caution = ""
		alert_info = "The address was found."
		alert_proceeds = "yes";
		
		Octa_count = parse_with_commas (Octas)
		
		send_on_change ()
	}
}

//
//	
//
//
const clear_alerts = () => {
	Octa_count = "?"
	
	alert_exception = "";
	alert_caution = ""
	alert_info = ""
	alert_proceeds = "no";
	
	send_on_change ()
}


let progress_element = ""
let octas_count_element = ""
let animation = ""
const build_animation = () => {
	animation = anime.timeline({
		easing: 'easeOutExpo',
		duration: 250
	});
	animation.add ({
		targets: octas_count_element,
		opacity: 0.5,
	})
	animation.add ({
		targets: octas_count_element,
		opacity: 1
	})
	
	/*
	animation.add ({
		targets: octas_count_element,
		rotateX: 180,
		opacity: 0.1
	})
	animation.add ({
		targets: octas_count_element,
		rotateX: 0,
		opacity: 1
	})
	*/
	
	
	/*.add({
		targets: octas_count_element,
		rotateX: 0
	})*/
}



const animate_progress_element = () => {
	try {
		animation.restart ();
		animation.play ()
	}
	catch (exception) {
		console.error (exception)
	}
}

const ask_balance = async () => {
	// console.info ("ask_balance")
	// clear_alerts ()
	
	animate_progress_element ()
	
	try {
		if (address_hexadecimal_string.length === 0) {
			show.info ({
				info: "Waiting for an address"
			})
			return;
		}
		
		const address_hexadecimal_string_ask = address_hexadecimal_string;
		const APT_count_ask = await ask_APT_count ({ 
			address_hexadecimal_string: address_hexadecimal_string_ask,
			net_path: RT_Freight.net_path
		})
		
		//
		// if the address changed during the request
		if (address_hexadecimal_string_ask !== address_hexadecimal_string) {
			show.info ({
				info: "searching for address"
			})
			return;
		}
		
		if (APT_count_ask.effective !== "yes") {
			if (APT_count_ask.error_code === "resource_not_found") {
				show.caution ({
					caution: APT_count_ask.exception
				})
				return;
			}
			
			show.exception ({
				exception: APT_count_ask.exception
			})
			return;
		}
		 
		show.proceeds ({
			Octas: APT_count_ask.Octa_count
		})
	}
	catch (_exception) {
		console.error (_exception)
		show.exception ({
			exception: _exception.message
		})
		
		return;
	}
}

const address_changed = () => {
	clear_alerts ()
	
	if (asking === true) {
		show.info ({ info: "searching for address" })
	}
	else {
		show.info ({ info: "" })
	}
}



let RT_Prepared = "no"
let RT_Monitor;
let RT_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	RT_Freight = Truck.freight; 
	
	RT_Monitor = monitor_roomies_truck ((_freight) => {
		RT_Freight = _freight;
	})
	
	RT_Prepared = "yes"
	
	on_prepare ()
	
	suggest_loop.play ()
	
	clear_alerts ()
	build_animation ()
});

onDestroy (() => {
	RT_Monitor.stop ()
	suggest_loop.stop ()
}); 



</script>


<div
	style="
		width: 100%;
	"
>
	<div
		style="{parse_styles ({
			display: 'flex',
			'justify-content': 'center'
		})}"
	>
		<div 
			style="
				background: none; 
				margin-right: 10px;
				width: 100%;
			"
		>
			<div 
			
				style="
					display: grid;
					grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
					gap: 0.2cm;
					
					align-items: center;
					justify-content: space-between;
					
					padding: 4px;
				"
			>
			
				<div
					style="
						display: flex;
						align-items: center;
						justify-content: center;
						
					"
				>
					<div
						class="badge variant-soft-primary"
						style="
							padding: 0.2cm 1cm;
						"
					>
						<p
							style="
								font-size: 1.2em;
								font-weight: bold;
							"
						>{ name }</p>
					</div>
				</div>
			</div>
			
			<textarea 
				address_hexadecimal_string
			
				bind:value={ address_hexadecimal_string }
				on:input={ address_changed }
			
				style="
					padding: .2cm;
				"
				class="textarea" 
				rows="1" 
				placeholder="Address" 
			/>
			
			{#if false}
			<ProgressBar 
				value={undefined} 
				animIndeterminate="anim-progress-bar"
				class="h-1"
				meter="bg-secondary-500"
			/>
			{/if}
		</div>
		
		
	</div>
	
	<div
		style="
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
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
			
			<SlideToggle 
				bind:checked={ asking } 
				size="sm"
				active="bg-primary-500"
			/>
			
			<span>Ask for Details</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				font-size: 1.2em;
			"
		>
			<span>Address Size</span>
			<span class="badge variant-filled-surface">{ 
				address_hexadecimal_string.length 
			}</span>
		</span>
		<span class="badge variant-soft"
			style="
				position: relative;
				font-size: 1.2em;
			"
		>
			<span
				style="
					position: absolute;
					left: 0.2cm;
					top: 50%;
					transform: translateY(-50%);
					opacity: { asking ? 1 : 0 };
				"
			>
				<div bind:this={ octas_count_element }>
					<ProgressRadial 
						value={undefined} 
						width="w-6"
						fill="#222"
						stroke="90"
						strokeLinecap="round"
					/>
				</div>
			</span>
			<span>Octas Balance</span>
			<span 
				class="badge variant-filled-surface"
				
			>{ Octa_count }</span>
		</span>
	</div>
	
	
	
	{#if alert_info.length >= 1 }
		<aside class="alert variant-soft-primary">
			<div class="alert-message">
				<p>{ alert_info }</p>
			</div>
		</aside>
		<div style="height: .1cm"></div>
	{/if}
	
	{#if alert_caution.length >= 1 }
		<aside class="alert variant-filled-warning">
			<div class="alert-message">
				<p
					style="
						white-space: pre-wrap;
						word-wrap: break-word;
					"
				>{alert_caution}</p>
			</div>
		</aside>
		<div style="height: .1cm"></div>
	{/if}
	
	
	{#if alert_exception.length >= 1 }
		<aside 
			class="alert variant-filled-error"
		>
			<div class="alert-message">
				<p
					style="
						white-space: pre-wrap;
						word-wrap: break-word;
					"
				>{ alert_exception }</p>
			</div>
		</aside>
		<div style="height: .1cm"></div>
	{/if}
	
	
	
</div>