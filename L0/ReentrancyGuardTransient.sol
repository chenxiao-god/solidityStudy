// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ReentrancyGuardTransient{
    bytes32 constant SLOT = 0;

    modifier lock() {
      // 瞬态存储的使用避免了传统重入保护机制中对合约状态变量的频繁读写，可能会节省一定的 gas 费用。
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }  

}