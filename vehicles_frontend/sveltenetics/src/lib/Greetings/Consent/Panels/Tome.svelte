



<script>

import { check_roomies_truck } from '$lib/Versies/Trucks'
import Panel from '$lib/trinkets/panel/trinket.svelte'

import APT_Entrust_Consent_Opener from '$lib/Les_Talents/APT_Entrust_Mode_1/Loyals_Frontier/Board.svelte'

import { parse_styles } from '$lib/trinkets/styles/parse'

export const trends = {
	panel: {
		position: 'relative',
		display: 'inline-flex',
		//'width': '33%', 
		'height': '200px',
		'align-items': 'center',
		'justify-content': 'center',
		'flex-direction': 'column',
		
		'border-radius': '50px'
	}
}

const Les_Talents = [
	{
		"Frontier": APT_Entrust_Consent_Opener,
		"Mode": "business"
	}
]

const mode = check_roomies_truck ().freight.mode;

</script>


<div>
	<section
		quests_address
		
		monitor="talents_list"
		
		style={ parse_styles ({
			position: 'relative',
			display: 'grid',
			'width': '100%',
			'margin': '0 auto',
			
			// 'grid-template-columns': 'repeat(auto-fit, minmax(500px, 1fr))',
			'grid-template-columns': 'repeat(auto-fit, minmax(100px, 500px))',
			'grid-gap': '10px',
			'justify-content': 'center',
			
			'padding-bottom': '1cm'
		}) }
	>
		{#each Les_Talents as Le_Talent }
		{#if mode === "business" && Le_Talent.Mode !== "business" }
		
		{:else}
		<Panel 
			styles={
				Object.assign ({}, trends.panel, {
					...(Le_Talent.Mode !== "business" ? {
						border: '20px solid rgb(var(--color-warning-500))'
					} : {})
				}) 
			}
		>		
			<svelte:component this={ Le_Talent.Frontier }  />
			{#if Le_Talent.Mode === "nurture"}
			<div style="height: 0.25cm" />
			<div class="card" style="padding: 0.1cm 0.5cm">
				<p>{ Le_Talent.Mode }</p>
			</div>
			{/if}
		</Panel>
		{/if}
		{/each}
	</section>
</div>