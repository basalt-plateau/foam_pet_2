

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
////


</script>


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
				>1. Preparing an Offline Machine</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<div style="height: 0.5cm"></div>

					<p
						style="
							text-align: center;
						"
					>To prepare, the <Slang text="Offline Machine" /> needs to be connected to the internet.</p>
					
					<div style="height: 0.5cm"></div>
					
					<p
						style="
							text-align: center;
						"
					>After preparation, the <Slang text="Offline Machine" /> should never be connected to the internet again<br /> unless the OS drive is wiped.</p>
					
					<div style="height: 0.5cm"></div>
					
					<p
						style="
							text-align: center;
						"
					><b>Ubuntu</b> is a good choice for the OS of the <Slang text="Offline Machine" />.</p>
					
					<p
						style="
							text-align: center;
						"
					>
						<a 
							class="anchor" 
							href="https://ubuntu.com/download"
							target="_blank"
						>https://ubuntu.com/download</a>
					</p>
					
					<div style="height: 0.5cm"></div>
					
					<hr />
					
					<div style="height: 0.5cm"></div>

					<header>From the Offline Machine, while connected to the internet</header>

					<div style="height: 0.5cm"></div>

					<div class="card variant-soft p-4">
						<p>
							<span>Install the Docker Engine</span>
							<a 
								class="anchor" 
								href="https://docs.docker.com/engine/install/"
								target="_blank"
							>https://docs.docker.com/engine/install/</a>
						</p>
					</div>
					
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>
							<span>Install any other softwhere necessary.</span>
						</p>
					</div>
					
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>
							<span>Disconnect the <Slang text="Offine Machine" /> from the internet (wifi), bluetooth, NFC, etc..</span>
						</p>
					</div>


					<div style="height: 0.5cm"></div>
				</div>								
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>