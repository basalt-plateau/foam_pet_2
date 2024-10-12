



//
//	This is the +layout mount
//	This is the app level storage.
//
import { onMount, onDestroy } from 'svelte'
import { lease_Milieus_truck, give_back_Milieus_truck } from '$lib/Milieus/Truck'

let Milieus_truck_prepared = "no"

onMount (async () => {
	lease_Milieus_truck ()
	Milieus_truck_prepared = "yes"
})
onDestroy (async () => {
	give_back_Milieus_truck ()
	Milieus_truck_prepared = "no"
})