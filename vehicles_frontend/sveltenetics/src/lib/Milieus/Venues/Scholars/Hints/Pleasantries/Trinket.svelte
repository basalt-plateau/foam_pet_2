
<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
import Glam_Frontier from "$lib/Les_Talents/Glam/Frontier/Tome.svelte"

</script>

<div class="card p-4">
	<div class="card p-4 variant-soft-surface">
		<p
			style="
				text-align: center;
			"
		>
			<span>Codexes with an <b>Eclecticism</b> cipher can be found throughout.</span>
		</p>
		
		<div style="height: 0.25cm"></div>
		
		<p
			style="
				text-align: center;
			"
		>
			<!-- ambassador mode -->
			<!-- finesse, thematicism, eccentric, surrealism, aestheticism -->
		
			<span>This can be turned off at</span>
			
			<Glam_Frontier 
				style={{ 
					display: 'inline-block',
					padding: '0.25cm 1cm'
				}}
			/>
			
		</p>
	</div>
</div>