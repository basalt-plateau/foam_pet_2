


<script>

import { onMount, onDestroy } from 'svelte'

onMount (async () => {	
	Textboard_Truck.make ()
	Textboard_Truck_Made = "yurp";
	
	hull_names = await retrieve_hull_names ({ Builder_01 });
	Search ();
});
onDestroy (() => {
	Textboard_Truck.destroy ()
});

</script>


<div>




</div>