
<script>

import { make_barcode } from '$lib/trinkets/Barcode/Visual/make'
//
import { onMount, onDestroy } from 'svelte';
import { ConicGradient } from '@skeletonlabs/skeleton';
//

import Barcode_Visual from '$lib/trinkets/Barcode/Visual/Trinket.svelte'
		

import { 
	retrieve_truck, 
	monitor_truck,
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Panel/Logistics/Truck'
let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
		
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
	
	show_QR_of_signed_tx ({})
});
onDestroy (() => {
	Truck_Monitor.stop ()
});


let barcode_element = ""

const show_QR_of_signed_tx = async ({
	loop_limit = 10,
	current_loop = 1
}) => {	
	console.log ("show_QR_of_signed_tx", { current_loop, barcode_element })
	
	if (current_loop === loop_limit) {
		return;
	}
	
	if (typeof barcode_element !== "object") {
		await new Promise (resolve => {
			setTimeout (() => {
				resolve ()
			}, 500)
		})
		
		current_loop = current_loop + 1
		show_QR_of_signed_tx ({
			current_loop
		})
		
		return;
	}
	
	make_barcode ({
		barcode_element,
		hexadecimal_string: freight.Unsigned_Transaction_Signature.hexadecimal_string,
		size: 400
	})
}

</script>




{#if prepared === "yes" }
<div>
	<Barcode_Visual 
		hexadecimal_string={ freight.Unsigned_Transaction_Signature.hexadecimal_string }
	/>
</div>
{/if}