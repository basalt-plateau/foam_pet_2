



## Foundation
import { onMount, onDestroy } from 'svelte'
import * as PT from './Truck/index.js'

let petition_freight_prepared = "no"
let petition_freight = {}
onMount (() => {
	petition_freight = PT.retrieve_truck ().freight;
	
	monitor_truck ((_freight) => {
		petition_freight = _freight;
	})
	
	petition_freight_prepared = "yes"
});
onDestroy (() => {
	PT.destroy_truck ()
});


## Leaves
import { onMount, onDestroy } from 'svelte'
import * as PT from './Truck/index.js'

let PT_prepared = "no"
let PT_freight = {}
let PT_monitor;
onMount (() => {
	PT_freight = PT.retrieve_truck ().freight;
	
	PT_monitor = PT.monitor_truck ((_freight) => {
		PT_freight = _freight;
	})
	
	PT_prepared = "yes"
});
onDestroy (() => {
	PT_monitor.stop ()
});