
<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'


</script>

<div class="card p-4">
	<div class="card p-4 variant-soft-surface">
		<p
			style="
				text-align: center;
			"
		>
			<span>Codexes with <b>Eclecticism</b> can be found throughout.</span>
		</p>
		
		<div style="height: 0.25cm"></div>
		
		<p
			style="
				text-align: center;
			"
		>
			<!-- ambassador mode -->
			<!-- finesse, thematicism, eccentric, surrealism, aestheticism -->
		
			<span>The <b>Eclecticism</b> cipher can be turned off at</span>
			<Milieus_Button
				name={ "Beauty" }
				location={[ "Ecology", "Theme" ]}
				is_open_location={[ "Ecology", "Theme" ]}
			/>
		</p>
	</div>
</div>