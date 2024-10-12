



<script>


/*
	import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
	<Alert_Success 
		text={}
	/>
*/

/*
	import Alert_Success from '$lib/trinkets/Alerts/Success.svelte'
	<Alert_Success show="yes">
		<p></p>
	</Alert_Success>
*/


export let text = "";
export let show = "no"

let show_the_alert = (
	(typeof text === "string" && text.length >= 1) ||
	show === "yes"
)

</script>

{#if show_the_alert == true }
<aside 
	monitor="alert success"
	class="alert variant-filled-success" 
	style="
		position: relative;
	
		display: flex; 
		flex-direction: row;
		align-items: center;
		
		padding: 12px; 
		margin-top: 8px
	"
>
	<div 
		class="alert-message" 
		style="
			padding: 0 0 0 10px; 
			margin: 0;
			text-align: center;
		"
	>
		<slot></slot>
		
		{#if text.length >= 1}
		<p monitor="alert success text">{ text }</p>
		{/if}
	</div>
</aside>
{/if}