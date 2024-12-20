
//
import { WalletCore } from "@aptos-labs/wallet-adapter-core";
//
import React, { Component, useState, useEffect } from 'react';
import { User } from "lucide-react";
import { Flex, Text, Button } from "@radix-ui/themes";
//
//
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
//
//
import * as Truck_1 from '@/Truck_1'
import { WalletSelector } from "@/gems/Wallet_Selector/Gem.tsx";
import { aptosClient } from "@/utils/aptosClient";
//
import { connect_to_signatory } from "@/Signatory/connect"
import { is_connected } from "@/Signatory/is_connected"
//	
	
class Harvest extends Component {
    constructor (props) {
        super (props);
        this.state = { 
			count: 0,
			
			account: {},
			network: {},
			wallet: {}
		};

		this.on = this.on.bind (this);

		this.connect = this.connect.bind (this);
		this.disconnect = this.disconnect.bind (this);
		
		this.send = this.send.bind (this);		
    }
	
	async on () {
		const wallet_link = this.Truck_1_Freight.wallet_link;
		const { account, network, wallet, wallets } = wallet_link;
		
		console.log ("on:", { wallets });
		
		this.setState ({
			connected: wallet_link.isConnected () ? "yes" : "no",
			
			account,
			network,
			wallet,
			wallets
		});
	}
	
	async send () {
		const wallet_link = this.Truck_1_Freight.wallet_link;
		const client = wallet_link;
		
		// const sender = 0x1;
		const recipient = "991378D74FAC384404B971765BEF7525CCE26C8EFD84B9FF27D202E10D7FFBE5";
		const AptosCoin_Amount = Math.pow(10, 8) * 1;
		
		const adaptation_petition = await client.signAndSubmitTransaction ({
			data: {
				function: "0x1::coin::transfer",
				typeArguments: [
					"0x1::aptos_coin::AptosCoin"
				],
				functionArguments: [
					recipient, 
					AptosCoin_Amount
				],
			}
		});
		
		const blockchain_adaptation = await aptosClient ().waitForTransaction({
			transactionHash: adaptation_petition.hash
		});
		
		console.log ({ blockchain_adaptation });

	}
	
	async connect () {
		console.log ("connect");
		
		const wallet_link = this.Truck_1_Freight.wallet_link;
		console.log ({ connected: wallet_link.isConnected () });
		
		
		await connect_to_signatory ({ 
			wallet_link,
			wallet_name: "Petra"
		});
		
		const { account, network, wallet } = wallet_link
		console.log ({ connected: wallet_link.isConnected () });

		this.setState ({
			connected: wallet_link.isConnected () ? "yes" : "no",
			
			account,
			network,
			wallet
		});
		
		console.log ({ account, network, wallet });

		console.info (wallet_link);
	}
	
	async disconnect () {
		console.log ("connect");		
		
		const wallet_link = this.Truck_1_Freight.wallet_link;
		console.info ("disconnect", { wallet_link });

		await wallet_link.disconnect ();
		
		this.setState ({
			connected: wallet_link.isConnected () ? "yes" : "no"
		});
	}	

    render () {
		const { 
			connected, 
			
			account, 
			network, 
			wallet,
			wallets
		} = this.state;
		
		const renderFruits = () => {
			if (Array.isArray (wallets) !== true) {
				return []
			}
			
			console.log ({ wallets });
			
			const fruitItems = [];
			for (let i = 0; i < wallets.length; i++) {
				fruitItems.push (
					<li key={i}>{ wallets [i].name }</li>
				);
			}
			
			return fruitItems;
		};
		
        return (
            <div className="flex items-center justify-between px-4 py-2 max-w-screen-xl mx-auto w-full flex-wrap">
				<CardHeader>
					<CardTitle
						style={{
							"padding": "1cm",
							"fontSize": "2em"
						}}
					>Harvest</CardTitle>
					
					<div>
						{ renderFruits() }
					</div>
					
					<div>
						<Button 
							variant="classic"
							size="4"
							onClick={ this.connect }
						>Connect</Button>
					</div>
					
					<div>
						<Button 
							variant="classic"
							size="4"
							onClick={ this.disconnect }
						>Disconnect</Button>
					</div>
					
					<div>
						<Button 
							variant="classic"
							size="4"
							onClick={ this.send }
						>Send</Button>
					</div>
					
					<p>connected: { connected }</p>
					
					{ connected === "yes" &&
						<div>
							<Card>
								<CardContent className="flex flex-col gap-1 pt-6">
									<h1>Account</h1>
									<div>address: { account.address }</div>
									<div>public key: { account.publicKey }</div>	
								</CardContent>
							</Card>
							
							<Card>
								<CardContent className="flex flex-col gap-1 pt-6">
									<h1>Network</h1>
									<div>chainId: { network.chainId }</div>
									<div>name: { network.name }</div>
									<div>url: { network.url }</div>
								</CardContent>
							</Card>
							
							<Card>
								<CardContent className="flex flex-col gap-1 pt-6">
									<h1>Wallet</h1>
									<div>name: { wallet.name }</div>
									<div>url: { wallet.url }</div>
									<img src={wallet.icon} alt={wallet.name} width={24} height={24} />
								</CardContent>
							</Card>
						</div>
					}
					
				</CardHeader>
			</div>
        );
    }
	
	componentDidMount () {
		this.Truck_1_Freight = Truck_1.retrieve ().freight;
		this.Truck_1_Monitor = Truck_1.monitor (async ({
			original_freight,
			pro_freight, 
			//
			target,
			//
			property, 
			value
		}) => {
			try {

			}
			catch (imperfection) {
				console.error (imperfection);
			}
		});	
		
		this.on ();
	}
	
	componentWillUnmount () {
		this.Truck_1_Monitor.stop ()
	}
}



export default Harvest;