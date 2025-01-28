


/*
	To figure out why a module is used:
		(cd /Metro/vehicles_frontend/sveltenetics && npm ls rc)
*/

/*
	https://generate-license-file.js.org/docs/cli/config-file
*/

/*
	maybe later:
		https://www.npmjs.com/package/jsoneditor
*/

/*
	relevant:
		"license-report": "^6.5.0",
		license-checker
		 "madge": "^8.0.0",
*/

const Rules_Path_FE = process.env.Rules_Path_FE;
if (typeof Rules_Path_FE !== "string") {
	throw new Error ("Rules_Path_FE must be a string.");
}

module.exports = {
	inputs: ["./package.json"],
	output: Rules_Path_FE + "/frontend_rules_entire.txt",
	overwrite: true,
	eol: "lf",
	ci: true,
	noSpinner: true,
	replace: {
        // "rc@1.2.8": "./LICENSE.MIT"
    }
};