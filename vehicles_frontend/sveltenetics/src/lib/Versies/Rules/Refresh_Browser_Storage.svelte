



<script>

import { SlideToggle } from '@skeletonlabs/skeleton';

let permitted = false;

var wipe_cookie = (name) => {
    document.cookie = name + '=; Max-Age=0; path=/';
}

var wipe_cookies = () => {
    const cookies = document.cookie.split("; ");
    for (let i = 0; i < cookies.length; i++) {
        const cookie_name = cookies[i].split("=")[0];
        wipe_cookie (cookie_name);
    }
}


const refresh_storage = () => {
	localStorage.clear ();
	sessionStorage.clear ();
	
	wipe_cookies ();
	
	window.location.reload ();
}

</script>


<div>
	<div
		class="card p-4"
		style="
			display: flex;
			align-items: center;
			justify-content: center;
			flex-direction: column;
		"
	>
		<div
			class="card p-2 variant-soft-surface"
			style="
				padding: 0.2cm 1cm;
				margin: 0.2cm 0 0.5cm;
			"
		>
			<header
				style="
					font-size: 1.4em;
					line-height: 100%;
				"
			>Browser Storage</header>
		</div>
		
		
		<div style="width: 10px"></div>
		<p>The <b>Refresh</b> button clears the browser storage.</p>
		<div style="height: 6px"></div>
		<p>To permit refresh, the slide needs to in the <b>permit</b> position.</p>
		<div style="height: 6px"></div>
		
		<div
			style="
				display: flex;
				align-items: center;
				justify-content: center;
				
				padding: 20px;
			"
		>
			<p
				style="
					padding: 8px;
				"
			>deny</p>
			<SlideToggle 
				name="slide" 
				bind:checked={ permitted } 
			/>
			<p
				style="
					padding: 8px;
				"
			>permit</p>
		</div>
		
		<div
			style="
				display: flex;
				align-items: center;
				justify-content: center;
				gap: 8px;
			"
		>
			<button 
				on:click={ refresh_storage }
				disabled={ permitted != true }
				type="button" 
				class="btn variant-filled-error"
			>Refresh</button>
		</div>
	</div>

</div>