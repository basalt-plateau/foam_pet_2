


<script>


/*
	@ Signatures
	
	@ Vehicles
		@ Bicycle
		
	@ Identity
*/

////
//
import { onMount } from 'svelte'
import { Html5QrcodeScanner, Html5QrcodeScanType, Html5Qrcode } from "html5-qrcode";
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import Panel from '$lib/trinkets/panel/trinket.svelte'
import APT_Entrust_Mode_1_Loyals_Panel from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Offline_Signing_Hints from '$lib/trinkets/Hints/Offline_Signing/Trinket.svelte'
//
////

const trends = {
	article: parse_styles ({
		padding: '.3cm',
		// "max-width": "15cm"
		
	}),
	article_header: parse_styles ({
		padding: '.3cm',
		'font-size': '2em',
		"text-align": "center",
	}),
	panel: {
		position: 'relative',
		display: 'inline-flex',
		//'width': '33%', 
		'align-items': 'center',
		'justify-content': 'center',
		'flex-direction': 'column'
	},
}

const modal_store = getModalStore ();
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

let barcode_element = ""

let scanning = "yes"
let private_key_hexadecimal_string = ""


let reader;
onMount (() => {

})

</script>

<svelte:head>
	<title>Flourishes</title>
</svelte:head>

<Leaf>
	<div monitor="signatures leaf">
		<div style="height: 1cm"></div>
		
		<Offline_Signing_Hints />
		
		<div style="height: 1cm"></div>
		
		<section
			style={ parse_styles ({
				position: 'relative',
				display: 'grid',
				'width': '100%',
				'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))',
				'grid-gap': '10px'
			}) }
		>
			<Panel styles={ trends.panel }>			
				<div style="height: 0.5cm"></div>
				<div class="relative inline-block">
					<span class="badge variant-soft-primary absolute -right-0 z-10"
						style="
							display: none;
							left: 50%;
							bottom: -30px;
							transform: translateX(-50%);
						"
					>Version 1</span>
					<button 
						monitor="give"
						
						on:click={ open_consideration_modal }
						type="button" 
						
						class="btn bg-gradient-to-br variant-gradient-primary-secondary"
						style="
							font-size: 1.3em;
							padding: 12px 36px;
							margin-top: 10px
						"
					>APT Entrust</button>
				</div>
				<div style="height: 10px"></div>
				<article style="{ trends.article }">
					<p style="text-align: center">This is for signing for an "APT Entrust".</p>
				</article>
				<div style="height: 0.5cm"></div>
			</Panel>
		</section>
		
		<div style="height: 5cm"></div>
	</div>
	

</Leaf>

