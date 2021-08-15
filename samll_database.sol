pragma solidity 0.4.22;
contract small_database {


 constructor() public {
  //owner = msg.sender;
 }
 
 mapping(string => string) database;
 
 function add_user(string _user, string _userdata) external {
     database[_user]=_userdata;
 }
 
 function get_user(string _user) external view returns (string){
     return  database[_user];
 }
 

} 