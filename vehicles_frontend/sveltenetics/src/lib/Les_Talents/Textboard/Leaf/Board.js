


export const retrieve_hull_names = async ({
	Builder_01
}) => {
	const { result } = await view_fonction ({
		body: {
			"function": `${ Builder_01 }::Hulls_Module::retrieve_vector_of_hull_names`,
			"type_arguments": [],
			"arguments": []
		}
	});
	
	console.info ({ result });
	
	const hull_names = result [0].map (name => {
		if (name === "") {
			return {
				value: name,
				label: "front"
			}
		}
		
		return {
			value: name,
			label: name
		}
	});
	
	console.info ({ hull_names });
	
	return hull_names
}


