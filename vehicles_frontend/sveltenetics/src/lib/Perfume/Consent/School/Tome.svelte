


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
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';
import Panel from '$lib/trinkets/panel/trinket.svelte'
import APT_Entrust_Mode_1_Loyals_Panel from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'
//
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



<Leaf>
	<div 
		style="
			text-align: center;
		"
		class="card p-4"
	>
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
	
	<div 
		style="
			text-align: center;
		"
		class="card p-4"
	>
		<div class="card p-1">
			<Accordion>
				<AccordionItem>
					<svelte:fragment slot="summary">
						<div
							style="
								text-align: center;
								font-size: 1.5em;
							"
						>
							<p>Formulas</p>
						</div>
					</svelte:fragment>
					<svelte:fragment slot="content">
						<div 
							style="
								text-align: center;
							"
							class="card p-4"
						>
							<div style="height: 1cm"></div>

							<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="private key" /> -> <Slang text="sender" /> <Slang text="signature" /> </p>
							
							<div style="height: 0.5cm"></div>
							
							<p><Slang text="petition" /> + <Slang text="sender" /> <Slang text="signature" /> + <Slang text="signature" /> from each <Slang text="validator" /> -> <Slang text="blockchain transaction" /></p>
						
							<div style="height: 1cm"></div>		
						</div>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>
	</div>

	<div style="height: 0.5cm"></div>

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
		>Offline <Slang text="Signature" /></header>
		
		<div style="height: 1cm"></div>
	
		<p
			style="font-size: 1em; text-align: center; line-height: 2em;"
		>
			<span>A <Slang text="Wallet" /> should be on an <Slang text="Offline Machine" />.</span>
		</p>
		
		<div style="height: 1cm"></div>
		
		
		
		<Offline_Signing_Example />
		
		<div style="height: 0.25cm"></div>

		<div class="card p-1 variant-filled-soft">
			<Accordion>
				<AccordionItem>
					<svelte:fragment slot="summary">
						<div
							style="
								text-align: center;
								font-size: 1.5em;
							"
						>
							<p>QR Codes + Cameras</p>
						</div>
					</svelte:fragment>
					<svelte:fragment slot="content">
						<div style="height: 0.5cm"></div>

						<p
							style="
								font-size: 1em; 
								text-align: center; 
								margin: 0;
							"
						>
							<span>An <Slang text="Offline Machine" /> can communicate with an <Slang text="Online Machine" /> with <Slang text="a_signature" /> encoded as a QR code.</span>			
						</p> 

						<p
							style="
								font-size: 1em; 
								text-align: center; 
								margin: 0;
							"
						>
							<span>Thus, the <Slang text="Offline Machine" /> doesn't need to send <Slang text="private keys" /> to the <Slang text="Online Machine" />.</span>
						</p>
						
						<div style="height: 0.5cm"></div>
					</svelte:fragment>
				</AccordionItem>
			</Accordion>
		</div>
	</div>
	
	<div style="height: 5cm"></div>
</Leaf>

