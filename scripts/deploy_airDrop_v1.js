const { ethers, upgrades } = require("hardhat");

async function main() {
    const TokenMinter = await ethers.getContractFactory("TokenMinter");
    const AirDrop = await ethers.getContractFactory("AirDrop");
    const Client = await ethers.getContractFactory("ClientAddress");
    console.log("Deploying contracts");

    
    const client = await Client.deploy();
    const tokenMinter = await TokenMinter.deploy("AirToken", "AIR");

    const airDrop = await upgrades.deployProxy(AirDrop, [ client.address, tokenMinter.address ], {
        initializer: "initialize",
    });

    

    const clientList = await airDrop.getClientAddress();
        for (let i =0; i < clientList.length; i++){
            console.log("clientListFromAirdop : ", clientList[i]);
<<<<<<< HEAD
            const balances = await tokenHolder.balanceOf(clientList[i]);
            console.log("balances : ", balances)
          
=======
            const beforeBalances = await tokenMinter.balanceOf(clientList[i]);
            console.log("beforeBalances : ", beforeBalances);
         
>>>>>>> fc36f24e6df98ac3356f50e179be54143293c8f8
        }

    console.log("Proxy contract address (AirDrop deployed to) : ", airDrop.address);
    console.log("logicContract-AirDrop.sol address :  ", AirDrop.address )
    console.log("client : ", await tokenMinter.name());
    console.log("Symbol : ", await tokenMinter.symbol());
    console.log("totalSupply : ", await tokenMinter.totalSupply());
    console.log("beforeBalance Of tokenHolder: ", await airDrop.getTokenMinterBalance(tokenMinter.address));
    // await airDrop.doAirDrop(tokenMinter.address,15); 

   
    for (let i =0; i < clientList.length; i++){
        console.log("clientListFromAirdop : ", clientList[i]);
        const afterBalances = await tokenMinter.balanceOf(clientList[i]);
        console.log("afterBalances : ", afterBalances)
    }
    console.log("Afterbalance Of tokenHolder: ", await airDrop.getTokenMinterBalance(tokenMinter.address));

}
main();







