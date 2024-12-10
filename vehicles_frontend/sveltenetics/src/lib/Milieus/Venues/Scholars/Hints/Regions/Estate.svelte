


<script>
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Slang from '$lib/trinkets/Slang/Trinket.svelte'


</script>

<div class="card p-4">
	<header 
		style="
			font-size: 2em; 
			text-align: center;
			padding: 0cm 0;
		"
	>Regions</header>
	
	<div style="height: 0.5cm" ></div>
	<hr class="!border-t-2" />
	<div style="height: 0.5cm" ></div>
	
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header 
					style="
						font-size: 1.5em; 
						text-align: center;
						padding: 0cm 0;
					"
				>Scholars</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<p
						style="font-size: 1em; text-align: center"
					>	
						<span>The <b>Scholars</b> region has features that affect the local browser.</span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header 
					style="
						font-size: 1.5em; 
						text-align: center;
						padding: 0cm 0;
					"
				>Loyals</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<p
						style="font-size: 1em; text-align: center"
					>	
						<span>The <b>Loyals</b> region should be used on a <Slang text="Offline Machine" /></span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header 
					style="
						font-size: 1.5em; 
						text-align: center;
						padding: 0cm 0;
					"
				>Friends</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<p
						style="font-size: 1em; text-align: center"
					>	
						<span>The <b>Friends</b> region should be used on a <Slang text="Online Machine" /></span>
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>


