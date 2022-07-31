// scripts/upgrade_box_v2.js

const { ethers, upgrades } = require("hardhat");

const PROXY = "0x3cc3df0208fc222894475929F90c4C7677D3397b"; // 프록시 컨트랙트

async function main() {
    const BoxV2 = await ethers.getContractFactory("BoxV2");
    console.log("Upgrading Box...");
    await upgrades.upgradeProxy(PROXY, BoxV2);
    console.log("Box upgraded");
}

main();


