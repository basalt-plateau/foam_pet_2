

<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import Slang from '$lib/trinkets/Slang/Trinket.svelte'

</script>


<div
	class="card p-4"
	style="
		width: 100%;
	"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="
						font-size: 2em;
						text-align: center;
					"
				>
					<Slang text="Machines" /> Hints
				</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<div style="height: 0.5cm"></div>
				
					<p style="text-align: center">
						<Slang text="Machines" /> is another name for laptop, desktop, computer, etc.
					</p>

					<div style="height: 0.5cm"></div>
					
					<div
						class="card variant-soft p-4"
					>
						<header
							style="
								font-size: 1.5em;
								font-weight: bold;
								text-align: center;
							"
						><Slang text="Online Machine" /></header>

						<div style="height: 0.2cm"></div>
						
						<hr class="!border-t-4" />
						
						<div style="height: 0.2cm"></div>			
						
						<p
							style="
								text-align: center;
							"
						>
							<span><Slang text="Online Machine" /> should be connected to the public lattices,<br /></span>
							<span>such as ethernet, wifi, bluetooth, NFC, towers, satellites, etc.</span>
						</p>
						
						<div style="height: 0.25cm"></div>

						<hr class="!border-t-2" />

						<div style="height: 0.25cm"></div>
						
						<p
							style="
								text-align: center;
							"
						>This is where <Slang text="Aptos" /> <Slang text="Transactions" /> are formulated.</p>
					</div>

					<div style="height: 0.5cm"></div>

					<div class="card variant-soft p-4">
						<header
							style="
								font-size: 1.5em;
								font-weight: bold;
								text-align: center;
							"
						><Slang text="Offline Machine" /></header>

						<div style="height: 0.2cm"></div>
						
						<hr class="!border-t-4" />
						
						<div style="height: 0.2cm"></div>
						
						
						<p
							style="
								text-align: center;
								display: block;
							"
						>A <Slang text="Offline Machine" /> should not be connected to public lattices, <br/>except with restrictive communications such as:</p>
						
						<div style="height: 0.2cm"></div>
						
						<p
							style="
								text-align: center;
							"
						><b>QR Code Picture</b> to <b>QR Code Scan</b></p>
						
						<div style="height: 0.2cm"></div>
						
						<p
							style="
								text-align: center;
							"
						><b>Sound</b> to <b>Microphone</b></p>
						
						<div style="height: 0.25cm"></div>
						
						<hr class="!border-t-2" />

						<div style="height: 0.25cm"></div>

						<p>
							<span
								style="
									display: block;
									text-align: center;
								"
							><Slang text="Offline Machine" /> might need to be connected to the internet during the preliminary installation.</span>

							<span
								style="
									display: block;
									text-align: center;
								"
							>If this is the mode, OS modifications should happen on a fresh drive, and then the previous drive should be wiped on another <Slang text="Offline Machine" />.<span>
						</p>
						
						<div style="height: 0.25cm"></div>

						<hr class="!border-t-2" />
						
						<div style="height: 0.25cm"></div>

						<p
							style="
								text-align: center;
							"
						>This is where <Slang text="Aptos" /> <Slang text="Private Keys" /> should be choosen,</p>
						<p
							style="
								text-align: center;
							"
						>and where <Slang text="Aptos" /> <Slang text="Petitions" /> should be signed.</p>
					</div>
				</div>
			</svelte:fragment>
		</AccordionItem>
	</Accordion>
</div>