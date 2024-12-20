
<script>



import Offline_Signing_Example from '$lib/trinkets/Hints/Offline_Signing_Example/Trinket.svelte'
import Slang from '$lib/trinkets/Slang/Trinket.svelte'



</script>

<div class="card p-4">
	<header 
		style="
			font-size: 2em; 
			text-align: center;
			padding: 0.5cm 0;
		"
	>Bouncy</header>

	<div style="font-size: 1em; text-align: center; line-height: 2em;">
		<p
			
		>
			<span><Slang text="Pets" /> are cloudwalled wallet couriers for <Slang text="Aptos" />.</span>
		</p> 
		<p>
			<a class="anchor" href="https://Aptos.dev">https://Aptos.dev</a>
		</p>
		<p>
			<a class="anchor" href="https://aptosfoundation.org">https://aptosfoundation.org</a>
		</p>
	</div>

	<div style="height: 1cm"></div>

	<p
		style="font-size: 1em; text-align: center; line-height: 2em;"
	>
		<span>A <Slang text="Publisher" /> <Slang text="Pet" /> should live on an <Slang text="Online Machine" />.</span>
	</p> 
	<p
		style="font-size: 1em; text-align: center; line-height: 2em;"
	>
		<span><Slang text="This Domain" /> is a <Slang text="Publisher" /> <Slang text="Pet" />.</span>
	</p> 

	<div style="height: 1cm"></div>

	<p
		style="font-size: 1em; text-align: center; line-height: 2em;"
	>
		<span>A <Slang text="Signer" /> <Slang text="Pet" /> should live on an <Slang text="Offline Machine" />.</span>
	</p>

	
	<div style="height: 1cm"></div>		
	
	<Offline_Signing_Example />
</div>