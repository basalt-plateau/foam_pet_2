


<script>

//\\
//
import { TabGroup, Tab, TabAnchor } from '@skeletonlabs/skeleton';	
import { TreeView, TreeViewItem, RecursiveTreeView } from '@skeletonlabs/skeleton';
import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';
//
//
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
//
//
import { parse_styles } from '$lib/trinkets/styles/parse.js';

//
////

import Loyals from '$lib/Letters/Loyals.svelte'


/*
let loyals_name = (
	"家庭"	
)
*/


/*
// 
//
//
//
//
var loyals_name = (
	"ᎤᏓᏅᏙᏗ"
)
var loyals_language = "Cherokee";
var loyals_pronunciation = "udanvdo"


// 
//
//
//
//
let loyals_name = (
	"ᐊᔭᖅ"
)
let loyals_language = "Inuktitut";
let loyals_pronunciation = "ajaaq"
*/


// 
//
//
//
//
var loyals_name = "Loyals"
var loyals_language = "Foam Pet";
var loyals_pronunciation = ""

var pet_language = {
	name: "loyalty",
	language: "foam pet"
}

const header_saying_2 = {
	name: (
		"အညွှန်းများ"
	),
	language: (
		"Burmese"
	),
	pronunciation: (
		"a-nyun-myar"
	),
	english: "Hints"
}


let tabSet = 0

</script>



<svelte:head>
	<title>{ loyals_name }</title>
	<meta name="description" content="About this app" />
</svelte:head>


<Leaf>
	<div
		class="card p-4"
		style="
			width: 100%;
		"
	>
		<header
			style="
				font-size: 3em;
				text-align: center;
				font-size: bold;
			"
		>
			<div
				style="
					transform: scale(2.5)
				"
			>
				<Loyals />
			</div>
		</header>
		
		<div style="height: 0.5cm"></div>

		<div
			class="card p-2 variant-soft-surface"
			style="
				width: 100%;
			"
		>
			<p
				style="
					text-align: center;
					line-height: 2em;
				"
			>
				<span
					style="
						text-align: center;
						display: block;
					"
				>Although the glyph seems vague,</span>
				<span
					style="
						text-align: center;
						display: block;
						justify-content: center;
						align-items: cetner;
					"
				>
					<div
						style="
							display: inline-block;
							transform: scale(1.2) translateY(5px);
							padding-right: .25em;
						"
					>
						<Loyals />
					</div>
					<div
						style="
							display: inline-block;
						"
					>seems to evoke</div>
					<div
						style="
							display: inline-block;
						"
					><b>loyalty</b></div>.
				</span>
			</p>
		</div>
	</div>

	<div style="height: 0.2cm"></div>

	
	<div class="card p-4">

		<div
			class="card p-1 variant-soft-surface"
			style="
				width: 100%;
			"
		>
			<span
				style="
					display: block;
					text-align: center;
				"
			>Perhaps once spoken as <b>{ header_saying_2.pronunciation }</b>, </span>
			<span
				style="
					display: block;
					text-align: center;
				"
			><b style="font-size: 1.2em">{ header_saying_2.name }</b> might be <b>{ header_saying_2.language }</b> for <b>{ header_saying_2.english }</b>.</span>
		</div>
	</div>

	<div 
		style="
			display: flex;
			flex: 0.6;
			justify-content: center;
			flex-direction: column;
			min-height: 100%;
		"
	>
		<div style="height: 0.2cm"></div>

		<div
			class="card p-4"
			style="
				padding: 1cm;
				width: 100%;
			"
		>
			<header
				style="
					display: none;
					font-size: 2.5em;
					text-align: center;
				"
			>{ loyals_name }</header>
					
			<p
				style="
					text-align: center;
					font-size: 1.2em;
				"
			>These activities should happen offline.</p>
			
			<div style="height: 0.25cm"></div>
			
			<p style="text-align: center">
				The QR code interface should be used.
			</p>
			
			<div style="height: 0.25cm"></div>
			
			<div
				class="card variant-soft-surface p-4"
				style="
					max-width: 15cm;
					margin: 0 auto;
				"
			>
				<ol class="list">
					<li class="card p-4">
						<span class="badge-icon p-4 variant-soft-primary">1</span>
						<span class="flex-auto">
							<Slang text="Accounts"/> is for choosing <Slang text="Account"/>
						</span>
					</li>
					<li
						class="card p-4"
						style="
							line-height: 2em;
						"
					>
						<span class="badge-icon p-4 variant-soft-primary">2</span>
						
						<span class="flex-auto">
							To ask the <Slang text="Consensus"/> to add a <Slang text="Transaction"/> to the <Slang text="Blockchain"/>,
							a <Slang text="Petition"/> with <Slang text="a_signature"/> is necessary.
						</span>
					</li>
				</ol>
			</div>
		</div>

		<div style="height: 1cm"></div>

	</div>
</Leaf>