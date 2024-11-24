
<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'


</script>

<div class="card p-4">
	<header 
		style="
			font-size: 2em; 
			text-align: center;
			padding: 0.5cm 0;
		"
	>Pleasantries</header>
	<p
		style="
			text-align: center;
		"
	>
		<span>Striving to amplify friendliness,</span> 
		<br />
		<span>literature with slang can be found throughout.</span>
	</p>
	
	<div style="height: 0.25cm"></div>
	
	<p
		style="
			text-align: center;
		"
	>
		<span>The slang cipher can be turned off at</span>
		<Milieus_Button
			name={ "Theme" }
			location={[ "Scholars", "Theme" ]}
			is_open_location={[ "Scholars", "Theme" ]}
		/>
	</p>
	
	<div style="height: 1cm"></div>
</div>