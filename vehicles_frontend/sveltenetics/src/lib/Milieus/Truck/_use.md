









import Milieus_Truck from '$lib/Milieus/Truck/Trinket.svelte'
	
<Milieus_Trucks on_change={ on_Milieus_truck_change }/>
{#if Milieus_trucks_prepared === "yes"}
	
{/if}


let Milieus_freight = {}
let Milieus_trucks_prepared = "no"
const on_Milieus_truck_change = ({ freight: _freight, happening }) => {
	Milieus_freight = _freight;
	if (happening === "mounted") {
		Milieus_trucks_prepared = "yes"
	}
}


