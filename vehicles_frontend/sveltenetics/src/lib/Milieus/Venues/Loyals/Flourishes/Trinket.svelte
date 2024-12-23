


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

import { Slangify } from "$lib/trinkets/Slang"
		

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


let header_1_saying = {
	name: (
		"Зөвшөөрөл"
	),
	language: (
		"Mongolian"
	),
	pronunciation: (
		"Zövshöörel"
	),
	english: "Consent"
}


let reader;
onMount (() => {
	console.info (Slangify ({ text: "signature" }))
})

</script>

<svelte:head>
	<title>{ Slangify ({ text: "Signature" }) }</title>
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

			<div
				class="card p-1 variant-soft-surface"
				style="
					width: 100%;
				"
			>
				<span
					style="
						display: block;
						text-align: center;
					"
				>Perhaps occassionally pronounced <b>{ header_1_saying.pronunciation }</b>, </span>
				<span
					style="
						display: block;
						text-align: center;
					"
				><b style="font-size: 1.2em">{ header_1_saying.name }</b> might be <b>{ header_1_saying.language }</b> for <b>{ header_1_saying.english }</b>.</span>
			</div>
			
			
			<div style="height: 1cm"></div>
			
			<p
				style="
					text-align: center;
					max-width: 500px;
					margin: 0 auto;
				"
			>A unique form of <Slang text="signature" /> is necessary for each <Slang text="petition" /> + <Slang text="private key" /> combination.</p>

			<div style="height: 1cm"></div>

			<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="private key" /> -> <Slang text="sender" /> <Slang text="signature" /> </p>
			
			<div style="height: 0.5cm"></div>
			
			<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="signature" /> + <Slang text="signature" /> from each <Slang text="validator" /> -> <Slang text="blockchain transaction" /></p>
		
			<div style="height: 1cm"></div>		
		</div>
		
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
					<p style="text-align: center">This is for <Slang text="signing" /> for an "APT Entrust".</p>
				</article>
				<div style="height: 0.5cm"></div>
			</Panel>
		</section>
		
		<div style="height: 5cm"></div>
	</div>
	

</Leaf>

