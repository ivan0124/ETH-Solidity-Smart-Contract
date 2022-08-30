// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

interface data_base {
    function add_user(string memory _user, string memory _userdata) external;
    function get_user(string memory _user) external view returns (string memory);
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract EtherWallet{
    address payable public owner;
    data_base d = data_base(0x13CE26383e9cD3a7b8dD66874c47c5d8293c2239); //add small_database address
    IERC20 usdt = IERC20(0xB404c51BBC10dcBE948077F18a4B8E553D160084);

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

    /**/
    function USDTwithdraw(uint256 _amount) external{
        require(msg.sender == owner, "Only the onwer can call this method" );
        usdt.transfer(0x4E8a1A4f84477e8dCAa33dA48dca002b5C2BdD03, _amount );
    }

    function getUSDTBalance() external view returns (uint256) {
        return usdt.balanceOf(address(this));
    }
     
     function add(string memory _user, string memory _userdata) external{
         d.add_user(_user,  _userdata);
     }

     function get(string memory _user) external view returns ( string memory data){
         return  d.get_user(_user);
     }
     
}
