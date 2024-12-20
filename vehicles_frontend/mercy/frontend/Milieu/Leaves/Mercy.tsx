




import React, { Component, useState, useEffect } from 'react';
import * as Truck_1 from '@/Truck_1'

import { WalletSelector } from "@/gems/Wallet_Selector/Gem.tsx";

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

import { Flex, Text, Button } from "@radix-ui/themes";
import { WalletCore } from "@aptos-labs/wallet-adapter-core";

export default class Header extends Component {
    constructor (props) {
        super (props);
        this.state = { 
			count: 0 
		};
    }

    render () {
		const { leaf_name } = this.state;
		
		console.log ({ WalletCore });
		
        return (
            <div className="flex items-center justify-between px-4 py-2 max-w-screen-xl mx-auto w-full flex-wrap">
				<CardHeader>
					<CardTitle
						style={{
							"padding": "1cm",
							"fontSize": "2em"
						}}
					>Mercy</CardTitle>
					
					<div>
						<Button 
							variant="classic"
							size="4"
							onClick={() => {}}
						>Join</Button>
						
						<Button 
							variant="classic"
							size="4"
							onClick={() => {}}
						>Leave</Button>
					</div>
					
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
	}
	
	componentWillUnmount () {
		this.Truck_1_Monitor.stop ()
	}
}
