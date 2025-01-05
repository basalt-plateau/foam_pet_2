

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
////

import Address_Qualities_Trinket from '$lib/trinkets/Address_Qualities/Trinket.svelte'

let origin_address = {
	effective: "no",
	address_hexadecimal_string: "",
	exception: ""
}

const on_change = ({
	effective,
	address_hexadecimal_string,
	exception
}) => {
	origin_address.effective = effective;
	origin_address.address_hexadecimal_string = address_hexadecimal_string;
	origin_address.exception = exception;
}

//
// This is for electing the original value of the trinket.
//
//
let address_trinket = ""
const on_prepare = () => {
	address_trinket.change_address_hexadecimal_string ("")
}

	
let polytope_modal;

let to = "";
let amount = ""
const transfer = () => {
	/*
		2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD
	*/
	
	const EWF = Extension_Winch.freight ();
	EWF.prompt ({
		petition: {
			function: '0x1::coin::transfer',
			type_arguments: ['0x1::aptos_coin::AptosCoin'],
			arguments: [
				origin_address.address_hexadecimal_string,
				amount
			]
		}
	});
	
	console.info ("transfer", { to, amount });
}



let prepared = "no"
const on_polytope_2_prepare = () => {
	prepared = "yes"
}


</script>


<Polytope_2 
	bind:this={ polytope_modal }
	on_prepare={ on_polytope_2_prepare }
>
	<div 
		slot="leaves"
		style="
			height: 100%;
			width: 100%;
		"
	>
		{#if prepared === "yes" }
		<div
			style="
				box-sizing: border-box;
				height: 100%;
				width: 100%;
				
				padding: 1cm;
			"
		>
			<header
				style="
					font-size: 3em;
				"
			>APT Passes</header>
		
			<div 
				style="
					width: 100%;
				"
				class="card p-4"
			>
				<header
					style="
						font-size: 1.5em;
						text-align: center;
					"
				>Transfer APT</header>
				
				<div 
					style="
						width: 100%;
					"
					class="card p-4"
				>
					<Address_Qualities_Trinket 
						name="Origin Address"
					
						bind:this={ address_trinket }
						
						on_change={ on_change }
						on_prepare={ on_prepare }
					/>
				</div>
				
				<div style="height: 0.25cm" />
				
				<div 
					style="
						width: 100%;
					"
					class="card p-4"
				>
					<label 
						style="
							display: flex;
							justify-content: center;
							align-items: center;
							gap: 0.25cm;
						"
						class="label"
					>
						<span
							style="
								min-width: 2cm;
							"
						>Amount</span>
						<input
							bind:value={ amount }
							style="
								padding: 0.25cm;
							"
							class="input" 
							type="text" 
							placeholder="Amount" 
						/>
					</label>
				</div>
				
				<div
					style="
						display: flex;
						justify-content: right;
						align-items: center;
						gap: 0.25cm;
						
						padding: 0.25cm 0;
					"
				>
					<button 
						on:click={ transfer }
						type="button" 
						style="
							padding: 0.25cm 2cm;
							display: flex;
							flex-direction: column;
						"
						class="btn variant-filled"
					>
						<p>Transfer</p>
						<p style="font-size: 0.75em">(this requires a gas fee)</p>
					</button>
				</div>
			</div>
			
				
		</div>
		{/if}
		
		<div style="height: 12cm" />	
	</div>
</Polytope_2>