// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./ERC20.sol";

contract IngToken is ERC20{

    address public owner;
    uint256 public ethCanBuy = 100;

    constructor(string memory _name, string memory _symbol, uint256 _amount){
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
        mint(_amount * (10 ** uint256(decimals) ));
    }

    

    // 익명함수
    // SmartContract 

    // 익명함수
        //fallback 이더를 받지만 돈을 보내는행위 
        //receive 이더를 받는경우
    receive() external payable{
                        // 1000 ETH  * 200
        uint amount = msg.value * ethCanBuy;
        require(balances[owner] >= amount);
        balances[owner] -= amount;
        balances[msg.sender] += amount;

        emit Transfer(owner, msg.sender, amount);
    }
    
    /**
        {
            from:A
            to:CA
            data:
            value:10000000000
            v
            r
            s
        }
     */
}