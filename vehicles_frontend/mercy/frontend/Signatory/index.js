




/*
	import { create_wallet_link } from "@/Signatory"
	const wallet_link = create_wallet_link ();
*/

/*
	https://github.com/hippospace/aptos-wallet-adapter/tree/main/packages/aptos-wallet-adapter
*/

/*

const plugins = []
const optInWallets = []
// const dappConfig = { network: NETWORK }
const dappConfig = {}

const disableTelemetry = []

const wallet_link = new WalletCore (
	plugins,
	optInWallets,
	dappConfig,
	disableTelemetry
);


*/

/*
	const wallet_connection = await wallet_link.connect (name);
*/
	
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
import {
  WalletProvider,
  RiseWalletAdapter,
} from '@manahippo/aptos-wallet-adapter';

export const create_wallet_link = () => {
	const plugins = []
	
	const optInWallets = [
		// new RiseWalletAdapter ()
	];
	
	// const dappConfig = { network: NETWORK }
	const dappConfig = {}
	const disableTelemetry = []

	const wallet_link = new WalletCore (
		plugins,
		optInWallets,
		dappConfig,
		disableTelemetry
	);
	
	return wallet_link
}