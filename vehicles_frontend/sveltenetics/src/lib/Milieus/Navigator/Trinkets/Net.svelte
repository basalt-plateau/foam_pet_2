
<script>

import { onMount, onDestroy } from 'svelte'

import {
	check_roomies_truck,
	monitor_roomies_truck
} from '$lib/Versies/Trucks'


import Radial_Progress from '$lib/trinkets/Progress/Radial/Trinket.svelte'

import _get from 'lodash/get'

let RT_Prepared = "no"
let RT_Monitor;
let RT_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	RT_Freight = Truck.freight; 
	
	RT_Monitor = monitor_roomies_truck ((_freight) => {
		RT_Freight = _freight;
	})
	
	RT_Prepared = "yes"
});

onDestroy (() => {
	RT_Monitor.stop ()
}); 

let layout_style = `
	position: relative;
	font-size: 1em;
`
if (RT_Freight && RT_Freight.window_width) {
	layout_style += `
		flex-direction: column;
		gap: 0.2cm;
	`
}

</script>



{#if RT_Prepared === "yes" }
<div
	style="
		display: flex;
		justify-content: center;
		align-items: center;
	"
>
	<aside 
		style="
			padding: 4px 8px;
			margin: 8px 0;
			display: inline-block;
			min-width: 300px;
		"
	>
        <div 
			class="badge"
			style={ `
				position: relative;
				font-size: 1em;
				
				${ RT_Freight.window_width <= 700 ? "flex-direction: column; gap: 0.2cm;" : "" }
			` }
		>
			<div
				style="
					display: inline-flex;
					gap: 0.2cm;
					align-items: center;
				"
			>
				<span>net</span>
				
				
				<span
					class="badge variant-filled-surface"
					style="
						margin: 0;
					"
				>{ RT_Freight.net_name }</span>
				
				<span
					class="badge variant-filled-surface"
					style="
						margin: 0;
					"
				>{ RT_Freight.net_path }</span>
			</div>
			
			<div
				style="
					display: inline-flex;
					gap: 0.2cm;
					align-items: center;
				"
			>
				{#if RT_Freight.net_connected === "yes" }
				<span
					class="badge variant-filled"
					style="
						margin: 0;
					"
				>connected</span>
				{:else}
				<span
					class="badge variant-filled"
					style="
						margin: 0;
					"
				>disconnected</span>
				{/if}
				
				<div
					style="
						position: relative;
						top: 0;
						right: 0;
					"
				>		
					<Radial_Progress />
				</div>
			</div>
        </div>
    </aside>
</div>
{/if}