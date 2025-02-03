


<script>


/*
	import Textboard_Leaf from "$lib/Les_Talents/Textboard/Leaf/Board.svelte"
	<Textboard_Leaf />
*/


/*
	Builder: 
	
*/

const Builder_01 = "0x2F75DA076414103C721D195B0376C66897593B1F4E961671099A2DC9A24ADCFD";

const Fonctions = {
	Begin_Game: `${ Builder_01 }::Game_Module::Begin_Game`,
	End_Game: `${ Builder_01 }::Game_Module::End_Game`,
	is_Game_built: `${ Builder_01 }::Game_Module::is_Game_built`,
	
	send_text: `${ Builder_01 }::Game_Module::send_text`,
	delete_text: `${ Builder_01 }::Game_Module::delete_text`,
	retrieve_texts: `${ Builder_01 }::Game_Module::retrieve_texts`
};



</script>


<div
	class="card p-4"
	style="
		width: 100%;
		height: 15cm;
	"
>	
	<div
		style="
			display: flex;
			border-radius: 4px;
			justify-content: center;
		"
		class="card p-4 variant-soft-surface"
	>
		<header>Textboard</header>
	</div>
	
	<div
		style="
			display: flex;
			border-radius: 4px;
			justify-content: right;
			
		"
		class="card p-4 variant-soft-surface"
	>
		<textarea></textarea>
		<button type="button" class="btn variant-filled">Send</button>
	</div>
</div>