// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");
const {ethers} = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("Whitelist");
  // 인스턴스 초기화시 받는 maxWhitelist 수
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // 배포가 완료될때까지 대기
  await deployedWhitelistContract.deployed();

  console.log("Whitelist Contract Address: ", deployedWhitelistContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
