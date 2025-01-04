
/*
	business: 
		The actual mode of the package that's sent.
	
	nurture: 
		For building, this has features that are being raised.
	location
	[ "nurture", "business" ]
	 
	import { check_roomies_truck } from '$lib/Versies/Trucks'
	const mode = check_roomies_truck ().freight.mode;
	{#if mode === "nurture" }
	{/if}
*/
export const ask_for_mode = () => {
	let mode = "business"
	if (typeof localStorage.mode === "string") {
		mode = localStorage.mode	
	}
	
	return mode;
}