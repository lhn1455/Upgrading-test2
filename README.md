
1. 패키지 설치
```
npm i @nomiclabs/hardhat-ethers @nomiclabs/hardhat-etherscan @openzeppelin/hardhat-upgrades ethers hardhat
```
```
npm i -D @openzeppelin/contracts @openzeppelin/contracts-upgradeable
```

2. Logic contract AirDrop.sol 작성
3. Upgradable contract 함수를 이용해서 배포스크립트 **deploy_airDrop_v1.js**작성 
4. 첫번째 배포
    ```
   npx hardhat run --network rinkeby scripts/deploy_airDrop_v1.js
   ```
5. 검증
   ```
   npx hardhat verify --network rinkeby [proxy 주소]
   ```
6. Logic contract BoxV2 작성
7. 업그레이드 배포 스크립트 **upgrade_AirDrop_v2.js**작성
8. 두번째 배포
    ```
   npx hardhat run --network rinkeby scripts/upgrade_AirDrop_v2.js
   ```
9. 검증
    ```
    npx hardhat verify --network rinkeby [AirDrop contract 주소]
    ```
