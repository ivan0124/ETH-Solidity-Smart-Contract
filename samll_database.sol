// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

/*
interface data_base {
    function add_user(string memory _user, string memory _userdata) external;
    function get_user(string memory _user) external view returns (string memory);
}
*/

contract small_database {

 //constructor() public {
  //owner = msg.sender;
 //}
 
 mapping(string => string) database;
 
 function add_user(string memory _user, string memory _userdata) external {
     database[_user]=_userdata;
 }
 
 function get_user(string memory _user) external view returns ( string memory data){
     return  database[_user];
 }
 

} 
