


import React, { useState, useEffect, Component } from 'react';

import { useWallet } from "@aptos-labs/wallet-adapter-react";


// Internal Components
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { WalletDetails } from "@/components/WalletDetails";
import { NetworkInfo } from "@/components/NetworkInfo";
import { AccountInfo } from "@/components/AccountInfo";
import { TransferAPT } from "@/components/TransferAPT";
import { MessageBoard } from "@/components/MessageBoard";

//

import * as Truck_1 from '@/Truck_1'

import Leaf_Mercy from '@/Milieu/Leaves/Mercy'
import Leaf_Estate from '@/Milieu/Leaves/Estate/Gem'
import Leaf_Harvest from '@/Milieu/Leaves/Harvest/Estate'
import Leaf_Send from '@/Milieu/Leaves/Send'
import Leaf_Fleeting from '@/Milieu/Leaves/Fleeting/Estate'

import ErrorBoundary from '@/gems/Error_Boundary';

export class Leaf extends Component {
    constructor (props) {
        super (props);
		
        this.state = { 
			count: 0,
			show_leaf: "mercy"
		};
		
		this.open_mercy_leaf = this.open_mercy_leaf.bind (this);
		this.open_estate_leaf = this.open_estate_leaf.bind (this);
    }

	open_mercy_leaf () {
		this.Truck_1_Freight.leaf_name = "mercy";
	}
	open_estate_leaf () {
		this.Truck_1_Freight.leaf_name = "estate";
	}

    render () {
		let { show_leaf } = this.state;
		
		console.log ("Leaf rendering", { show_leaf });
		
        return (
			<div className="flex items-center justify-center flex-col">
				<ErrorBoundary>
					{ show_leaf === "estate" && (
						<Leaf_Estate />
					)}
					
					{ show_leaf === "send" && (
						<Leaf_Send />
					)}
					
					{ show_leaf === "Fleeting" && (
						<Leaf_Fleeting />
					)}
					
					{ show_leaf === "mercy" && (
						<Leaf_Mercy />
					)}
					
					{ show_leaf === "harvest" && (
						<Leaf_Harvest />
					)}
				</ErrorBoundary>
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
				// watch for changes to leaf_name
				if (target === original_freight && property === "leaf_name") {
					this.setState (() => ({
						show_leaf: value
					}));
				}
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
