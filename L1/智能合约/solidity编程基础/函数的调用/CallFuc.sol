//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract CallFuc{
    function callFuc() public{
    
    }
    function callFuc2() internal{
        
    }
    function callFuc3() private{
        
    }
    function callFuc4() public pure{
        
    }
   function callFuc5() public view{
      
   }
   function callFuc6() public payable{
      
   }

  function callFuc7() public pure returns(uint256){
    uint256 sum;
    for(uint256 i = 0; i<10; i++){
       if(i/2==0){
        sum += i;
       }
  }
     return sum;
    }

}
interface IExternalContract {
    function divide(uint256 a, uint256 b) external pure returns (uint256);
}
contract CallerContract {
    // 调用外部合约的 divide 函数并处理异常
    function callExternalDivide(address externalContractAddress, uint256 a, uint256 b) external pure returns (bool, uint256, string memory) {
        try IExternalContract(externalContractAddress).divide(a, b) returns (uint256 result) {
            // 调用成功，返回成功标志、结果和空错误信息
            return (true, result, "");
        } catch Error(string memory reason) {
            // 捕获带有错误消息的异常，返回失败标志、0 结果和错误消息
            return (false, 0, reason);
        } catch (bytes memory /*lowLevelData*/) {
            // 捕获其他类型的异常，返回失败标志、0 结果和通用错误信息
            return (false, 0, "Call failed without a reason");
        }
    }
}