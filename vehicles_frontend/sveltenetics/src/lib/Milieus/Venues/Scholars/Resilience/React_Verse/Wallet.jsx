

/*
	https://aptos.dev/en/build/sdks/wallet-adapter/dapp#fields
*/

import React from 'react';

import { AptosWalletAdapterProvider } from "@aptos-labs/wallet-adapter-react";

/*
import { BitgetWallet } from "@bitget-wallet/aptos-wallet-adapter";
import { FewchaWallet } from "fewcha-plugin-wallet-adapter";
import { MartianWallet } from "@martianwallet/aptos-wallet-adapter";
import { MSafeWalletAdapter } from "@msafe/aptos-wallet-adapter";
import { OKXWallet } from "@okwallet/aptos-wallet-adapter";
import { TrustWallet } from "@trustwallet/aptos-wallet-adapter";
*/

import { MartianWallet } from "@martianwallet/aptos-wallet-adapter";

import { PropsWithChildren } from "react";
import { Network } from "@aptos-labs/ts-sdk";
 
import { useWallet } from "@aptos-labs/wallet-adapter-react";
 

 
export const WalletProvider = ({ children }) => {
	const { account, connected, wallet, changeNetwork } = useWallet();
	
	/*
	const wallets = [
		new BitgetWallet(),
		new FewchaWallet(),
		new MartianWallet(),
		new MSafeWalletAdapter(),
		new PontemWallet (),
		new TrustWallet(),
		new OKXWallet(),
	];
	*/
  
	const wallets = [
		new MartianWallet()
	]
 
	return (
		<div>
			<header>Aptos Wallet Adapter Provider</header>
			
			<AptosWalletAdapterProvider
				plugins={ wallets }
				autoConnect={ true }
				dappConfig={{ network: Network.MAINNET }}
				onError={(error) => {
					console.log("error", error);
				}}
			>
				{ children }
			</AptosWalletAdapterProvider>
		</div>
	);
};