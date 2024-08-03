// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Q91 {
    /*
        배열에서 특정 요소를 없애는 함수를 구현하세요. 
        예) [4,3,2,1,8] 3번째를 없애고 싶음 → [4,3,1,8]
    */

    uint[] public  arr;

    function A(uint a) public {
        
        for (uint i = a; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }
}

contract Q92 {
    /*
        특정 주소를 받았을 때, 그 주소가 EOA인지 CA인지 감지하는 함수를 구현하세요.
    */

    function A(address adres) public view returns(bool) {

        uint size;

        assembly {
            size := extcodesize(adres)
        }

        if(size > 0){
            return true;
        }

        return false;
    }
}

contract Q93 {
    /*
        다른 컨트랙트의 함수를 사용해보려고 하는데, 그 함수의 이름은 모르고 methodId로 추정되는 값은 있다.
        input 값도 uint256 1개, address 1개로 추정될 때 해당 함수를 활용하는 함수를 구현하세요.
    */
}

contract Q94 {
    /*
        inline - 더하기, 빼기, 곱하기, 나누기하는 함수를 구현하세요.
    */

    function add(uint a, uint b) public pure returns (uint) {

        uint result;

        assembly {
            result := add(a, b)
        }

        return result;
    }

    function sub(uint a, uint b) public pure returns (uint) {

        uint result;

        assembly {
            result := sub(a, b)
        }

        return result;
    }

    function mul(uint a, uint b) public pure returns (uint) {

        uint result;

        assembly {
            result := mul(a, b)
        }
        
        return result;
    }

    function div(uint a, uint b) public pure returns (uint) {

        uint result;

        assembly {
            result := div(a, b)
        }

        return result;
    }
}

contract Q95 {
    /*
        inline - 3개의 값을 받아서, 더하기, 곱하기한 결과를 반환하는 함수를 구현하세요.
    */

    function A(uint a, uint b, uint c) public pure returns (uint result1, uint result2) {

        assembly {
            result1 := add(add(a, b), c)     
            result2 := mul(mul(a, b), c)  
        }

        // return (result1, result2);
    }
}

contract Q96 {
    /*
        inline - 4개의 숫자를 받아서 가장 큰수와 작은 수를 반환하는 함수를 구현하세요.
    */

    function A(uint a, uint b, uint c, uint d) public pure returns (uint min, uint max) {

        assembly {

            min := a
            max := a

            if lt(b, min) { min := b }
            if gt(b, max) { max := b }

            if lt(c, min) { min := c }
            if gt(c, max) { max := c }

            if lt(d, min) { min := d }
            if gt(d, max) { max := d }
        }

        return (min, max);
    }
}

contract Q97 {
    /*
        inline - 상태변수 숫자만 들어가는 동적 array numbers에 push하고 pop하는 함수 그리고 전체를 반환하는 구현하세요.
    */

    uint[] public numbers;

    function pushArr(uint num) public {

        assembly {

            let length := sload(numbers.slot)

            let slot := add(keccak256(0x0, 0x20), length)

            sstore(slot, num)

            sstore(numbers.slot, add(length, 1))
        }
    }

    function popArr() public {
        
        assembly {

            let length := sload(numbers.slot)

            if iszero(length) { revert(0, 0) }

            let slot := add(keccak256(0x0, 0x20), sub(length, 1))

            sstore(slot, 0)

            sstore(numbers.slot, sub(length, 1))
        }
    }

    function getArr() public view returns (uint[] memory) {

        return numbers;
    }
}

contract Q98 {
    /*
        inline - 상태변수 문자형 letter에 값을 넣는 함수 setLetter를 구현하세요..
    */
}

contract Q99 {
    /*
        inline - bytes4형 b의 값을 정하는 함수 setB를 구현하세요.
    */

    bytes4 public b;

    function setB(bytes4 _b) public {

        assembly {

            let slot := b.slot

            sstore(slot, _b)
        }
    }
}

contract Q100 {
    /*
        nline - bytes형 변수 b의 값을 정하는 함수 setB를 구현하세요.
    */

    bytes public b;

    function setB(bytes _b) public {

        assembly {

            let slot := b.slot

            sstore(slot, _b)
        }
    }
}