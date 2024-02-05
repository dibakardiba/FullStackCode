
import React, { useState } from "react";
import Web3 from "web3";
import WalletConnectProvider from "@walletconnect/web3-provider";

const AirdropPage = () => {
    const [web3, setWeb3] = useState(null);

    const connectMetaMask = async () => {
        try {
            if (window.ethereum) {
                const provider = window.ethereum;
                await provider.request({ method: "eth_requestAccounts" });
                const web3Instance = new Web3(provider);
                setWeb3(web3Instance);
                console.log("Connected to MetaMask:", web3Instance);
            } else {
                alert("MetaMask not detected. Please install MetaMask.");
            }
        } catch (error) {
            console.error("Error connecting MetaMask:", error);
        }
    };

    return (
        <div>
            <h1>Airdrop Page</h1>
            <button onClick={connectMetaMask}>Connect MetaMask</button>
            {/* Add further UI components as needed */}
        </div>
    );
};

export default AirdropPage;
