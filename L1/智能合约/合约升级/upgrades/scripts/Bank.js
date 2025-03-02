const { ethers, upgrades } = require("hardhat");

async function main() { 
    // 部署 V1 合约
    const SimpleBankV1 = await ethers.getContractFactory("SimpleBankV1");
    const proxy = await upgrades.deployProxy(SimpleBankV1, [], { initializer: false });
    console.log("SimpleBankV1 deployed to:", proxy.target);
    // 建议增加区块确认等待
    await new Promise(resolve => setTimeout(resolve, 5000));
    // 升级到 V2 合约
    const SimpleBankV2 = await ethers.getContractFactory("SimpleBankV2");
    const upgraded = await upgrades.upgradeProxy(proxy.target, SimpleBankV2);
    console.log("SimpleBank upgraded to V2 at:", upgraded.target);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });