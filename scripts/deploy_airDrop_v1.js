const { ethers, upgrades } = require("hardhat");

async function main() {
    const TokenMinter = await ethers.getContractFactory("TokenMinter");
    console.log("Deploying TokenMinter...");

    const tokenMinter = await upgrades.deployProxy(TokenMinter, ["AirToken", "AIR"], {
        initializer: "initialize",
    });

    console.log("Proxy contract address (TokenMinter deployed to) : ", tokenMinter.address);
    console.log("Name : ", await tokenMinter.name());
    console.log("Symbol : ", await tokenMinter.symbol());
    console.log("totalSupply : ", await tokenMinter.totalSupply());
    console.log("balanceOf : ", await tokenMinter.balanceOf(tokenMinter.address));
}
main();






