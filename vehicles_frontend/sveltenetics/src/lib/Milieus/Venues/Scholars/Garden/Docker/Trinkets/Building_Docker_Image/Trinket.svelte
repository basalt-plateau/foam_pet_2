
<script>

import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'
	

let tabSet = 0

</script>

<div 
	style="
		display: flex;
		flex: 0.6;
		justify-content: center;
		flex-direction: column;
		min-height: 100%;
	"
>
	<div style="height: 0.5cm"></div>

	<header 
		style="
			text-align: center;
		"
	>Creating a custom Docker Image.</header>
	
	<div style="height: 0.5cm"></div>

	<hr />

	<div style="height: 0.5cm"></div>

	<header>From the <Slang text="Online Machine" /></header>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">
		<p>
			<span>Pull the Ubuntu Image</span>
			<Code_Wall 
				context={ "OS" }
				text={ "docker pull jitesoft/debian" } 
			/>
		</p>
	</div>

	<div style="height: 0.5cm"></div>

	<div class="card variant-soft p-4">
		<p>
			<span>Create a container from the "jitesoft/debian" image</span>
			<Code_Wall 
				context={ "OS" }
				text={ "docker run --name foam -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 -v .:/building -it jitesoft/debian" } 
			/>
		</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">
		<p>
			<span>On the container, add "python", "pip", and "python venv".</span>
			<Code_Wall 
				context={ "Docker Container" }
				text={
					[ 
						`apt update`,
						`apt install python3-pip python3.12-venv -y`
					].join ('\n')
				} 
			/>
		</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">
		<p>
			<span>On the container, create a python virtual environment.</span>
			<Code_Wall 
				context={ "Docker Container" }
				text={
					[ 
						`mkdir /habitat && cd /habitat`,
						`python3 -m venv v_env`,
						`. v_env/bin/activate`
					].join ('\n')
				} 
			/>
		</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">	
		<p>
			<span>On the container, add <Slang text="the_pypi_module" />.</span>
		</p>	

		<div style="height: 0.1cm"></div>

		<div>
			<a 
				class="anchor" 
				href="https://pypi.org/project/foam_pet"
				target="_blank"
			>https://pypi.org/project/foam_pet</a>
		</div>
		
		<div style="height: 0.2cm"></div>
		
		<p>
			<Code_Wall 
				context={ "Docker Container" }
				text={
					[ 
						`pip install foam_pet`,
						`foam_pet build`,
						`foam_pet_1 demux_hap build_unverified_certificates`,
						`foam_pet ventures on`
					].join ('\n')
				} 
			/>
		</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">
		<p>
			<span>Exit the container</span>
			<Code_Wall 
				context={ "Docker Container" }
				text={
					[ 
						`exit`
					].join ('\n')
				} 
			/>
		</p>
	</div>
	
	<div style="height: 0.5cm"></div>
	
	<div class="card variant-soft p-4">
		<article>
			<p>On the OS, create a <b>Docker Image</b> from the <b>Docker Container</b>.</p>
			<Code_Wall 
				context={ "OS" }
				text={
					[ 
						`docker commit foam_pet foam_pet:v0.1.0`,
						`docker save -o foam_pet_v0.1.0.tar foam_pet:v0.1.0`
					].join ('\n')
				} 
			/>
		</article>
	</div>
</div>

