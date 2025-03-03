




/*
	yup or no
*/
export const ask_is_ruler = () => {
	let ruler = "no"
	
	const stored = localStorage.ruler;
	if (typeof stored === "string" && stored === "yup") {
		ruler = stored;
	}
	
	return ruler;
}