// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

import "./IERC20.sol";

contract ERC20 is IERC20{

    string public name;
    string public symbol;
    uint8 public decimals = 18;

    uint public override totalSupply;
    mapping(address => uint) public balances;
    mapping(address=> mapping(address=>uint)) public override allowance;
    // allowance[account][account] = 3000

    function balanceOf(address account) view override external returns (uint) {
        return balances[account];
    }     

    function transfer(address recipient, uint amount) external override returns(bool) {
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;   
    }

    
    // A, B, C 
    // A 10000 B 5000

    // A  approve(b,5000)
    function approve(address spender, uint amount) external override returns (bool){
        //           A           B       5000
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // B                            A                C            1000
    function transferFrom(address sender, address recipient, uint amount) external override returns (bool) {
        require(allowance[sender][msg.sender] < amount);
                // A          B            1000   4000
        allowance[sender][msg.sender] -= amount;
        //        A          10000 - 1000 9000
        balances[sender] -= amount;
        //          C           1000
        balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint amount) internal {
        balances[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // 총발행량 
    function burn(uint amount) external {
        balances[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}