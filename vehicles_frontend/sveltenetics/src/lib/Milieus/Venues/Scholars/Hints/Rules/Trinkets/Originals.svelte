



<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

export let rules_originals_link = ""

</script>



<div
	style="
		text-align: center;
	"
>
	<header
		style="
			font-size: 2em;
		"
	>Originals</header>
	
	<p>Original <Slang text="Town" /> foam is subject to these rules.</p>

	<div style="height: 0.5cm"></div>	
	
	<div class="card p-1 variant-filled-primary">
		<iframe
			src={ rules_originals_link }
			
			style="
				width: 100%;
				height: 25cm;
			"

			frameborder="0"
			title="Rules Index"
		>
		</iframe>
	</div>
</div>