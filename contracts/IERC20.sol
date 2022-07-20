// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns(uint);
    function transfer(address recipient, uint amount) external returns(bool);
    function allowance(address owner, address spender) external returns (uint); // 돈을보관
    function approve(address spender, uint amount) external returns(bool); // 위임장
    function transferFrom(address spender, address recipient, uint amount) external returns(bool); // 위임장가지고 돈보내기 
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

}

