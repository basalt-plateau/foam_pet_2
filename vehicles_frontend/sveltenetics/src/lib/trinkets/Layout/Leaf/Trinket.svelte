
<script>

/*
	import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
	<Leaf></Leaf>
*/

/*
	import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'
	<Leaf monitor="leaf"></Leaf>
*/

import { check_roomies_truck } from '$lib/Versies/Trucks'
const leaf_styles = check_roomies_truck ().freight.layout.leaf_styles;

export let monitor = ""

</script>

<div
	monitor={ monitor }
	style={ leaf_styles }
>
	<slot></slot>
</div>