

<script>

/*
	https://leafletjs.com/
	https://leafletjs.com/examples/quick-start/
*/

import { onMount } from 'svelte';
import { onDestroy } from 'svelte';

import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

let multiverse;

const initialCoordinates = [51.505, -0.09];
const zoomLevel = 1;

onMount (() => {
	multiverse = L.map ("map").setView (initialCoordinates, zoomLevel);
	
	L.tileLayer (
		'https://tile.openstreetmap.org/{z}/{x}/{y}.png', 
		{
			attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
		}
	)
	.addTo (multiverse);


});

// Clean up when the component is destroyed

onDestroy (() => {
	if (multiverse) {
		multiverse.remove(); // Remove map instance to clean up
	}
});
</script>


<div 
	id="map" 
	style="
		height: 500px;
	"
></div>
