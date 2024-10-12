



<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'


</script>

<svelte:head>
	<title>Loyals, Hints</title>
	<meta name="description" content="About this app" />
</svelte:head>



<div
	class="card variant-soft p-2"
	style="
		width: 100%;
	"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="
						text-align: center;
						font-size: 1.8em;
					"
				>3. Running a Docker Image</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<div style="height: 0.5cm"></div>

					<div class="card variant-soft p-4">
						<p>
							<span>The Docker Image installation tutorial can be found with the images on Github.</span>
						</p>
						<p>
							<a 
								href="https://github.com/basalt-plateau/foam_pet_docker_images/releases" 
								target="_blank" 
								class="anchor"
							>
								<span>https://github.com/basalt-plateau/foam_pet_docker_images/releases</span>
							</a>	
						</p>
					</div>
					
					<div style="height: 0.5cm"></div>
				</div>			
			</svelte:fragment>
		</AccordionItem>
	</Accordion>	
</div>
