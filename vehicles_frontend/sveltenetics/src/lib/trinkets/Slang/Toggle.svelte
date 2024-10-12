

<script>

/*
	import Slang_Toggle from '$lib/Slang/Toggle.svelte'
*/

//
//
import { onMount, onDestroy } from 'svelte'
import { SlideToggle } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
//
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'
import Slang_Cipher from '$lib/trinkets/Slang/Cipher.svelte'
//
//

let use_slang_boolean;
$: {
	// if toggle changes
	
	let _use_slang_boolean = use_slang_boolean;
	
	console.log ("modify:", { Seeds_Trucks_Freight, use_slang_boolean });
	
	if (Seeds_Trucks_Freight) {
		if (use_slang_boolean === true) {
			Seeds_Trucks_Freight.use_slang = "yes";
		}
		else {
			Seeds_Trucks_Freight.use_slang = "no";
		}		
	}
}
const modify = () => {
	console.log ("modify:", { Seeds_Trucks_Freight, use_slang_boolean });
	
	if (Seeds_Trucks_Freight) {
		if (Seeds_Trucks_Freight.use_slang === "yes") {
			use_slang_boolean = true;
		}
		else {
			use_slang_boolean = false;
		}		
	}
}


let Seeds_Trucks_Prepared = "no"
let Seeds_Trucks_Monitor;
let Seeds_Trucks_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	Seeds_Trucks_Freight = Truck.freight; 
	
	Seeds_Trucks_Monitor = monitor_roomies_truck ((_freight) => {
		Seeds_Trucks_Freight = _freight;
		modify ();
	})
	
	modify ();
	
	Seeds_Trucks_Prepared = "yes"
});

onDestroy (() => {
	Seeds_Trucks_Monitor.stop ()
}); 

</script>


{#if Seeds_Trucks_Prepared === "yes"}
<div 
	style="
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	"
	class="card p-4"
>
	<div
		class="card p-2 variant-soft-surface"
		style="
			padding: 0.2cm 1cm;
			margin: 0.2cm 0 0.5cm;
		"
	>
		<header
			style="
				font-size: 1.4em;
				line-height: 100%;
			"
		>Slang</header>
	</div>

	<div
		style="
			display: flex;
			align-items: center;
			justify-content: center;
			
			padding: 0.1cm 0.25cm;
		"
	>
		<p
			style="
				padding: 0.1cm 0.4cm;
			"
		>off</p>
		<SlideToggle name="slide" bind:checked={ use_slang_boolean } />
		<p
			style="
				padding: 0.1cm 0.4cm;
			"
		>on</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div 
		style="
			width: 100%;
		"
		class="card p-4 variant-filled-primary"
	>
		<Accordion>
			<AccordionItem>
				<svelte:fragment slot="summary">
					<div
						style="
							text-align: center;
							font-size: 1.5em;
						"
					>
						<p>Cipher</p>
					</div>
				</svelte:fragment>
				<svelte:fragment slot="content">
					<Slang_Cipher />
				</svelte:fragment>
			</AccordionItem>
		</Accordion>
	</div>
</div>
{/if}