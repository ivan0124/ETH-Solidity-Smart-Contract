pragma solidity 0.4.22;
contract HelloWorld {

 address owner;
 string greetStr = "hello world";
 constructor() public {
 owner = msg.sender;
 }
 
 /****************************/
    struct Book { 
      string title;
      string author;
      uint book_id;
   }
   Book book;

   function setBook() public {
      book = Book('Learn Java', 'TP', 199);
   }
   function getBookId() public view returns (uint) {
      return book.book_id;
   }
 /****************************/
 uint256[] public numbers;// 動態長度陣列
 function addNumber(uint256 _number) external {
          numbers.push(_number);
 }
 function getNumber() external view returns (uint[]){
     return numbers;
 }
 /*****************************/
 string[] public user;// 動態長度陣列
 function add_user(string _user) external {
          user.push(_user);
 }
 
 function get_user(uint i) external view returns (string){
     return user[i];
 }
 /*******{*********************/
 
  uint storedData;
 
  function  set(uint x) public{
    storedData = x;
  }
  function get() public constant returns (uint) {
    return storedData;
  }
  
  function greet() external view returns (address) {
     if (msg.sender == owner) {
         //return strConcat(greetStr, " ", "boss111");
         return owner;
     } 
  }
  
  function balance_sender() external view returns (uint256) {
     
         return owner.balance;
    
  }

  function balance_this() external view returns (uint256) {
     
         return address(this).balance;
    
  }

 /*
 function greet() public constant returns (string) {
     if (msg.sender == owner) {
         //return strConcat(greetStr, " ", "boss111");
         return "111";
     } 
 }
 */
 
/*
event LogInt(string, int);
 function log(string s , int x) internal {
    emit LogInt(s, x);
}
*/

/*
 function strConcat(string _a, string _b, string _c) private pure returns
(string){
 bytes memory _ba = bytes(_a);
 bytes memory _bb = bytes(_b);
 bytes memory _bc = bytes(_c);

 string memory abcde = new string(_ba.length + _bb.length + _bc.length);
 bytes memory babcde = bytes(abcde);

 uint k = 0;
 for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
 for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
 for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i]; 

 return string(babcde);
 }
*/
} 
