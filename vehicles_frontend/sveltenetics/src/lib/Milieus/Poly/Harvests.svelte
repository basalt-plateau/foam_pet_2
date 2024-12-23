

<script>


/*
let header_1_saying = {
	name: (
		"θερισμός"
	),
	language: (
		"Greek"
	),
	pronunciation: (
		"theh reez mohs"
	),
	english: "Harvests"
}

let header_1_saying = {
	name: (
		"קְצִיר"
	),
	language: (
		"Hebrew"
	),
	pronunciation: (
		"katsir"
	),
	english: "Harvest"
}
*/


/*
	Harvest, or stack of grain
*/
let header_1_saying = {
	name: (
		"ᚉᚏᚒᚐᚌ"
	),
	language: (
		"Ogham"
	),
	pronunciation: (
		"Cruach"
	),
	english: "Harvests"
}

</script>


<div class="card p-4">
	<div style="height: 1cm" />

	<header
		style="{parse_styles ({
			'display': 'flex',
			'text-align': 'center',
			'font-size': '3em',
			'justify-content': 'center'
		})}"
	>
		{ header_1_saying.name }
	</header>
	
	<div style="height: 1cm"></div>

	<div
		class="card p-1 variant-soft-surface"
		style="
			width: 100%;
		"
	>
		<span
			style="
				display: block;
				text-align: center;
			"
		>Perhaps occassionally pronounced <b>{ header_1_saying.pronunciation }</b>, </span>
		<span
			style="
				display: block;
				text-align: center;
			"
		><b style="font-size: 1.2em">{ header_1_saying.name }</b> might be <b>{ header_1_saying.language }</b> for <b>{ header_1_saying.english }</b>.</span>
	</div>

	<div style="height: 0.5cm"></div>
</div>