// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./ClientAddress.sol";


contract AirDrop is  Ownable, Initializable{

    mapping(address => uint256) private _balances; // 여기부터
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
    function doAirDrop(uint256 _amount) onlyOwner external returns (bool) {
        
        uint count = clientAddress.getCount();
        address payable [] memory clientList = new address payable [](10);
        clientList = clientAddress.getClientAddress();
        for (uint256 i = 0; i < count; i++)
        {
            /* calling transfer function from contract */
            transfer(clientList[i], _amount);
            
        }
    }


    function sendBath(address payable [] calldata _recipients, uint[] calldata _values) onlyOwner external returns (bool success) {
        require(_recipients.length == _values.length);
        for (uint i = 0; i <_values.length; i++) {
            transfer(_recipients[i], _values[i]);
        }
        return true;
    }

    function destroyContract (address payable _contract) onlyOwner external {
        selfdestruct(_contract);
    }
    

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
    function transfer(address to, uint256 amount) public  returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
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
}
