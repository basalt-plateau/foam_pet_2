

//
//
import { useCallback, useState } from "react";
import {
	AnyAptosWallet,
	isInstallRequired,
	WalletItem,
} from "@aptos-labs/wallet-adapter-react";
//
// Internal components
import { Button } from "@/components/ui/button";
//
//



export function WalletRow({ wallet, onConnect }) {
	return (
		<WalletItem
			wallet={wallet}
			onConnect={onConnect}
			className="flex items-center justify-between px-4 py-3 gap-4 border rounded-md"
		>
			<div className="flex items-center gap-4">
				<WalletItem.Icon className="h-6 w-6" />
				<WalletItem.Name className="text-base font-normal" />
			</div>
			{isInstallRequired(wallet) ? (
				<Button size="sm" variant="ghost" asChild>
					<WalletItem.InstallLink />
				</Button>
			) : (
				<WalletItem.ConnectButton asChild>
					<Button size="sm">Connect</Button>
				</WalletItem.ConnectButton>
			)}
		</WalletItem>
	);
}

export function AptosConnectWalletRow ({ wallet, onConnect }: WalletRowProps) {
	return (
		<WalletItem wallet={wallet} onConnect={onConnect}>
			<WalletItem.ConnectButton asChild>
				<Button size="lg" variant="outline" className="w-full gap-4">
					<WalletItem.Icon className="h-5 w-5" />
					<WalletItem.Name className="text-base font-normal" />
				</Button>
			</WalletItem.ConnectButton>
		</WalletItem>
	);
}