// SPDX-License-Identifier: MIT

pragma solidity = 0.8.11;

interface data_base {
    function add_user(string memory _user, string memory _userdata) external;
    function get_user(string memory _user) external view returns (string memory);
}

contract EtherWallet{
    address payable public owner;
    data_base d = data_base(0x13CE26383e9cD3a7b8dD66874c47c5d8293c2239); //add small_database address

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable{}

    function withdraw(uint _amount) external{
        require(msg.sender == owner, "Only the onwer can call this method" );
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

     function add(string memory _user, string memory _userdata) external{
         d.add_user(_user,  _userdata);
     }

     function get(string memory _user) external view returns ( string memory data){
         return  d.get_user(_user);
     }
}
