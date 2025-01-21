

<script>

let header_1_saying = {
	name: (
		"主题"
	),
	language: (
		"Hokkien"
	),
	pronunciation: (
		"Chuti"
	),
	english: "Theme"
}


</script>


<div
	class="card p-4"
	style="
		display: flex;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	"
>
	<div style="height: 0.5cm"></div>

	<header
		style="
			font-size: 3em;
			line-height: 100%;
		"
	>{ header_1_saying.name }</header>

	<div style="height: 0.5cm"></div>

	<div
		class="card p-4 variant-soft-surface"
		
		style="
			width: 100%;
			font-size: 1.2em;
		"
	>
		<p
			style="
				text-align: center;
			"
		>
			<span style="display: block">Perhaps occassionally pronounced as <b>{ header_1_saying.pronunciation }</b>,</span>
			<span style="display: block"><b style="font-size: 1.4em">{ header_1_saying.name }</b> might be <b>{ header_1_saying.language }</b> for <b>{ header_1_saying.english }</b>.</span>
		</p>
	</div>
</div>