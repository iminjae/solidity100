// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Q61 {
    /*
        a의 b승을 반환하는 함수를 구현하세요.
    */

    function get(uint a, uint b)public pure returns(uint) {
        return a ** b;
    }
}

contract Q62 {
    /*
        2개의 숫자를 더하는 함수, 곱하는 함수 a의 b승을 반환하는 함수를 구현하는데
        3개의 함수 모두 2개의 input값이 10을 넘지 않아야 하는 조건을 최대한 효율적으로 구현하세요.
    */

    modifier checkNum(uint a, uint b) {
        require(a < 10 && b < 10);
        _;
    }

    function add(uint a, uint b) public pure checkNum(a, b) returns(uint) {
        
        return a + b;
    }

    function mul(uint a, uint b) public pure checkNum(a, b) returns(uint) {
        
        return a * b;
    }

    function pow(uint a, uint b) public pure checkNum(a, b) returns(uint) {
        
        return a ** b;
    }
}

contract Q63 {
    /*
        2개 숫자의 차를 나타내는 함수를 구현하세요.
    */

    function sub(uint a, uint b) public pure returns(uint) {
        return a - b;
    }
}

contract Q64 {
    /*
        지갑 주소를 넣으면 5개의 4bytes로 분할하여 반환해주는 함수를 구현하세요.
    */

    function addressToBytes(address adres) public pure returns(bytes4[5] memory) {
        
        bytes20 addressByte = bytes20(adres);
        bytes4[5] memory resultArr;

        resultArr[0] = bytes4(abi.encodePacked(addressByte[0], addressByte[1], addressByte[2],addressByte[3]));
        resultArr[1] = bytes4(abi.encodePacked(addressByte[4], addressByte[5], addressByte[6],addressByte[7]));
        resultArr[2] = bytes4(abi.encodePacked(addressByte[8], addressByte[9], addressByte[10],addressByte[11]));
        resultArr[3] = bytes4(abi.encodePacked(addressByte[12], addressByte[13], addressByte[14],addressByte[15]));
        resultArr[4] = bytes4(abi.encodePacked(addressByte[16], addressByte[17], addressByte[18],addressByte[19]));

        return resultArr;
    }

}

contract Q65 {
    /*
        숫자 3개를 입력하면 그 제곱을 반환하는 함수를 구현하세요.
        그 3개 중에서 가운데 출력값만 반환하는 함수를 구현하세요.
        예) func A : input → 1,2,3 // output → 1,4,9 | func B : output 4 (1,4,9중 가운데 숫자)
    */

    function A(uint a, uint b, uint c) public pure returns(uint, uint , uint) {

        return (a*a,b*b,c*c);
    }

    function B(uint a, uint b, uint c) public pure returns(uint) {
        
        return b;
    }
}

contract Q66 {
    /*
        특정 숫자를 입력했을 때 자릿수를 알려주는 함수를 구현하세요. 
        추가로 그 숫자를 5진수로 표현했을 때는 몇자리 숫자가 될 지 알려주는 함수도 구현하세요.
    */

    function A(uint a)public pure returns(uint) {

         bytes memory numberString = abi.encodePacked(a);

        return numberString.length;
    }
}

contract A {

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}
}

contract Q67 { //B
    /*
        자신의 현재 잔고를 반환하는 함수를 보유한 Contract A와 다른 주소로 돈을 보낼 수 있는 Contract B를 구현하세요.
        B의 함수를 이용하여 A에게 전송하고 A의 잔고 변화를 확인하세요.
    */

    function sendEther(address payable recipient) public payable {
        require(msg.value > 0, "0 ether");
        recipient.transfer(msg.value);
    }
}

contract Q68 {
    /*
        계승(팩토리얼)을 구하는 함수를 구현하세요.
        계승은 그 숫자와 같거나 작은 모든 수들을 곱한 값이다. 
        예) 5 → 1*2*3*4*5 = 60, 11 → 1*2*3*4*5*6*7*8*9*10*11 = 39916800
        while을 사용해보세요
    */

    function A(uint a) public pure returns(uint) {
        
      uint result = 1;

       for(uint i = 1; i <= a; i++){

            result *= i;
       }

       return result;
    }
}

contract Q69 {
    /*
        숫자 1,2,3을 넣으면 1 and 2 or 3 라고 반환해주는 함수를 구현하세요.
        힌트 : 7번 문제(시,분,초로 변환하기)
    */

    function A(uint a, uint b, uint c) public pure returns(string memory) {
        
        return string(abi.encodePacked(Strings.toString(a), "and ", Strings.toString(b), "or ", Strings.toString(c)));
    }
}

contract Q70 {
    /*
        번호와 이름 그리고 bytes로 구성된 고객이라는 구조체를 만드세요.
        bytes는 번호와 이름을 keccak 함수의 input 값으로 넣어 나온 output값입니다.
        고객의 정보를 넣고 변화시키는 함수를 구현하세요. 
    */

    struct User {
        uint number;
        string name;
        bytes info;
    }

    User user;

    function A(uint _number, string memory _name) public {
         user = User(_number, _name, abi.encodePacked(keccak256(abi.encodePacked(_number, _name))));
    }
}