

<script>

///
//
// https://lucide.dev/guide/packages/lucide-svelte#one-generic-icon-component
// https://lucide.dev/icons/
//
//

//\\
//
//
import { planet, chameleon, spiderWeb } from '@lucide/lab'
import Salad from 'lucide-svelte/icons/salad'
import ScanQRCode from 'lucide-svelte/icons/scan-qr-code'
//
import { goto } from '$app/navigation';
import { page } from '$app/stores';
import { onMount, onDestroy } from 'svelte';
import { get, writable } from 'svelte/store';
//
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
//
import { check_Milieus_truck } from '$lib/Milieus/Truck'
import Milieus_Trucks from '$lib/Milieus/Truck/Trinket.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
//
//
import Buttons_Panel from './Trinkets/Buttons_Panel.svelte'
import Net_Trinket from './Trinkets/Net.svelte'
import Online_Caution_Alert from './Trinkets/Online_Caution_Alert.svelte'
import The_Map_Trinket from './Trinkets/The_Map/Trinket.svelte'
//
import Navigator_1 from './Trinkets/Navigator_1.svelte'
import Navigator_Scholars from './Trinkets/Navigator_Scholars.svelte'
import Navigator_Friends from './Trinkets/Navigator_Friends.svelte'
import Navigator_Loyals from './Trinkets/Navigator_Loyals/Trinket.svelte'
//
////



let navigator_1;

let mode = check_roomies_truck ().freight.mode;

let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
		
		
	}
	
	// navigator_1.change ();
}




</script>


<div>
	<Milieus_Trucks on_change={ on_seeds_truck_change }/>

	
	{#if seeds_trucks_prepared === "yes"}
	<div>
		<nav
			monitor="navigator 1 structure"
			style="
				display: flex;
				justify-content: center;
				
				padding: 0.2cm;
				
				max-width: 12cm;
				width: 100%;
				
				margin: 0 auto;
			"
		>
			<Navigator_1 />
		</nav>
		
		<nav class="bg-surface-100-800-token w-full">
			<div
				monitor="navigator 2 structure"
				style="
					display: flex;
					justify-content: center;
					
					padding: 0.2cm;
					
					max-width: 12cm;
					width: 100%;
					
					margin: 0 auto;
				"
			>
				<Navigator_Scholars />
				<Navigator_Friends />
				<Navigator_Loyals />
			</div>
		</nav>
		
		<Net_Trinket />
		
		<Online_Caution_Alert />
	</div>
	{/if}
</div>