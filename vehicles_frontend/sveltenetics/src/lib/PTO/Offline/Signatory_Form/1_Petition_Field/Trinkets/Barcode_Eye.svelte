



<script>

///
//
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { ConicGradient } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
import { onMount, onDestroy } from 'svelte';
import { Html5QrcodeScanner, Html5QrcodeScanType, Html5Qrcode } from "html5-qrcode";
//
//
import Barcode_Vision from '$lib/trinkets/Barcode/Vision/Trinket.svelte'
import UT_Stringified from '$lib/PTO/Transaction/Unsigned/Stringified.svelte'
//
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
//
// import { add_unsigned_transaction } from '../Screenplays/add_unsigned_transaction'
//
//\


	
let barcode_vision = ""
const found = async (packet) => {
	const { hexadecimal_string } = packet;
	console.info ("found:", { hexadecimal_string });
	
	
	
	/*
	if (freight.Unsigned_Transaction_Fields.camera.searching === "yes") {
		freight.Unsigned_Transaction_Fields.camera.searching = "no"
	}
	else {
		return
	}
	
	await add_unsigned_transaction ({
		unsigned_transaction_hexadecimal_string: hexadecimal_string,
		freight
	})
	
	freight.Unsigned_Transaction_Fields.camera.barcode_found = "yes"
	freight.Unsigned_Transaction_Fields.info_text = ""
	freight.Unsigned_Transaction_Fields.alert_success = "The barcode was scanned and the unsigned transaction object built."
	
	*/
	
	barcode_vision.stop_the_scan ();
}






</script>


<div
	style="
		padding: 0 0 1cm;
	"
>
	<div style="padding: 5px 0 10px;">
		<header
			style="
				text-align: center;
				font-size: 1.4em;
				padding: .2cm 0;
			"
		>QR Barcode Picture</header>
		<p
			style="
				text-align: center;
			"
		>A prosthetic eye can etch a <Slang text="petition" /> barcode here.</p>
		<p
			style="
				text-align: center;
			"
		>The "Request Camera Permissions" button opens the barcode scan.</p>
	</div>
	
	<div 
		class="card p1"
		style="
			margin: 0.2cm auto;
			max-width: 10cm;
			width: 100%;
		"
	>
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<p
						style="
							text-align: center;
						"
					>Help</p>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<p>
						<span>If the video does not start, perhaps one of these might start the video.</span>
					</p>
					<ol class="list">
						<li>
							<span class="badge-icon p-4 variant-soft-primary">1</span>
							<span class="flex-auto">refreshing the browser</span>
						</li>
						<li>
							<span class="badge-icon p-4 variant-soft-primary">2</span>
							<span class="flex-auto">checking if the prosthetic eye is connected</span>
						</li>
						<li>
							<span class="badge-icon p-4 variant-soft-primary">3</span>
							<span class="flex-auto">checking if the prosthetic eye is on</span>
						</li>
					</ol>
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
	

	<Barcode_Vision
		bind:this={ barcode_vision }
		found={ found }
	/>
</div>
