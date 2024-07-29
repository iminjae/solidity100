// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST11 {
    /*
        로또 프로그램을 만드려고 합니다. 
        숫자와 문자는 각각 4개 2개를 뽑습니다. 6개가 맞으면 1이더, 5개의 맞으면 0.75이더, 
        4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

        참가 금액은 0.05이더이다.

        예시 1 : 8,2,4,7,D,A
        예시 2 : 9,1,4,2,F,B
    */

    //[6,1,5,8]
    //["M","J"]

    //[7,4,2,5]
    //["J","C"]
    


    struct Ticket {
        uint[4] num;
        string[2] str;
    }
    
    mapping(address => Ticket) tickets;

    uint[4] public winNum;
    string[2] public winStr;

    function chkMyLotto() public view returns(uint[4] memory, string[2] memory) {

        Ticket memory myTicket = tickets[msg.sender];

        return (myTicket.num, myTicket.str);
    }

    function buyLotto(uint[4] memory _num, string[2] memory _str) public payable {
        require(msg.value == 0.05 ether);

        tickets[msg.sender] = Ticket(ascNum(_num), ascStr(_str));
    }

    function stratrLotto(uint[4] memory _num, string[2] memory _str) public {

        winNum = ascNum(_num);
        winStr = ascStr(_str);
    }

    function chkLotto() public {

        Ticket memory playerTicket = tickets[msg.sender];
        uint correctLotto = 0;



        for (uint i = 0; i < 4; i++) {
            if (playerTicket.num[i] == winNum[i]) {
                correctLotto++;
            }
        }

        for (uint i = 0; i < 2; i++) {
            if (keccak256(abi.encodePacked(playerTicket.str[i])) == keccak256(abi.encodePacked(winStr[i]))) {
                correctLotto++;
            }
        }

        uint eth = 0;

        if (correctLotto == 6) {
            eth = 1 ether;
        } else if (correctLotto == 5) {
            eth = 0.75 ether;
        } else if (correctLotto == 4) {
            eth = 0.25 ether;
        } else if (correctLotto == 3) {
            eth = 0.1 ether;
        }

        payable(msg.sender).transfer(eth);

    }


    function ascNum(uint[4] memory _num) public pure returns(uint[4] memory) {

        for(uint i=0; i<_num.length; i++) {
            for(uint j=i+1; j<_num.length; j++) {
                if(_num[i] > _num[j]) {
                    (_num[i], _num[j]) = (_num[j], _num[i]);
                }
            }
        }

        uint[4] memory num = _num;

        return num;
    }

    function ascStr(string[2] memory _str) public pure returns(string[2] memory) {
        
        for (uint256 i = 0; i < _str.length - 1; i++) {
            for (uint256 j = 0; j < _str.length - i - 1; j++) {
                if (keccak256(abi.encodePacked(_str[j])) < keccak256(abi.encodePacked(_str[j + 1]))) {
                    string memory temp = _str[j];
                    _str[j] = _str[j + 1];
                    _str[j + 1] = temp;
                }
            }
        }

        string[2] memory str = _str;

        return str;
    }


}