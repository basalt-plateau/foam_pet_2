

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'

	
//
////


	
let polytope_2_modal;
let polytope_2_prepared = "no"

//
// This is for electing the original value of the trinket.
//
//
let address_trinket_1 = ""
let address_trinket_2 = ""


</script>


<Polytope_2 
	bind:this={ polytope_2_modal }
	on_prepare={() => {
		polytope_2_prepared = "yes"
	}}
	style={{
		width: "100vw",
		height: "100vh"
	}}
>
	{#if polytope_2_prepared === "yes" }
	<div>
		<div 
			style="
				text-align: center;
				
				display: flex;
				flex-direction: column;
				
				gap: 0.25cm;
			"
			class="card p-4"
		>
			<p>The <Slang text="Label" /> team can be reached here:</p>
			<a class="anchor" href="https://github.com/Planet-IV/Mech_Pet/pulls">https://github.com/Planet-IV/Mech_Pet/pulls</a>
			<a class="anchor" href="https://github.com/Planet-IV/Mech_Pet/issues">https://github.com/Planet-IV/Mech_Pet/issues</a>
		</div>
	</div>
	
	<div
		style="
			margin: 1cm auto;
			max-width: 30cm;
			width: 100%;
			display: none;
		"
		class="card p-2"
	>
		<div
			style="
				padding: 1cm;
				text-align: center;
				font-size: 1.5em;
			"
		>
			<Slang text="Label" /> Aptos Mainnet Addresses
		</div>
		<div class="card p-2">
			<Address_Qualities_Trinket 
				name="Address 1"
				bind:this={ address_trinket_1 }
				has_field="no"
				on_prepare={() => {
					address_trinket_1.change_address_hexadecimal_string (
						"652B8D45AEBC4237CB4A4CA1D8B99725D8F973676844FE85EB09286D7F9D3808"
					);
				}}
			/>
		</div>
		<div class="card p-2">
			<Address_Qualities_Trinket 
				name="Address 2"
				bind:this={ address_trinket_2 }
				has_field="no"
				on_prepare={() => {
					address_trinket_2.change_address_hexadecimal_string (
						"AF545705EC7DBC1630376FD22313C973E5E8A4EDD51343A1DDD05353E72FD5BF"
					);
				}}
			/>
		</div>
	</div>
	{/if}
</Polytope_2>