//jshint ignore: start

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

/************************************* Limited Supply ********************************************** */
contract MWT is ERC20PresetFixedSupply {

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply, address _owner) ERC20PresetFixedSupply(_name, _symbol, _initialSupply, _owner) {}

}