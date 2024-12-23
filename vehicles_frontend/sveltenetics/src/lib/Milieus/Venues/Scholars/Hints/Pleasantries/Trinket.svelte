
<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'


</script>

<div class="card p-4">
	<div class="card p-2 variant-soft-surface">
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0.5cm 0;
				font-weight: bold;
			"
		>Pleasantries</header>
	</div>

	<div style="height: 0.25cm"></div>


	<div class="card p-4 variant-soft-surface">
		<p
			style="
				text-align: center;
			"
		>
			<span>Striving to amplify friendliness,</span> 
			<br />
			<span>literature with <b>jargon</b> can be found throughout.</span>
		</p>
		
		<div style="height: 0.25cm"></div>
		
		<p
			style="
				text-align: center;
			"
		>
			<span>The ambassador mode jargon cipher can be turned off at</span>
			<Milieus_Button
				name={ "Theme" }
				location={[ "Ecology", "Theme" ]}
				is_open_location={[ "Ecology", "Theme" ]}
			/>
		</p>
	</div>
</div>