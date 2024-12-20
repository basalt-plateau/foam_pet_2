
/*
	import { Wallet_Chooser } from "@/Signatory/__Wallet_Chooser/Estate.tsx"
	<Wallet_Chooser />
*/

//
//
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
//
import {
	APTOS_CONNECT_ACCOUNT_URL,
	isAptosConnectWallet,
	truncateAddress,
	useWallet
} from "@aptos-labs/wallet-adapter-react";
import { Copy, LogOut, User } from "lucide-react";
import { useCallback, useState } from "react";
//
//
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import {
	DropdownMenu,
	DropdownMenuContent,
	DropdownMenuItem,
	DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { useToast } from "@/components/ui/use-toast";
//
//

import { Wallet_Chooser } from '@/Signatory/__Wallet_Chooser/Estate.tsx'
import { Button } from "@radix-ui/themes";



export const Wallet_Chooser_Opener = () => {
	const { toast } = useToast ();
	//	
	const { account, connected, disconnect, wallet } = useWallet ();
	//	
	const [ isDialogOpen, setIsDialogOpen ] = useState (false);
	const closeDialog = useCallback(() => {
		console.log ("closeDialogue");
		setIsDialogOpen (false);
	}, []);
	
	const disconnect_from_wallet = () => {
		console.log ("disconnect_from_wallet");
	}

	const copyAddress = useCallback (async () => {
		if (!account?.address) return;
		
		try {
			await navigator.clipboard.writeText (account.address);
			toast ({
				title: "Success",
				description: "Copied wallet address to clipboard.",
			});
		} 
		catch {
			toast ({
				variant: "destructive",
				title: "Error",
				description: "Failed to copy wallet address.",
			});
		}
	}, [ account?.address, toast ]);

	return connected ? (
		<DropdownMenu>
			<DropdownMenuTrigger asChild>
				<Button>{account?.ansName || truncateAddress(account?.address) || "Unknown"}</Button>
			</DropdownMenuTrigger>
			
			<DropdownMenuContent align="end">
				<DropdownMenuItem onSelect={copyAddress} className="gap-2">
					<Copy className="h-4 w-4" /> Copy address
				</DropdownMenuItem>
				
				{wallet && isAptosConnectWallet(wallet) && (
					<DropdownMenuItem asChild>
						<a href={APTOS_CONNECT_ACCOUNT_URL} target="_blank" rel="noopener noreferrer" className="flex gap-2">
							<User className="h-4 w-4" /> Account
						</a>
					</DropdownMenuItem>
				)}
				
				<DropdownMenuItem onSelect={disconnect} className="gap-2">
					<LogOut className="h-4 w-4" /> Disconnect
				</DropdownMenuItem>
			</DropdownMenuContent>
		</DropdownMenu>
	) : (
		<Dialog open={ isDialogOpen } onOpenChange={setIsDialogOpen}>
			<DialogTrigger asChild>
				<Button
					color="orange"
					variant="classic"
					size="4"
				>Connect a Wallet</Button>
			</DialogTrigger>
			
			<Wallet_Chooser 
				close={ closeDialog } 
			/>
		</Dialog>
	);
}


