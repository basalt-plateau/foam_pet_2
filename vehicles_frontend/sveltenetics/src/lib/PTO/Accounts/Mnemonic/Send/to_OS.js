



/*
Aptos Single Key Mnemonic:
  Format: EEC 25519
  
  Mnemonic:
    Numerals: 1 2 3 412 132
    BIP 39 English Wordlist: nation sorry clock vacant whisper visual art topic scene where decade sweet excess usage tuna close search behind theory barely sorry guitar badge frame
  
  Accounts:
    Account_0:
      derivation path: m/44'/637'/0'/0'/0'
      private key: 87D81840D5A1184EE4C0E278D37E23932DEB509F51EA54A2DF2E54F437A95982
      public key: C65B24FF1FE0F0DC23333912BE4BB4D921A93CDF113744BD7BE56031A23AAFEC
      legacy address: 886CF9F5F098372D5602EE9603DF2662B33753A464C45342990A698F677F5194
      address: E7DC4EC2C838DDB14FDB88B9F62C5E328974F3FCEC38AE463E388DDE805F6D9C
*/


/*
	import { send_to_OS } from './send_to_OS'
	send_to_OS ({
		directory_name,
		//
		address_legacy_hexadecimal_string,
		address_one_sender_hexadecimal_string,
		//
		public_key_hexadecimal_string,
		//
		private_key_hexadecimal_string
	})
*/

/*
	wealth:
		fortune, survival, obligation, wealth
	
	boast:
		presence, show, existence, brag, gloat, strut, reach, boast
*/

////
//
import { dump } from 'js-yaml';
import JSZip from 'jszip'
//
//
import { build_tickets } from "./build.js"
//
////

const save_YAML_to_OS = (yamlString, fileName) => {
	const blob = new Blob([yamlString], { type: 'text/yaml' });
	const url = window.URL.createObjectURL(blob);
	const a = document.createElement ('a');
	a.href = url;
	a.download = fileName || 'document.yaml';
	document.body.appendChild (a);
	a.click();    
	window.URL.revokeObjectURL(url);
	document.body.removeChild (a);
}


export const send_to_OS_from_mnemonic_numerals = async ({
	directory_name,
	mnemonic_numerals
}) => {
	const { wealth, boast } = await build_tickets ({ mnemonic_numerals });
	const zip = new JSZip ();
	
	const keys_dir = zip.folder (directory_name);
	keys_dir.file (
		"Aptos.Wealth.yaml",
		dump (wealth, {
			quotingType: '"',
			lineWidth: -1
		})
	);
	
	keys_dir.file (
		"Aptos.Boast.yaml",
		dump (boast,{
			quotingType: '"',
			lineWidth: -1
		})
	);
	
	zip.
	generateAsync ({  type: "blob" }).
	then ((content) => {
		const link = document.createElement ('a');
		link.href = URL.createObjectURL (content);
		link.download = directory_name + ".zip";
		link.click ();
		URL.revokeObjectURL (link.href);
	});
}


