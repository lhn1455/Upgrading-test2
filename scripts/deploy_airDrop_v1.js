const { ethers, upgrades } = require("hardhat");

async function main() {
    const TokenMinter = await ethers.getContractFactory("TokenMinter");
    const AirDrop = await ethers.getContractFactory("AirDrop");
    const Client = await ethers.getContractFactory("ClientAddress");
    console.log("Deploying contracts");

    
    const client = await Client.deploy();

    const airDrop = await upgrades.deployProxy(AirDrop, [ client.address ], {
        initializer: "initialize",
    });



    const tokenHolder = await TokenMinter.deploy("AirToken", "AIR", airDrop.address);
    const clientList = await airDrop.getClientAddress();
        for (let i =0; i < clientList.length; i++){
            console.log("clientListFromAirdop : ", clientList[i]);
            const balances = await tokenHolder.balanceOf(clientList[i]);
            console.log("balances : ", balances)
         
        }

    console.log("Proxy contract address (AirDrop deployed to) : ", airDrop.address);
    console.log("client : ", await tokenHolder.name());
    console.log("Symbol : ", await tokenHolder.symbol());
    console.log("totalSupply : ", await tokenHolder.totalSupply());
    console.log("balance of AirDrop contract : ", await tokenHolder.balanceOf(airDrop.address));
    console.log("balance Of tokenHolder: ", await airDrop.balanceOf(airDrop.address));
    await airDrop.doAirDrop(airDrop.address,15);

}
main();






