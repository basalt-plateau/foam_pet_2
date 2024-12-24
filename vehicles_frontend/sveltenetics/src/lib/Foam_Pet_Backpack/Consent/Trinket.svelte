


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
import Offline_Signing_Hints from './Offline_Signing/Trinket.svelte'
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
	<title>Consent</title>
</svelte:head>

<Leaf>
	<div monitor="signatures leaf">
		<div 
			style="
				text-align: center;
			"
			class="card p-4"
		>
			<div style="height: 1cm"></div>
		
			<header
				style="font-size: 2.5em; 
				text-align: center"
			><Slang text="Signature" /></header>

			<div style="height: 1cm"></div>
			
			<p
				style="
					text-align: center;
					max-width: 500px;
					margin: 0 auto;
					
					line-height: 250%;
				"
			>A unique form of <Slang text="signature" /> is necessary for each <Slang text="petition" /> + <Slang text="private key" /> combination.</p>
			
			<div style="height: 1cm"></div>					
		</div>

		<div style="height: 0.5cm"></div>

		
		
		<div style="height: 0.5cm"></div>
		
		<Offline_Signing_Hints />

		
		<div style="height: 5cm"></div>
	</div>
	

</Leaf>

