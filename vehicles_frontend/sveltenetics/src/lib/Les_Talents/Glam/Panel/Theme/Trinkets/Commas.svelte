


<script>

////
//
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
import { onMount, onDestroy } from 'svelte'
//
//
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'
import { parse_with_commas } from '$lib/taverns/numbers/parse_with_commas'
//
////

let example_numeral = ""
const parse_example_numeral = () => {
	example_numeral = parse_with_commas ("12346578901234567890.0987654321")
}

let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
	
	parse_example_numeral ();
}


</script>



<div>
	<Seeds_Trucks on_change={ on_seeds_truck_change } />

	{#if seeds_trucks_prepared === "yes"}
	<div
		class="card p-4"
		style="
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
		"
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
			>Commas</header>
		</div>
		
		<p
			style="
				display: flex;
				justify-content: center;
				align-items: center;
				gap: 0.25cm;
			"
		>
			<span>Commas every</span>
			<RadioGroup>
				<RadioItem bind:group={ seeds_freight.commas_every } name="justify" value={3}>3</RadioItem>
				<RadioItem bind:group={ seeds_freight.commas_every } name="justify" value={4}>4</RadioItem>
				<RadioItem bind:group={ seeds_freight.commas_every } name="justify" value={5}>5</RadioItem>
			</RadioGroup>
			<span>digits.</span>	
		</p>
		
		<div style="height: 1cm"></div>
		
		<p>{ example_numeral }</p>
	</div>
	{/if}
</div>