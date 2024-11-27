
<script>

import { RadioGroup, RadioItem } from '@skeletonlabs/skeleton';

let leaf_elected = "Barcode"

</script>

<div>
	<div
		style="
			max-width: 400px;
			margin: 0 auto;
			padding: 0.25cm 0;
			
			text-align: center;
		"
	>
		<RadioGroup 
			rounded="rounded-container-token" 
			_flexDirection="flex-col"
		>				
			<RadioItem 
				bind:group={ leaf_elected } 
				name="justify" 
				value="Barcode"
			>
				<!-- <span>Barcode Picture</span> -->
				<span monitor="show barcode">Barcode</span>
			</RadioItem>
			<RadioItem 
				bind:group={ leaf_elected } 
				name="justify" 
				value="Hexadecimal"
			>
				<!-- <span>Hexadecimal String</span> -->
				<span monitor="show hexadecimal">Hexadecimal</span>
			</RadioItem>
		</RadioGroup>
	</div>




</div>


