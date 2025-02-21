




/*
	yup or no
*/
export const ask_is_producer = () => {
	let producer = "no"
	
	const stored = localStorage.producer;
	if (typeof stored === "string" && stored === "yup") {
		producer = stored;
	}
	
	return producer;
}