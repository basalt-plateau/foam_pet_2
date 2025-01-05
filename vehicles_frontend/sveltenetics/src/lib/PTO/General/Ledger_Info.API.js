
// https://aptos.dev/en/build/apis/fullnode-rest-api-reference#tag/general/get/

/*
	try {
		import { request_ledger_info } from '$lib/PTO/General/Ledger_Info.API'
		const { enhanced } = await request_ledger_info ({ net_path })
		const { chain_id } = enhanced;
	}
	catch (imperfection) {
		
	}
*/


const ask = async (URL, {
	method = "GET",
	timeout = 2000
}) => {
	return await new Promise ((resolve, reject) => {
		var xhr = new XMLHttpRequest();
		xhr.open (method, URL, true);
		xhr.timeout = timeout

		xhr.onload = function () {
			if (xhr.status === 200) {			
				resolve ({
					status: xhr.status,
					enhanced: JSON.parse (xhr.responseText)
				});
				return;
			} 

			reject (new Error (`The ask failed with status ${ xhr.status }`))
		};
		xhr.onerror = function () {
			reject (new Error ("The ask failed."))
		};
		xhr.ontimeout = function () {
			reject (new Error ("The ask timed out."))
		};

		xhr.send ();
	});
}

export const request_ledger_info = async ({ net_path }) => {
	const controller = new AbortController ();
	const { signal } = controller;
	const timeoutId = setTimeout(() => {
		controller.abort(); // Abort the fetch request
	}, 1000);
	
	const response = await fetch (net_path, {
		signal
	});
	if (!response.ok) {
		throw new Error ('request_ledger_info failed');
    }
	const data = await response.json ();
	
	return {
		enhanced: data,
		status: response.status
	};
	
	
	const proceeds = await ask (net_path, {
		timeout: 1000
	})
	const enhanced = proceeds.enhanced;
	
	return {
		enhanced
	};
}