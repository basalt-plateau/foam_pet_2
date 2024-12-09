
<script>

/*
	React:
		Chemistry

		Nuclear Reactors
		Particle Colliders
*/

import Slang from '$lib/trinkets/Slang/Trinket.svelte'
import Leaf from '$lib/trinkets/Layout/Leaf/Trinket.svelte'

import { onMount, onDestroy } from 'svelte';
import React from 'react';
import ReactDOM from 'react-dom/client'; // Import React 18's createRoot
import Component from './Component.jsx'; // Your React component
import { WalletProvider } from './Wallet.jsx'; // Your React component
import Wallet_Demo from './Wallet_Demo.jsx'; // Your React component

let container;
let root;

onMount(() => {
	root = ReactDOM.createRoot (container);
	root.render (React.createElement (Wallet_Demo));

	return () => {
		root.unmount();
	};
});

</script>




<Leaf>
	<header>React Verse</header>

	<div bind:this={ container }></div>
</Leaf>