










<script>

import * as AptosSDK from "@aptos-labs/ts-sdk";
import { ConicGradient } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte'

import { parse_styles } from '$lib/trinkets/styles/parse.js';
import { ask_latest_block_number } from '$lib/PTO/Blocks/Latest'
import { fiberize_committed_transaction } from '$lib/PTO/Transaction/Committed/Fiberize'
import Address_Qualities from '$lib/trinkets/Address_Qualities/Trinket.svelte'
import Panel from '$lib/trinkets/panel/trinket.svelte'	



const trends = {
	article: parse_styles ({
		padding: '.3cm',
		'font-size': '2em'
	})
}

let packet = {
	effective: "no",
	address_hexadecimal_string: ""
}



let address_trinket = ""
const on_prepare = () => {
	address_trinket.change_address_hexadecimal_string (
		""
	)
}

const on_change = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	packet.effective = effective;
	packet.address_hexadecimal_string = address_hexadecimal_string;
	packet.exception = exception;
}

let the_object_element = ""

onMount (async () => {

});
onDestroy (() => {}); 


</script>



<div
	style="
		max-width: 35cm;
		width: 100%;
	"
>
	<Panel styles={{ "width": "100%" }}>
		<header style="{parse_styles ({
			padding: '.3cm',
			'font-size': '2em',
			'text-align': 'center'
		})}">Address Search</header>  
	</Panel>
	
	<div style="height: 20px"></div>

	<Panel styles={{ "width": "100%" }}>
		<div
			style="{parse_styles ({
				display: 'flex',
				'justify-content': 'center'
			})}"
		>
			<Address_Qualities 
				name="Address"
				
				bind:this={ address_trinket }
				on_change={ on_change }
				on_prepare={ on_prepare }
			/>
		</div>
	</Panel>
	
	<div style="height: 20px"></div>

	<Panel styles={{ "width": "100%", "min-height": "2cm" }}>
		<p
			address_qualities_proceeds
			style="{parse_styles ({
				display: 'flex',
				'justify-content': 'left',
				'white-space': 'pre-wrap',
				'word-wrap': 'break-word'
			})}"
		>{ JSON.stringify (packet, null, 4) }</p>
	</Panel>
	
	<div 
		style="display: none"
		bind:this={ the_object_element }
	>
	</div>
</div>