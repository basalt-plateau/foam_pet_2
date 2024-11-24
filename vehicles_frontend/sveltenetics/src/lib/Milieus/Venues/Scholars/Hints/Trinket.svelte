

<script>


////
//
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
import { Modal, getModalStore } from '@skeletonlabs/skeleton';
//
//
import { open_rules } from '$lib/Milieus/Venues/Scholars/Hints/Rules/open'
//
import Panel from '$lib/trinkets/panel/trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Caution from '$lib/trinkets/_Caution/Trinket.svelte'
//
import Offline_Signing_Hints from '$lib/trinkets/Hints/Offline_Signing/Trinket.svelte'
import Beacons from '$lib/trinkets/Hints/Beacons/Trinket.svelte'
//
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Slang_Cipher from '$lib/trinkets/Slang/Cipher.svelte'
import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'
//
import Taxonomy from '$lib/trinkets/Taxonomy/Pet.svelte'
import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'
//
//
import Getting_Moving from './Getting_Moving/Trinket.svelte'
import Preparation_Tutorial from './Preparation_Tutorial/Trinket.svelte'
//
////
import Boards from './Boards/Trinket.svelte'
import Mural from './Mural/Trinket.svelte'


const modal_store = getModalStore ();
	

	
////
//
const tutorial_2 = '/pictures/tutorial_2.svg';
const machines_picture = '/pictures/machines.svg';
const pets = '/pictures/Foam_pet.svg';
const pet = '/pictures/Foam_Pet_0001.svg';
const pet_2 = '/pictures/Foam_Pet_0002.svg';
//
////

const mode = check_roomies_truck ().freight.mode;		

/*
let seeds_name = (
	"পণ্ডিত"
)
*/

let tamil_seeds = {
	name: (
		"அறிஞர்கள்"
	),
	language: (
		"Tamil"
	),
	pronunciation: (
		"aṟiñarhal"
	)
}

let seeds = {
	name: (
		"പണ്ഡിതർ"
	),
	language: (
		"Malayalam"
	),
	pronunciation: (
		"paṇḍitar"
	)
}

const show_rules = () => {
	open_rules ({ modal_store });
}


</script>

<svelte:head>
	<title>{ seeds.name }</title>
</svelte:head>


<style>
.gradient-heading {
	@apply bg-clip-text text-transparent box-decoration-clone;
	@apply bg-gradient-to-br;
	@apply from-primary-400 via-secondary-500 to-primary-500;
}

.badge {
	white-space: break-spaces;
}

</style>


<Leaf>
	<div
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<header 
			style="
				font-weight: bold;
				font-family: sans-serif;
				font-size: 10vw; 
				
				text-align: center;
				
				font-family: 'Rubik Vinyl', sans-serif;
			"
			class="gradient-heading"
		>Foam Pet</header>
		
		<div
			class="card p-4 variant-soft-surface"
			
			style="
				width: 100%;
				font-size: 1.2em;
			"
		>
			<p
				style="
					text-align: center;
				"
			>
				<span style="display: block">Perhaps occassionally pronounced as { seeds.pronunciation },</span>
				<span style="display: block"><b style="font-size: 1.4em">{ seeds.name }</b> might be { seeds.language } for <b>scholars</b>.</span>
			</p>
		</div>
	</div>

	<!-- 
		<div style="height: 0.5cm"></div>
		<Mural />
	-->

	<div style="height: 0.5cm"></div>
	<Boards />
	
	<div style="height: 0.5cm"></div>

	<div class="card p-4">
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0.5cm 0;
			"
		>Pleasantries</header>
		<p
			style="
				text-align: center;
			"
		>
			<span>Striving to amplify friendliness,</span> 
			<br />
			<span>literature with slang can be found throughout.</span>
		</p>
		
		<div style="height: 0.25cm"></div>
		
		<p
			style="
				text-align: center;
			"
		>
			<span>The slang cipher can be turned off at</span>
			<Milieus_Button
				name={ "Theme" }
				location={[ "Scholars", "Theme" ]}
				is_open_location={[ "Scholars", "Theme" ]}
			/>
		</p>
		
		<div style="height: 1cm"></div>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div
		class="card p-4"
		style="
			margin: 0 auto;
			text-align: center;
		"
	>		
		<p>
			<span>These are the rules.</span>
		</p>

		<div style="height: 0.25cm"></div>

		<button
			on:click={ show_rules }
			type="button" 
			
			style="
				padding: 0.25cm 1.5cm;
			"
			class="btn btn-lg btn bg-gradient-to-br variant-gradient-primary-secondary"
		>Bayanihan</button>
	</div>

	<div style="height: 0.5cm"></div>

	<div class="card p-4">
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0.5cm 0;
			"
		>Bouncy</header>
	
		<div style="font-size: 1em; text-align: center; line-height: 2em;">
			<p
				
			>
				<span><Slang text="Pets" /> are event horizon wallet guardians for <Slang text="Aptos" />.</span>
			</p> 
			<p>
				<a class="anchor" href="https://Aptos.dev">https://Aptos.dev</a>
			</p>
			<p>
				<a class="anchor" href="https://aptosfoundation.org">https://aptosfoundation.org</a>
			</p>
		</div>
	
		<div style="height: 1cm"></div>
	
		<p
			style="font-size: 1em; text-align: center; line-height: 2em;"
		>
			<span>A <Slang text="Publisher" /> <Slang text="Pet" /> should live on an <Slang text="Online Machine" />.</span>
		</p> 
		<p
			style="font-size: 1em; text-align: center; line-height: 2em;"
		>
			<span><Slang text="This Domain" /> is a <Slang text="Publisher" /> <Slang text="Pet" />.</span>
		</p> 
	
		<div style="height: 1cm"></div>
	
		<p
			style="font-size: 1em; text-align: center; line-height: 2em;"
		>
			<span>A <Slang text="Signer" /> <Slang text="Pet" /> should live on an <Slang text="Offline Machine" />.</span>
		</p>

		
		<div style="height: 1cm"></div>		
		
		<Offline_Signing_Example />
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<Getting_Moving />	
	
	<div style="height: 0.5cm"></div>
	
	<Beacons />
	
	<div style="height: 0.5cm"></div>
	
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

	
	<div style="height: 0.5cm"></div>
	
	<div
		class="card p-4"
		style="
			margin: 0 auto;
			text-align: center;
		"
	>
		<header 
			style="
				font-size: 2em; 
				text-align: center;
				padding: 0cm 0;
			"
		>Asks</header>
		
		<p>
			<span>For any asks please open an <b>issue</b> or <b>pull request</b> at</span>
			<br />
			<a 
				target="_blank"
				href="https://github.com/basalt-plateau/foam_pet/issues"
			>https://github.com/basalt-plateau/foam_pet/issues</a>
			<br />
			<a 
				target="_blank"
				href="https://github.com/basalt-plateau/foam_pet/pulls"
			>https://github.com/basalt-plateau/foam_pet/pulls</a>
		</p>
	</div>
	
	<div style="height: 5cm"></div>
</Leaf>

