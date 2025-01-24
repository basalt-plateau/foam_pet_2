






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
//
////
	

let the_panel = 1
	
let linux_x86 = {
	"8_0_0_0": {
		"foam": {
			"link": "https://github.com/Planet-IV/Mech_Pet/releases/download/publication_v8_0_0_0/Foam_Pet.linux-x86_64.v8_0_0_0.zip",
			"name": "Adopt (Save to OS)"
		},
		"rules": {
			"link": "https://github.com/Planet-IV/Mech_Pet/releases/download/publication_v8_0_0_0/Foam_Pet.linux-x86_64.v8_0_0_0.Rules.zip",
			"name": "Save Rules to OS"
		}
	}
}	

let le_dapp = linux_x86 ["8_0_0_0"];

const releases = "https://github.com/Planet-IV/Mech_Pet/releases"
	
</script>



<div
	class="card p-2"
	style="
		width: 100%;
	"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="
						padding: 0.25cm;
						font-size: 2em;
						text-align: center;
					"
				>Linux Dapp</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div class="card p-4">
					<p
						style="
							text-align: center;
						"
					>The latest Linux dapp can be found here:</p>
				
				
					<p
						style="
							text-align: center;
						"
					>
						<a 
							href={ releases } 
							target="_blank" 
							class="anchor"
							style="
								text-decoration: none;
							"
						>
							<span>{ releases }</span>
						</a>	
					</p>
				</div>
			
				<div class="card p-4">
					<header
						style="text-align: center"
					>
						<span class="badge variant-primary-filled">Version 8_0_0_0</span>
					</header>
				
					<div style="height: 1cm"></div>
				
					<p
						style="
							text-align: center;
						"
					>This is a <Slang text="pet" /> that can ride on a Linux <Slang text="Machine" /> that has an x86_64 processor.</p>
					<p
						style="
							text-align: center;
						"
					>The "rules" can be retrieved before adopting.</p>
				
					<div style="height: 1cm"></div>
				
					<p
						style="
							text-align: center;
						"
					>
						<a 
							href={ linux_x86 ["8_0_0_0"] ["rules"] ["link"] } 
							target="_blank" 
							class="btn variant-filled"
							style="
								text-decoration: none;
							"
						>
							<span>{ linux_x86 ["8_0_0_0"] ["rules"] ["name"] }</span>
						</a>	
					</p>
				
	
					<div style="height: 0.5cm"></div>
	
					<p
						style="
							text-align: center;
						"
					>
						<a 
							href={ linux_x86 ["8_0_0_0"] ["foam"] ["link"] } 
							target="_blank" 
							class="btn variant-filled"
							style="
								text-decoration: none;
							"
						>
							<span>{ linux_x86 ["8_0_0_0"] ["foam"] ["name"] }</span>
						</a>	
					</p>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>