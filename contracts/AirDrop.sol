// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./ClientAddress.sol";


contract AirDrop is   Initializable{

    mapping(address => uint256) private _balances; 
    ClientAddress public clientAddress;



    event Transfer(address indexed from, address indexed to, uint256 value);


    // constructor(address payable contractAddress) {
    //     clientAddress = ClientAddress(contractAddress);
    // }
    

    function initialize (address payable contractAddress) external  {
        clientAddress = ClientAddress(contractAddress);
    }


    /*
    Airdrop function which take up a array of address, single token amount and eth amount and call the
    transfer function to send the token plus send eth to the address is balance is 0
   */
    function doAirDrop(address payable tokenHolder, uint256 _amount) external returns (bool) {
        
        uint count = clientAddress.getCount();
        
        address payable [] memory clientList = new address payable [](10);
        clientList = clientAddress.getClientAddress();
        for (uint256 i = 0; i < count; i++)
        {
            /* calling transfer function from contract */
            transfer(tokenHolder, clientList[i], _amount);
            
        }
    }


    function sendBath(address payable tokenHoler, address payable [] calldata _recipients, uint[] calldata _values) external returns (bool success) {
        require(_recipients.length == _values.length);
        for (uint i = 0; i <_values.length; i++) {
            transfer(tokenHoler, _recipients[i], _values[i]);
        }
        return true;
    }

    // function destroyContract (address payable _contract) external {
    //     selfdestruct(_contract);
    // }
    

    function getClientAddress() external view returns (address payable[] memory){
        return clientAddress.getClientAddress();
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address payable tokenHolder, address to, uint256 amount) public  returns (bool) {
        _transfer(tokenHolder, to, amount);
        return true;
    }
    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
    unchecked {
        _balances[from] = fromBalance - amount;
    }
        _balances[to] += amount;

        emit Transfer(from, to, amount);

    }

    function getTokenHolder(address account) public  {
       
        

    }
    function balanceOf(address account) public view  returns (uint256) {
        return _balances[account];
    }
    
}
