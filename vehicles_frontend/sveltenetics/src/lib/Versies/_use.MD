

/*
	Should use: Trucks.svelte
*/


/*
	import { check_roomies_truck } from '$lib/Versies/Trucks'
	check_roomies_truck ().freight.dapp_network.net_path = ""
	check_roomies_truck ().freight.dapp_network.net_name = ""
*/


/*	
import { onMount, onDestroy } from 'svelte'
import { check_roomies_truck, monitor_roomies_truck } from '$lib/Versies/Trucks'

let Seeds_Trucks_Prepared = "no"
let Seeds_Trucks_Monitor;
let Seeds_Trucks_Freight;
onMount (async () => {
	const Truck = check_roomies_truck ()
	Seeds_Trucks_Freight = Truck.freight; 
	
	Seeds_Trucks_Monitor = monitor_roomies_truck ((_freight) => {
		Seeds_Trucks_Freight = _freight;
	})
	
	Seeds_Trucks_Prepared = "yes"
});

onDestroy (() => {
	Seeds_Trucks_Monitor.stop ()
}); 
*/


/*	
	import { ask_for_freight } from '$lib/Versies/Trucks'
	const freight = ask_for_freight ();
*/

/*	
	import { ask_for_freight } from '$lib/Versies/Trucks'
	const net_path = ask_for_freight ().net_path;
*/


/*
	import { check_roomies_truck } from '$lib/Versies/Trucks'
	const mode = check_roomies_truck ().freight.mode;
*/



