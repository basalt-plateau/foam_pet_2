

/*
	https://aptos.dev/en/build/sdks/wallet-adapter/dapp
*/
//
//
import { useCallback, useState } from "react";
import { groupAndSortWallets, useWallet, WalletItem	 } from "@aptos-labs/wallet-adapter-react";
import { ArrowLeft, ArrowRight, ChevronDown, Copy, LogOut, User } from "lucide-react";
//
// 
import { Button } from "@/components/ui/button";
import { Collapsible, CollapsibleContent, CollapsibleTrigger } from "@/components/ui/collapsible";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
//
import { create_wallet_link } from "@/Signatory"
import { connect_to_signatory } from "@/Signatory/connect"
//
//
import { WalletRow, AptosConnectWalletRow } from './Row/Estate.tsx'
//
//


		

export const Wallet_Chooser = ({ close }) => {
	const { wallets = [] } = useWallet ();
	const { aptosConnectWallets, availableWallets, installableWallets } = groupAndSortWallets (wallets);

	const connect_wallet = async ({ name, wallet }) => {
		const wallet_link = create_wallet_link ();
		await connect_to_signatory ({ wallet_link, wallet_name: name });
		
		console.info ("wallet_link:", { wallet_link });
		close ();
	}
	

	return (
		<DialogContent className="max-h-screen overflow-auto">
			<div className="flex flex-col gap-3 pt-3">
				{ availableWallets.map ((wallet) => (
					<Card key={ wallet.name } >
						<CardContent className="flex flex-col gap-1 pt-4">
							<p>name: { wallet.name }</p>
							<p>wallet: </p>
							<Button
								onClick={() => {
									connect_wallet ({
										name: wallet.name,
										wallet
									});
								}}
							>Connect</Button>
						</CardContent>
					</Card>
				))}
			
				{ availableWallets.map ((wallet) => (
					<WalletRow 
						key={ wallet.name } 
						wallet={ wallet } 
						
						onConnect={ close } 
					/>
				))}
				
				{ installableWallets.map((wallet) => (
					<WalletRow 
						key={ wallet.name } 
						wallet={ wallet } 
						
						onConnect={ close }  
					/>
				))}
			</div>
		</DialogContent>
	);
}


