const { expect } = require("chai");
const hre = require("hardhat");
describe("Shipping", function () {
  let shippingContract;
  before(async () => {
    // 部属合约
    shippingContract = await hre.ethers.deployContract("Shipping", []);
  }); it("should return the status Pending", async function () {
    // 检查状态是否为Pending
    expect(await shippingContract.Status()).to.equal("Pending");
  }); it("should return the status Shipped", async () => {
    //触发Shipped函数 修改状态为Shipped·
    await shippingContract.Shipped();
    // 检查状态是否为Shipped
    expect(await shippingContract.Status()).to.equal("Shipped");
  });
  it("should return correct event description", async () => {
    // 触发Delivered函数 修改状态为Delivered
    await expect(shippingContract.Delivered()) // 验证事件是否被触发 
      .to.emit(shippingContract, "LogNewAlert") // 验证事件的参数是否符合预期 
      .withArgs("Your package has arrived");
  });
}); 
