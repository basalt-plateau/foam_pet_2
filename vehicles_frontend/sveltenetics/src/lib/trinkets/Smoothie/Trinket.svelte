


<script>


export let current = ""
export let components = {}

let current_component = components [ current ]

</script>



<div>
	<svelte:component this={ current_component } />
</div>