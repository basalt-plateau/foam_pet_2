


/*
	yes or no
*/
export const ask_for_slang = () => {
	let use_slang = "yes"
	if (typeof localStorage.use_slang === "string") {
		use_slang = localStorage.use_slang	
	}
	
	return use_slang;
}

