




<script>


////
//
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';
import { TreeView, TreeViewItem, RecursiveTreeView } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';
//
//
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
//
import Building_Docker_Image from './Trinkets/Building_Docker_Image/Trinket.svelte'
import Docker_Image_Pull from './Trinkets/Docker_Image_Pull/Trinket.svelte'
import Building_Keys_Beacon from './Trinkets/Building_Keys_Beacon/Trinket.svelte'
import Preparing_Offline_Machine from './Trinkets/Preparing_Offline_Machine/Trinket.svelte'
//
import Running_Docker_Image_1_0_0 from './Trinkets/Running_Docker_Image_1_0_0/Trinket.svelte'
//
////
	

let the_panel = 1
	
</script>



<div
	class="card p-2"
	style="
		width: 100%;
	"
>
	<Accordion>
		<AccordionItem open>
			<svelte:fragment slot="summary">
				<header
					style="
						padding: 0.25cm;
						font-size: 2em;
						text-align: center;
					"
				>Offline Wallet with Docker</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div style="text-align: center; font-size: 1.2em">
					<div style="height: 1cm"></div>
	
					<p style="text-align: center; font-size: 1.2em">
						<span><Slang text="Pets" /> can live entirely offline with docker.</span>
					</p>
					<p style="text-align: center; font-size: 1.2em">
						<a class="anchor" target="_blank" href="https://docker.com">https://docker.com</a>
					</p>

					<div style="height: 1cm"></div>

					<p style="text-align: center">
						<b>Docker Containers</b> are operating systems that exist within another OS.
					</p>
					
					<div style="height: 0cm"></div>

					<p style="text-align: center">
						A <b>Docker Container</b> can be created from a <b>Docker Image</b>.
					</p>

					<div style="height: 1cm"></div>

					<p style="text-align: center">
						These are the steps necessary to run an offline wallet with Docker.
					</p>
				</div>
				<div>
					<div style="height: 1cm"></div>

					<Preparing_Offline_Machine />
					
					<div style="height: 0.5cm"></div>

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
									>2. Opening a Docker Image</header>
								</svelte:fragment>
								<svelte:fragment slot="content">
									<div>
										<div style="height: 1cm"></div>
					
										<p
											style="
												text-align: center;
												line-height: 1.8em;
											"
										>A <Slang text="Pet" /> Docker image can be sent from<br /> <Slang text="Online Machine" /> to <Slang text="Offline Machine" /> with USB storage hardwear.</p>
									
										<div style="height: 0.5cm"></div>
									
										<p
											style="
												text-align: center;
											"
										>Using a prebuilt image is easier.</p>
									
										<div style="height: 0.5cm"></div>	
										<hr class="!border-t-2" />
										<div style="height: 0.5cm"></div>	
									
										<div
											style="
												text-align: center;
											"
										>
											<RadioGroup>
												<RadioItem bind:group={the_panel} name="justify" value={1}>
													<span>Prebuilt</span>
												</RadioItem>
												<RadioItem bind:group={the_panel} name="justify" value={0}>
													<span>Custom Image</span>
												</RadioItem>
											</RadioGroup>
										</div>
										
										<div
											style=""
										>
										{#if the_panel === 0}
											<Building_Docker_Image />
										{:else if the_panel === 1}
											<Docker_Image_Pull />
										{/if}
										</div>
									</div>								
								</svelte:fragment>
							</AccordionItem>
						</Accordion>
					</div>
					<div style="height: 2cm"></div>
					
					<!-- <div style="height: 0.5cm"></div>
					<Building_Keys_Beacon />
					<div style="height: 1cm"></div> -->
					
					
					<div
						style="
							display: none;
						"
					>
						<hr class="!border-t-2" />
						<div style="height: 0.1cm"></div>
						<hr class="!border-t-2" />
						<div style="height: 1cm"></div>

						<p style="text-align: center">These are the tutorials for running various versions.</p>

						<div style="height: 0.5cm"></div>

						<Running_Docker_Image_1_0_0 />
						
						<div style="height: 1cm"></div>
					</div>
					
				</div>
				
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
	
	
</div>