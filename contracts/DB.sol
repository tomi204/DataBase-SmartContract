// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DataBase {
    address public owner;

    mapping(address => bool) admin;

    //dev Constructor, set contract owner
    constructor() {
        owner = msg.sender;
    }

    //@dev function modifier for onlyAdmin
    modifier onlyAdmin() {
        require(admin[msg.sender] = true);
        _;
    }
}
