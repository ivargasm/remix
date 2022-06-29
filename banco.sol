// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Banco {
    address owner; // variable de estado para el dueño

    constructor() payable { //inicializa las variables de estado
        owner = msg.sender;
    }

    modifier onlyOwner { //modificador para funciones que solo el dueño pueda ejecutar
        require(msg.sender == owner);
        _;
    }

    function newOwner(address _newOwner) public onlyOwner { // funcion para poder cambiar el dueño del contrato
        owner = _newOwner;
    }

    function getOwner() view public returns(address) { // obtener quien es el dueño del contrato solo el dueño del contrato lo puede hacer
        return owner;
    }

    function getBalance() view public returns(uint256) { // obtener balance del contrato
        return address(this).balance;
    }

    function incrementBalance(uint256 amount) payable public { // incrementar el balance del contrato cualquiera puede hacer
        require(msg.value == amount);
    }

    function withdrowBalance() public onlyOwner { // retirar los fondos del contrato solo el dueño lo puede hacer
        payable(msg.sender).transfer(address(this).balance); 
    }
}