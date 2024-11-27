








<script>

/*
	import Barcode_Visual_2 from '$lib/trinkets/Barcode/Visual_2/Trinket.svelte'
	<Barcode_Visual_2 
		hexadecimal_string={ }
	/>
*/

/*
	https://www.npmjs.com/package/html5-qrcode
*/

///
//
import { onMount, onDestroy } from 'svelte';
//
//
import { loop } from '$lib/taverns/loop'
import Alert_Info from '$lib/trinkets/Alerts/Info.svelte'
//
//
import { make_barcode } from './make'
//
//
//\

//



export let u_int_8_array = ""
$: {
	let _u_int_8_array = u_int_8_array;
	console.log ({ u_int_8_array });
}

export let hexadecimal_string = ""
$: {
	let _hexadecimal_string = hexadecimal_string;
	
	make_queue.push ({
		hexadecimal_string
	})
}



//
//
let use_zxing = "yes"
let use_bwip = "no"
//
//
let barcode_element = ""
let prepared = "no"
let make_queue = []
//
//





const make = ({ the_hexadecimal_string }) => {
	barcode_element.innerHTML = '';
	prepared = "no"
	
	if (
		typeof the_hexadecimal_string === 'string' && 
		the_hexadecimal_string.length >= 1
	) {
		make_barcode ({
			barcode_element,
			hexadecimal_string: the_hexadecimal_string,
			size: 400
		})
		
		prepared = "yes"
	}
}


/*
	Maybe there's better than a queue, but 
	not sure how to stop the barcode render function 
	in the middle.
*/
const loop_1 = loop ({
	wait: 200,
	wait_for_response: "yes",
	action: () => {
		console.log ("barcode make queue", make_queue.length);
		
		if (make_queue.length >= 1) {
			const entry = make_queue.shift ();
			make ({
				the_hexadecimal_string: entry.hexadecimal_string
			})
		}
	}
})




onMount (() => {
	loop_1.play ()
	
	make_queue.push ({ hexadecimal_string })
});

onDestroy (() => {
	loop_1.stop ()
})


</script>


<div 
	monitor="barcode visual"
	class="card variant-filled-surface"
>		
	<div
		style="
			max-width: 500px;
			margin: 0 auto;
			padding: 20px;
		"
	>
		{#if prepared !== "yes"}
		<Alert_Info 
			text={ "preparing barcode" }
			progress={{
				show: "yes"
			}}
		/>
		{/if}
	
		{#if use_bwip === "yes"}
		<div 
			bind:this={ barcode_element }
			style=""
		></div>
		{/if}
		
		{#if use_zxing === "yes"}
		<pre
			style="
				display: flex;
				justify-content: center;
			"
		>
			<code 
				monitor="zxing barcode"
				bind:this={ barcode_element }
			></code>
		</pre>
		{/if}
	</div>
</div>