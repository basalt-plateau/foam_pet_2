
/*

*/
export const ask_for_origin_address = () => {
	// let origin_address = "http://localhost:22000"
	// let origin_address = "https://" + the_domain;
	// let origin_address = "/";
	let origin_address = "https://scroll.town";
	if (typeof localStorage.origin_address === "string") {
		origin_address = localStorage.origin_address	
	}
	
	return origin_address;
}

