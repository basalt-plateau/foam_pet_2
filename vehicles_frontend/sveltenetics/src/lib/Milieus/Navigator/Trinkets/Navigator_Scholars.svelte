

<script>

import Milieus_Button from '$lib/Milieus/Button/Trinket.svelte'

import { onMount, onDestroy } from 'svelte'
import { check_Milieus_truck, monitor_Milieus_truck } from '$lib/Milieus/Truck'
import { check_roomies_truck } from '$lib/Versies/Trucks'
import Seeds_Trucks from '$lib/Versies/Trucks.svelte'

let mode = check_roomies_truck ().freight.mode;;
let location = [ "", "" ];

let update_variables = () => {
	console.log ("update_variables");
	
	mode = check_roomies_truck ().freight.mode;
	location = check_Milieus_truck ().freight.location;
}
update_variables ();


let Scholars_Trucks_Prepared = "no"
let Scholars_Trucks_Monitor;
let Scholars_Trucks_Freight;
onMount (async () => {
	Scholars_Trucks_Freight = check_Milieus_truck ().freight; 
	
	Scholars_Trucks_Monitor = monitor_Milieus_truck ((_freight) => {
		Scholars_Trucks_Freight = _freight;
		update_variables ();
	})
	
	update_variables ();
	
	Scholars_Trucks_Prepared = "yes"
});
onDestroy (() => {
	Scholars_Trucks_Monitor.stop ()
}); 


let seeds_freight = {}
let seeds_trucks_prepared = "no"
const on_seeds_truck_change = ({ freight: _freight, happening }) => {
	seeds_freight = _freight;
	if (happening === "mounted") {
		seeds_trucks_prepared = "yes"
	}
	
	build ();
}

let buttons_styles = ""
const build = () => {
	let window_width = check_roomies_truck ().freight.window_width;
	if (window_width > 800) {
		buttons_styles = 'padding: 0.15cm 0.55cm; margin: 0 0.1cm; font-size: 1.2em'
	}
	else {
		buttons_styles = ''
	}
}

/*

	Friends:
		

	Garden:
		Inuit: 
			ᐊᔭᕙᓘᓐᖏᑦ
		
		Cherokee: 
			ᎠᏫᏒᏅ
*/
const names = {
	garden: "ᎠᏫᏒᏅ"
}


const Garden = {
	Cherokee: (
		"ᎠᏫᏒᏅ"
	)
}


/*
	Mandarin (普通话): 主题 (zhǔtí)
	Cantonese (粤语): 主题 (zyu2 tai4)
	Hokkien / Taiwanese (台语 / 闽南语): 主题 (chú-tí or chí-thé)
	Hakka (客家话): 主题 (zú-tî)
	Wu Chinese (吴语): 主题 (zú-tí)
	Xiang Chinese (湘语): 主题 (zhǔtí)
	Gan Chinese (赣语): 主题 (zhǔtí)
	Pinghua (平话): 主题 (zhǔtí)
	Jin Chinese (晋语): 主题 (zhǔtí)
	Huizhou (徽州话): 主题 (zhǔtí)
	Yue (Cantonese, beyond Guangdong): 主题 (zyu2 tai4)
*/
const Theme = {
	Hakka: (
		"主題"
	)
}

/*
	Hints:
		Petroglyphs
*/

const Petroglyphs = {
	Emoji: (
		"🦖"
	)
}


</script>

{#if location [0] === "Ecology" }
<div
	style=""
>
	<Seeds_Trucks on_change={ on_seeds_truck_change } />

	{#if seeds_trucks_prepared === "yes"}
	<div>
		<Milieus_Button
			name={ Petroglyphs.Emoji }
			location={[ "Ecology", "Hints" ]}
			is_open_location={[ "Ecology", "Hints" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			monitor="Garden"
		
			name={ names.garden }
			location={[ "Ecology", "Garden" ]}
			is_open_location={[ "Ecology", "Garden" ]}
			
			style={ buttons_styles }
		/>
		<Milieus_Button
			name={ Theme.Hakka }
			
			location={[ "Ecology", "Theme" ]}
			is_open_location={[ "Ecology", "Theme" ]}
			
			style={ buttons_styles }
		/>
		
		{#if mode === "nurture" }
		<Milieus_Button
			name={ "Resilience" }
			
			location={[ "Ecology", "Resilience", "Leaf" ]}
			is_open_location={[ "Ecology", "Resilience" ]}
			
			style={ buttons_styles }
		/>
		{/if}
	</div>
	{/if}
</div>
{/if}