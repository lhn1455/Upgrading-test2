
# Requirements

- node `v14.19.3`
- npm `v6.14.17`
- hardhat `v2.10.1`



# INSTALL

```
npm install
```



# USAGE


## Compile and Deploy Airdrop.sol

```
npx hardhat run --network rinkeby scripts/deploy_AirDrop_v1.js
```

## Verify Proxy Contract
```
npx hardhat verify --network rinkeby [Proxy Contract Address]
```
./openzeppelin/rinkeby.json "proxies" - "address" 확인   
or   
Etherscan에서 확인

## confirm the proxy contract

Etherscan > Proxy contact > More Options > Is this proxy? > Verify > Read ad Proxy & Write as Proxy

## Compile and upgrade Airdrop.sol -> AirDropV2.sol
```
npx hardhat run --network rinkeby scripts/upgrade_AirDrop_v2.js
```

## Verify AirDropV2 Contract
```
npx hardhat verify --network rinkeby [AirDropV2 Contract Address]
```

./openzeppelin/rinkeby.json "impls" - "두번째 address" 확인   // 첫번째 address : Airdrop.sol
or   
Etherscan에서 확인  


## check the proxy contract if it is change or not

Etherscan > Proxy contract > contract > Read ad Proxy & Write as Proxy