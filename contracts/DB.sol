// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DataBase {
    address public owner;
    
    struct user {
        string fullName;
        uint64 age;
        string email;
    }

    //dev Constructor, set contract owner
    constructor() {
        owner = msg.sender;
    }

    mapping(address => bool) admin; //admin mapping
    mapping(uint256 => mapping(address => user)) public member;
    //@dev function modifier for onlyAdmin
    modifier onlyAdmin() {
        require(admin[msg.sender] == true);
        _;
    }
    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }

    function singIn(
        address wallet,
        uint256 memId,
        string memory _fullName,
        uint64 _age,
        string memory _email
    ) public {
        require(wallet == msg.sender);        
        member[memId][wallet].fullName = _fullName;
        member[memId][wallet].age = _age;
        member[memId][wallet].email = _email;
    }

    function setAdmin(address _newAdmin) public onlyOwner{
        admin[_newAdmin] = true;
    }
     function deleteUser(address wallet, uint256 memId) external {
            delete member[memId][wallet];
    }
}
