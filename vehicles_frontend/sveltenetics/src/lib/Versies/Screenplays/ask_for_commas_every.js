


export const ask_for_commas_every = () => {
	let commas_every = 5
	if (typeof localStorage.commas_every === "string") {
		try {
			assert_is_natural_numeral_string (localStorage.commas_every)
			commas_every = parseInt (localStorage.commas_every)
		}		
		catch (exception) {
			// Like if the assertion failed.. exception note not important.
			// console.info (exception)
		}
	}
	
	return commas_every;
}

