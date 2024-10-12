


<script>


////
///
//
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
import { onMount, onDestroy } from 'svelte';

//
//\
//\\

import { 
	refresh_truck, 
	retrieve_truck, 
	monitor_truck,
} from '$lib/Les_Talents/APT_Entrust_Mode_1/Friends_Panel/Logistics/Truck'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 

let prepared = "no"
let Truck_Monitor;
let freight;
onMount (async () => {
	const Truck = retrieve_truck ()
	freight = Truck.freight; 
	
	freight.current_land = "Transaction_Signature"
	
	Truck_Monitor = monitor_truck ((_freight) => {
		freight = _freight;
	})
	
	prepared = "yes"
});

onDestroy (() => {
	Truck_Monitor.stop ()
});

let current_show = 0;

</script>

{#if prepared === "yes"}
{#if freight.transaction_signature.hexadecimal_string.length == 0 }
<div
	style="
		padding: 50px
	"
>
	<p>The signature was not added.</p>
</div>
{:else}
<div monitor="signature verification leaf">
	<div
		style="
			text-align: center;
			padding: 0.25cm 0;
		"
	>
		<header
			style="
				text-align: center;
				font-size: 2em;
				padding: .2cm 0;
			"
		>Signature Verfication</header>
		<p>This Signature should be the same as the one that was created on the other trinket.</p>
	</div>
	
	<div
		style="
			text-align: center;
		"
	>
		<RadioGroup>
			<RadioItem bind:group={ current_show } name="justify" value={0}>
				<span monitor="bracket pad">Bracket</span>
			</RadioItem>
			<RadioItem bind:group={ current_show } name="justify" value={1}>
				<span monitor="hexadecimal pad">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>

	<div style="padding: 0.25cm 0" ></div>

	<div>
		{#if current_show === 0}
		<div monitor="signature bracket panel">
			<Code_Wall
				text={ freight.transaction_signature.Aptos_object_fiberized }
			/>
		</div>
		{:else if current_show === 1}
		<div monitor="signature hexadecimal panel">
			<Code_Wall
				text={ freight.transaction_signature.hexadecimal_string }
			/>
		</div>
		{/if}
	</div>
</div>
{/if}
{/if}