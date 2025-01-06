

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
//
////
import Net_Choices_with_Text from '$lib/PTO/Nets/Choices_with_Text/Trinket.svelte'
import Versies_Truck from '$lib/Versies/Trucks.svelte'
let Versies_Freight = false
	
	


let polytope_2_modal;
let polytope_2_prepared = "no"


</script>


<Polytope_2 
	bind:this={ polytope_2_modal }
	on_prepare={() => {
		console.log ("on prepare dapp network");
		polytope_2_prepared = "yes"
	}}
>
	<Versies_Truck on_change={ ({ freight }) => { Versies_Freight = freight } } />
	{#if typeof Versies_Freight === "object" && polytope_2_prepared === "yes" }
	<Net_Choices_with_Text 
		prepare={() => {
			console.log ("net choices with text prepared", {
				name: Versies_Freight.net_name,
				path: Versies_Freight.net_path
			})
			
			return {
				net_name: Versies_Freight.dapp_network.net_name
			}
		}}
		every_enhance={({
			net_name,
			net_path,
			chain_id
		}) => {
			console.info ("every_enhance:", {
				net_name,
				net_path,
				chain_id
			});

			Versies_Freight.dapp_network.net_name = net_name;
			Versies_Freight.dapp_network.net_path = net_path;
			Versies_Freight.dapp_network.chain_id = chain_id;
		}}
	/>
	{/if}
</Polytope_2>