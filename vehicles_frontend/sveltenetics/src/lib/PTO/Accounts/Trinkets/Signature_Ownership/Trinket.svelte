

<script>
	
	import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
	
	import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	import { parse_styles } from '$lib/trinkets/styles/parse.js';

/*
	Legitimacy
	Dynasty
	Ownership

*/

</script>

<div
	class="card p-2 variant-filled-primary"
	style="
		word-wrap: break-word;
	"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="{parse_styles ({
						'display': 'block',
						'text-align': 'center',
						'font-size': '2em',
						'padding': '0.2cm',
					})}"
				>
					Legitimacy
				</header>
			</svelte:fragment>
			<svelte:fragment slot="content">				
				<div>				
					<p>
						<span><Slang text="Private Keys" /> and <Slang text="Addresses" /> can't necessarily be claimed or owned.</span>
						<br />
						<span>Although mathematically unlikely, someone else might coincidentally choose the same <Slang text="Private Key" />.</span>
					</p>
					
					<div style="height: 0.5cm"></div>
					
					<p>
						<span>If someone chooses the same <Slang text="Private Key" />, 
						<span>they might feel like the <Slang text="Account" /> is there's to do with as they please.</span>
					</p>
					
					<div style="height: 0.5cm"></div>
					
					<p>
						<span>Therefore, it's very important to keep your <Slang text="Private Key" /> obscure.</span> 
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>


</div>