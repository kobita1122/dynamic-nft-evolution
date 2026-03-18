const hre = require("hardhat");

async function main() {
  const uris = [
    "ipfs://stage1-seed",
    "ipfs://stage2-sapling",
    "ipfs://stage3-tree"
  ];

  const DynamicNFT = await hre.ethers.getContractFactory("DynamicNFT");
  const nft = await DynamicNFT.deploy(uris);

  await nft.waitForDeployment();
  console.log(`DynamicNFT deployed to: ${await nft.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
