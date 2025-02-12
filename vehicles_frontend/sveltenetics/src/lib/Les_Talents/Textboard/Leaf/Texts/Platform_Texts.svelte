
<script>

import Textboard_Truck_Ride from '$lib/Les_Talents/Textboard/Truck/Ride.svelte'
let TF = false;

</script>


<div monitor="platform texts">
	<Textboard_Truck_Ride on_change={ ({ pro_freight }) => { TF = pro_freight; } } />
	{#if typeof TF === "object" }
	{#each TF.info.texts as text }
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
				clicked={() => {}}
			/>
		</div>
		{/if}
		
		{#if TF.is_producer === "yup" }
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
				clicked={() => {}}
			/>
		</div>
		{/if}
	</div>
	{/each}
	
	{#if TF.info.texts.length === 0 }
	<p>There are zero texts about "{ TF.info.platform_name }".</p>
	{/if}
	{/if}
</div>
