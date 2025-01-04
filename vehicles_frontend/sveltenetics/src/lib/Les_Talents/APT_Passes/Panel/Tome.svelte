

<script>


	


////
//
//
import Polytope_2 from '$lib/trinkets/Polytope_2/Tome.svelte'
import * as Extension_Winch from "$lib/Singles/Extension_Winch"	
//
////


let polytope_modal;

let to = "";
let amount = ""
const transfer = () => {
	// const EWF = Extension_Winch.freight ();
	// EWF.prompt ();
	
	console.info ("transfer", { to, amount });
}



let prepared = "no"
const on_prepare = () => {
	prepared = "yes"
}


</script>


<Polytope_2 
	bind:this={ polytope_modal }
	on_prepare={ on_prepare }
>
	<div slot="leaves"
		style="
			height: 100%;
			width: 100%;
			
			display: flex;
			justify-content: center;
			align-items: center;
		"
	>
		{#if prepared === "yes" }
		<div
			style="
				box-sizing: border-box;
				height: 100%;
				width: 100%;
				
				padding: 1cm;
				
				display: flex;
				justify-content: center;
				align-items: center;
				
				flex-direction: column;
				
				gap: 0.5cm;
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
					>To</span>
					<input
						bind:value={ to }
						style="
							padding: 0.25cm;
						"
						class="input" 
						type="text" 
						placeholder="To" 
					/>
				</label>
				
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
						"
						class="btn variant-filled"
					>Transfer</button>
				</div>
			</div>
		</div>
		{/if}
	</div>
</Polytope_2>