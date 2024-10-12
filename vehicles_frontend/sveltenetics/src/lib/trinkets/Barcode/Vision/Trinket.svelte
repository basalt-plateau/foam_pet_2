

<script>

/*
	import Barcode_Vision from '$lib/trinkets/Barcode/Vision/Trinket.svelte'
	
	const on_barcode_found = async ({ hexadecimal_string }) => {
		// stop scanning if found.
		
		barcode_vision.stop_the_scan ();
	}
	
	<Barcode_Vision
		bind:this={ barcode_vision }
		found={ on_barcode_found }
		
		styles={{
			
		}}
	/>
*/

/*
	todo:
		ask for camera permission:
			"Permit Vision"
			
		Code:
			Aztec
			QR
*/

/*
	https://scanapp.org/html5-qrcode-docs/docs/intro
	https://www.npmjs.com/package/html5-qrcode
*/

///
//
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { ConicGradient } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte';
import { Html5QrcodeScanner, Html5QrcodeScanType, Html5Qrcode, Html5QrcodeSupportedFormats } from "html5-qrcode";
//
//
import { parse_styles } from '$lib/trinkets/styles/parse'
//
//\

import { unpack_string } from '../_Screenplays/unpack'


export let found = () => {}
export let styles = {}

let actual_styles = parse_styles (Object.assign ({}, {
	"height": "400px", 
	"width": "100%",
	"max-width": "600px", 
	"margin": "0 auto"
}, styles))

let can_scan = "yes"
const stop = () => {
	can_scan = "no"
}

const on_camera_success = async (decodedText, decodedResult) => {
	if (can_scan !== "yes") {
		return;
	}
	
	const hexadecimal_string = unpack_string (decodedText)
	
	found ({
		hexadecimal_string,
		decodedText,
		decodedResult
	})
}

const on_camera_error = function () {
	console.log ('on_error', arguments)
}

let HTML5_QR_Barcode_Scanner;

const open_camera = () => {
	const config = {
		fps: 10,
		qrbox: {
			width: 500, 
			height: 500
		},
		formatsToSupport: [
			Html5QrcodeSupportedFormats.QR_CODE,
			Html5QrcodeSupportedFormats.AZTEC			
		],
		
		// rememberLastUsedCamera: true,
		// Only support camera scan type.
		// supportedScanTypes: [ Html5QrcodeScanType.SCAN_TYPE_CAMERA ]
	}
	
	if (true) {
		HTML5_QR_Barcode_Scanner = new Html5QrcodeScanner (
			"barcode_vision", 
			config
		);

		HTML5_QR_Barcode_Scanner.render (
			on_camera_success,
			on_camera_error
		);
		
	}
}

export const stop_the_scan = () => {
	if (HTML5_QR_Barcode_Scanner) {
		HTML5_QR_Barcode_Scanner.pause ()		
		// HTML5_QR_Barcode_Scanner.clear ()
	}
}

let prepared = "no"
onMount (async () => {
	open_camera ();
	prepared = "yes"
});

onDestroy (async () => {
	if (HTML5_QR_Barcode_Scanner) {
		try {
			HTML5_QR_Barcode_Scanner.clear ()
		}
		catch (exception) {
			console.error (exception)
		}
	}
})

</script>


<div 
	monitor="barcode vision"
	id='barcode_vision'
	style={ actual_styles }
></div>
