



<script>

import Slang from '$lib/trinkets/Slang/Trinket.svelte'

export let rules_originals_link = ""

</script>

<style>

header {
	font-weight: bold;
	font-size: 1.5em;
}

article {
	margin: 1em 0;
}

</style>


<div
	style="
		text-align: center;
	"
>
	<header
		style="font-size: 2em;"
	>Originals</header>
	
	<p>Original <Slang text="Label" /> wonders are subject to these rules.</p>

	
	<article class="card p-4 variant-soft-surface">
		<header>Description</header>
		<p style="display: none;">
			<Slang text="Label" /> are loyal, friendly, and scholarly.
		</p>
		<p>	
			Please treat <Slang text="Label" /> with loyalty, friendliness, and scholarliness.
		</p>
	</article>
	
	
	
	<article class="card p-4 variant-soft-surface">
		<header>Festivities</header>
		<p>
			Festivities at <Slang text="Label" /> are allowed 
			if the <Slang text="Label" /> friend is a loyal friend
			to <Slang text="Label" /> and the friends of <Slang text="Label" />.
		</p>
	</article>
	
	
	<article class="card p-4 variant-soft-surface">
		<header>Group Franchises</header>
		<p style="white-space: pre-wrap">
Building a <Slang text="Town" /> Franchise
for friendly or festive purposes is allowed.

This is a <Slang text="Town" /> Group:
https://github.com/basalt-plateau/foam_pet

<Slang text="Town" /> Group Franchises are the responsibility
of the friends that run the Group Franchise.
		</p>
	</article>
	
	<article class="card p-4 variant-soft-surface">
		<header>Ride Franchises</header>
		<p style="white-space: pre-wrap">
Building a <Slang text="Town" /> Ride
for friendly or festive purposes is allowed.

The PyPI module, plus the Icanniana Domain are rides.

<Slang text="Town" /> rides are the responsibility
of the friends that run the <Slang text="Town" /> ride franchise.
		</p>
	</article>
	
	<article class="card p-4 variant-soft-surface">

		<header>Structural Health</header>
		<p style="white-space: pre-wrap">
Building or emulating <Slang text="Town" /> structures, 
for friendly or festive purposes, for the purposes of transplant
into <Slang text="Town" /> or other towns is allowed.			
		</p>
	</article>
	
	
	<article class="card p-1 variant-soft-surface">
		<header>(Silly) Temporarily</header>
		<p>
			Scholarly Loyal <Slang text="Town" /> Friends 
		</p>
	</article>
</div>