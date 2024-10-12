



<script>

import { Accordion, AccordionItem } from '@skeletonlabs/skeleton';

import Code_Wall from '$lib/trinkets/Code_Wall/Trinket.svelte' 
import Slang from '$lib/trinkets/Slang/Trinket.svelte'


var unzip = `
from this: foam_pet_v1.0.0-1.tar.zip
into this: foam_pet_v1.0.0-1.tar
`

</script>

<svelte:head>
	<title>Loyals, Hints</title>
	<meta name="description" content="About this app" />
</svelte:head>



<div
	class="card variant-soft p-2"
	style="
		width: 100%;
	"
>
	<Accordion>
		<AccordionItem>
			<svelte:fragment slot="summary">
				<header
					style="
						text-align: center;
						font-size: 1.8em;
					"
				>Running Docker Image v1_0_0.1</header>
			</svelte:fragment>
			<svelte:fragment slot="content">
				<div>
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>The <Slang text="Pet" /> docker image foam_pet_v1.0.0-1.tar.zip can be obtained from here:</p>
						
						<div style="height: 0.25cm"></div>
						
						<a 
							href="https://github.com/basalt-plateau/foam-docker-images/releases/download/v1.0.0-1/foam_pet_v1.0.0-1.tar.zip" 
							class="btn variant-filled"
						>
							<span>Obtain foam_pet_v1.0.0-1.tar.zip</span>
						</a>
					</div>
						
					<div style="height: 0.5cm"></div>	
						
					<div class="card variant-soft p-4">
						<header>Unzip</header>
						<hr class="!border-t-2" style="margin: 0.2cm" />
						<p>from this: <b>foam_pet_v1.0.0-1.tar.zip</b></p>
						<p>into this: <b>foam_pet_v1.0.0-1.tar</b></p>
						<hr class="!border-t-2" style="margin: 0.2cm" />
						<p>Left or right clicking might show an unzip button on most operating systems.</p>
					</div>	
						
					<div style="height: 0.5cm"></div>	
						
					<div class="card variant-soft p-4">
						<p>
							<span>Move the docker image <b>foam_pet_v1.0.0-1.tar</b> from an <Slang text="Online Machine" />. to an <Slang text="Offline Machine" />.
						</p>
						<p>This can be done with a Drive, SD Card, Micro SD Card, etc..</p>
					</div>
					
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>
							<span>Then on the <Slang text="Offline Machine" /> load the docker image into the docker engine.</span>
							<Code_Wall 
								context={ "Offline OS" }
								text={[
									`docker load -i foam_pet_v1.0.0-1.tar`,
								]} 
							/>
						</p>
					</div>
					
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>
							<span>Open a docker container from the image.</span>
							<Code_Wall 
								context={ "Offline OS" }
								text={[
									`docker run --name foam -e HOST_IP=host.docker.internal -p 22000:22000 -p 21000:21000 -p 443:443 -p 80:80 -it foam_pet:v1.0.0-1 bash`,
								]} 
							/>
						</p>
					</div>
					
					<div style="height: 0.5cm"></div>
					
					<div class="card variant-soft p-4">
						<p>
							<span>Start foam.</span>
							<Code_Wall 
								context={ "Docker Container" }
								text={[
									`cd /habitat && . v_env/bin/activate && foam_pet ventures on`,
								]} 
							/>
						</p>
					</div>
					
					<div style="height: 1cm"></div>
					<hr class="!border-t-2" />
					<div style="height: 1cm"></div>
					
					<header>Hints</header>
					
					<div class="card variant-soft p-4">
						<p>
							<span>To stop and remove the container,</span>
							<Code_Wall 
								context={ "OS" }
								text={[
									`docker stop foam; docker remove foam;`
								]} 
							/>
						</p>
					</div>
				</div>			
			</svelte:fragment>
		</AccordionItem>
	</Accordion>	
</div>
