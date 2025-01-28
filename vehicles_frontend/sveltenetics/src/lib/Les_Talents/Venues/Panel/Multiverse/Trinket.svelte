

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
	style="
		height: 100%;
		width: 100%;
		padding: 1cm 0;
		
		display: flex;
		justify-content: center;
		align-content: center;
	"
>
	<div 
		id="map" 
		style="
			box-sizing: border-box;
			border: 2px solid black;
			border-radius: 10px;
			
			height: 100%;
			width: 100%;
		"
	></div>
</div>
