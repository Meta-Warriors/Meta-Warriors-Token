// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract MWT is ERC20PresetMinterPauser {

    uint256 private _cap;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply, uint256 _maxSupply, address _owner) 
        ERC20PresetMinterPauser(_name, _symbol) {
            require(_maxSupply > 0, "MWT: cap is 0");
            require(_maxSupply >= _initialSupply, "MWT: Initial Supply cannot be greater than Max");
            
            _cap = _maxSupply;
            mint(_owner, _initialSupply);
    }

   /**
     * @dev Returns the cap on the token's total supply.
     */
    function cap() public view virtual returns (uint256) {
        return _cap;
    }

    /**
     * @dev See {ERC20-_mint}.
     */
    function _mint(address account, uint256 amount) internal virtual override {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }
}