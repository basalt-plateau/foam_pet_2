

<script>

import Petition_APT_Button from "$lib/Singles/Extension_Winch/Petition/APT_Button.svelte"
import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
let Textboard_Freight = false

export let le_texts = []
export let le_textboard = ""
export let searching_for_texts = ""

let le_text = ""
let on_send = () => {}

let petition_APT_button = "";

</script>

<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { Textboard_Freight = pro_freight; } } />
{#if typeof Textboard_Freight === "object"}
<div
	style="
		position: relative;
		height: 100%;
		width: 100%;
	"
	class="card p-2 variant-soft-surface"
>
	{#if searching_for_texts === "yup" }
	<div
		transition:fade={{
			duration: 1000
		}}
		style="
			position: absolute;
			top: 10px;
			left: 10px;
			height: calc(100% - 20px);
			width: calc(100% - 20px);
			border-radius: 8px;
		"
	>
		<Progress_Wall show={ "yes" } />
	</div>
	{/if}
	
	<div>
		{#if Versies_Freight.is_producer === "yup" }
		<div
			style="
				display: grid;
				gap: 0.1cm;
				grid-template-columns: repeat(auto-fit, minmax(10cm, 1fr));
			"
		>
			<Petition_APT_Button
				onMount={({ mode }) => {
					mode ("on");
				}}
				button_text={ `Delete "${ le_textboard }" as Producer` }
				APT="0"
				clicked={() => {
					
				}}
			/>
			<Petition_APT_Button
				onMount={({ mode }) => {
					mode ("on");
				}}
				button_text={ `Pause "${ le_textboard }" as Producer` }
				APT="0"
				clicked={() => {
					
				}}
			/>
		</div>
		{/if}
	</div>
	
	<div>
		{#each le_texts as text }
		<div
			style="
				display: flex;
				flex-direction: column;
				gap: 0.1cm;
			"
			class="card p-2 variant-soft-surface"
		>	
			<div 
				style="
					display: flex;
					justify-content: space-between;
				"
				class="card p-2"
			>
				<p>{ text.text }</p>
				
				
			</div>
			<div
				style="
					display: flex;
					justify-content: center;
					gap: 0.1cm;
				"
			>
				<span 
					style="
						border-radius: var(--theme-rounded-base);
						padding: 0.05cm 0.2cm;
						word-break: break-all;
					"
					class="variant-soft-surface"
				>{ text.writer_address }</span>
				
				<div
					style="
						display: flex;
						align-items: center;
						border-radius: var(--theme-rounded-base);
						padding: 0.05cm 0.2cm;
					"
					class="variant-soft-surface"
				>
					<img src="/_Licensed/Aptos/aptos.png" style="width: 0.5cm; height: 0.5cm;">
					<span 
						style="
							border-radius: var(--theme-rounded-base);
							padding: 0 0.25cm;
						"
						
					>{ text.writer_balance }</span>
				</div>
			</div>
			
			{#if text.writer_address === account_address }
			<div
				style="
					display: flex;
					justify-content: space-between;
					gap: 0.1cm;
				"
			>
				<div></div>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text="Delete Text"
					APT="0"
					clicked={() => {
						
					}}
				/>
			</div>
			{/if}
			
			{#if Versies_Freight.is_producer === "yup" }
			<div
				style="
					display: flex;
					justify-content: space-between;
					gap: 0.1cm;
				"
				class="card p-2 variant-filled-surface"
			>
				<input 
					style="
						text-indent: 0.1cm;
					"
					class="input" 
					type="text" 
					placeholder="Refund" 
				/>
				<Petition_APT_Button
					onMount={({ mode }) => {
						mode ("on");
					}}
					button_text="Delete Text as Producer"
					APT="0"
					clicked={() => {
						
					}}
				/>
			</div>
			{/if}
		</div>
		{/each}
		
		{#if le_texts.length === 0 }
		<p>There are zero texts about "{ le_textboard }".</p>
		{/if}
	</div>
	
	<div
		style="
			position: relative;
		
			display: flex;
			border-radius: 4px;
			justify-content: right;
			flex-direction: column;
			
			gap: 0.1cm;
		"
		class="card p-4 variant-soft-surface"
	>
		<textarea
			bind:value={ le_text }
			style="
				width: 100%;
			"
			class="textarea p-1"
		></textarea>
		
		<div
			style="
				border-radius: 4px;
				width: 100%;
			"
		>	
			<Petition_APT_Button
				bind:this={ petition_APT_button }
				
				onMount={() => {
					petition_APT_button.mode ("off");
				}}
			
				button_text={ 
					`Write or overwrite on "${ le_textboard }"` 
				}
				
				APT="1"
				clicked={ on_send }
			/>
		</div>
	</div>
</div>
{/if}