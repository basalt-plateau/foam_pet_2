
import "@radix-ui/themes/styles.css";
import "./index.css";

import React from "react";
import ReactDOM from "react-dom/client";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";

import App from "@/App.tsx";
// Internal components
import { Toaster } from "@/components/ui/toaster.tsx";
import { WalletProvider } from "@/components/WalletProvider.tsx";
import { WrongNetworkAlert } from "@/components/WrongNetworkAlert";
import { Theme } from "@radix-ui/themes";



const queryClient = new QueryClient ();
const root_element = document.getElementById ("root");

ReactDOM.createRoot (root_element!).render(
	<React.StrictMode>
		<Theme>
			<WalletProvider>
				<QueryClientProvider client={ queryClient }>
					<App />
					<WrongNetworkAlert />
					<Toaster />
				</QueryClientProvider>
			</WalletProvider>
		</Theme>
	</React.StrictMode>,
);
