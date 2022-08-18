const { ethers, hre } = require("hardhat");

async function main() {
    const TokenMinter = await ethers.getContractFactory("TokenMinter");
    console.log("Deploying TokenMinter...");

    const tokenMinter = await TokenMinter.deploy("AirToken", "AIR");

    console.log("TokenMinter Address : ", tokenMinter.address);
    console.log("Name : ", await tokenMinter.name());
    console.log("Symbol : ", await tokenMinter.symbol());
    console.log("totalSupply : ", await tokenMinter.totalSupply());
    console.log("balanceOf : ", await tokenMinter.balanceOf(tokenMinter.address));
}
main();






