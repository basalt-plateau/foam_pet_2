

<script>
	
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import { parse_styles } from '$lib/trinkets/styles/parse.js';

</script>

<div
	style="
		word-wrap: break-word;
	"
	class="card p-0 variant-soft-surface"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="{parse_styles ({
						'display': 'block',
						'text-align': 'center',
						'font-size': '1.5em',
						'padding': '0cm',
					})}"
				>
					<Slang text="Private Key" /> Math
				</header>
			</svelte:fragment>
			<svelte:fragment slot="content">				
				<div>
					<p>
						<span>Calculating a <Slang text="Private Key" /> from a <Slang text="Public Key" /> or <Slang text="Address" /> is theoretically possible.</span>
					</p>
					<p>
						<span>However, a reversal has probably never been accomplished.</span>
					</p>
					
					<div style="height: 0.2cm"></div>
					
					<p>
						<span>The algorithms are essentially built to be as irreversible as time.</span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>


</div>