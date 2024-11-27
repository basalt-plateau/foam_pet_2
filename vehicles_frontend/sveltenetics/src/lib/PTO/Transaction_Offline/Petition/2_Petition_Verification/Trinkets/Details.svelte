
<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Slang from '$lib/trinkets/Slang/Trinket.svelte'

</script>


<div class="card p-1 variant-filled-primary">
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="
						text-align: center;
						font-size: 1em;
						font-weight: bold;
					"
				>Details</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div class="card p-4">
					<p
						style="
							text-align: center;
						"
					>This is the <Slang text="transaction_petition"/> as a <b>bracket</b>.</p>
				
					<div style="height: 0.5cm"></div>
					
					<div
						style="
							text-align: center;
						"
					>
						<p>For the purpose of showing the bracket,</p>
						<p>each <b>Uint8Array</b> was adapted into a <b>hexadecimal</b>.</p>
						<p>and each <b>BigInt</b> was adapted into a <b>string</b>.</p>
					</div>
				
					<div style="height: 0.5cm"></div>
				
					<p
						style="
							text-align: center;
						"
					>
						<span>After making sure the <Slang text="transaction_petition" /> is good,<br/></span>
						<span>the <Slang text="transaction_petition" /> as a <b>barcode</b> can be scanned from the next panel.</span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>