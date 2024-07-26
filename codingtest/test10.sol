// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST10 {
    /*
        은행에 관련된 어플리케이션을 만드세요.
        은행은 여러가지가 있고, 유저는 원하는 은행에 넣을 수 있다. 
        국세청은 은행들을 관리하고 있고, 세금을 징수할 수 있다. 
        세금은 간단하게 전체 보유자산의 1%를 징수한다. 세금을 자발적으로 납부하지 않으면 강제징수한다. 

        * 회원 가입 기능 - 사용자가 은행에서 회원가입하는 기능
        * 입금 기능 - 사용자가 자신이 원하는 은행에 가서 입금하는 기능
        * 출금 기능 - 사용자가 자신이 원하는 은행에 가서 출금하는 기능
        * 은행간 송금 기능 1 - 사용자의 A 은행에서 B 은행으로 자금 이동 (자금의 주인만 가능하게)
        * 은행간 송금 기능 2 - 사용자 1의 A 은행에서 사용자 2의 B 은행으로 자금 이동
        * 세금 징수 - 국세청은 주기적으로 사용자들의 자금을 파악하고 전체 보유량의 1%를 징수함. 세금 납부는 유저가 자율적으로 실행. (납부 후에는 납부 해야할 잔여 금액 0으로)
        -------------------------------------------------------------------------------------------------
        * 은행간 송금 기능 수수료 - 사용자 1의 A 은행에서 사용자 2의 B 은행으로 자금 이동할 때 A 은행은 그 대가로 사용자 1로부터 1 finney 만큼 수수료 징수.
        * 세금 강제 징수 - 국세청에게 사용자가 자발적으로 세금을 납부하지 않으면 강제 징수. 은행에 있는 사용자의 자금이 국세청으로 강제 이동
    */

    struct Bank {
        string name;
        mapping(address => uint) balance;
    }

    mapping(address => Bank) public banks; 
    address[] public bankAddresses;
    mapping(address => bool) public registeredBanks;



    //회원 가입 기능 - 사용자가 은행에서 회원가입하는 기능
    function addUser(address bankAddress) public {

        require(registeredBanks[bankAddress], "Bank not registered");
        require(banks[bankAddress].balance[msg.sender] == 0, "User already registered");
        
        banks[bankAddress].balance[msg.sender] = 0;
    }

    //출금 기능 - 사용자가 자신이 원하는 은행에 가서 출금하는 기능
    function deposit(address bankAddress) public payable {
        require(registeredBanks[bankAddress], "Bank not registered");
        require(banks[bankAddress].balance[msg.sender] != 0 || msg.value > 0, "User not registered");

        banks[bankAddress].balance[msg.sender] += msg.value;
    }



}