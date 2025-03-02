// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Hello {
    // 销毁合约 发送所有余额到指定地址
    // function hello(address _address) public pure {
    //     selfdestruct(payable(_address));
    // }
    // // 获取合约信息
    // function getContractInfo()
    //     public
    //     pure
    //     returns (string memory, bytes memory, bytes memory)
    // {
    //     return (
    //         type(Hello).name,
    //         type(Hello).creationCode,
    //         type(Hello).runtimeCode
    //     );
    // }

    function cheackContract(address _address) public view returns (bool) {
        uint256 size;
    assembly{
         size := extcodesize(_address)
    }
     return size>0;
    }
}
