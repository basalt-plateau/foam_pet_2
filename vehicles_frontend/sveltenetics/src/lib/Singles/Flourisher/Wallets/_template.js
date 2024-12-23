
/*
	import { create_wallet_template } from "$lib/Singles/Flourisher/Wallets/_template.js"
	create_wallet_template ()
*/


/*
	from tests:
	https://github.com/aptos-labs/aptos-wallet-adapter/blob/6da7c3874dfa72388fa2582c4712c1ce23818058/packages/wallet-adapter-core/src/__tests__/WalletCore.test.ts
*/
export const create_wallet_template = () => {
	const signMessageResponseMock = {
		fullMessage: "",
		message: "message",
		nonce: Date.now().toString(),
		prefix: "APTOS",
		signature: "",
	};

	const mockSignMessagePayload = {
		message: "my-message",
		nonce: Date.now().toString(),
	};
	
	/*
	const connectMock = jest.fn (() => Promise.resolve(console.log("connect")));
	const disconnectMock = jest.fn(() =>
		Promise.resolve(console.log("disconnect"))
	);
	const networkMock = jest.fn(() => Promise.resolve(console.log("network")));
	const signAndSubmitTransactionMock = jest.fn((transaction, options?) =>
		Promise.resolve({ hash: "signAndSubmitTransactionMock" })
	);
	const signMessageMock = jest.fn((message) =>
		Promise.resolve(signMessageResponseMock)
	);

	const onNetworkChangeeMock = jest.fn((callback: any) =>
		Promise.resolve(console.log("onNetworkChange"))
	);
	const onAccountChangeMock = jest.fn((callback: any) =>
		Promise.resolve(console.log("onAccountChangeMock"))
	);
	*/
	
	const walletMock = {
		name: "wallet-name",
		url: "my-url",
		icon: `data:image/png;base64,uri`,
		provider: {},
		connect: async () => {
			console.log ("connected!");
		},
		disconnect: async () => {
			console.log ("disconnect!");
		},
		network: async () => {
			console.log ("network!");
		},
		signAndSubmitTransaction: async () => {
			console.log ("signAndSubmitTransaction!");
			
			Promise.resolve({ hash: "signAndSubmitTransactionMock" })
		},
		signMessage: async () => {
			console.log ("signMessage");
		},
		onNetworkChange: async () => {
			console.log ("onNetworkChange");
		},
		onAccountChange: async () => {
			console.log ("onAccountChange");
		}
	};

	return walletMock;
}


