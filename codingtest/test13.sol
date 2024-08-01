// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST13 {
    /*
        가능한 모든 것을 inline assembly로 진행하시면 됩니다.
        1. 숫자들이 들어가는 동적 array number를 만들고 1~n까지 들어가는 함수를 만드세요.
        2. 숫자들이 들어가는 길이 4의 array number2를 만들고 여기에 4개의 숫자를 넣어주는 함수를 만드세요.
        3. number의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
        4. number2의 모든 요소들의 합을 반환하는 함수를 구현하세요. 
        5. number의 k번째 요소를 반환하는 함수를 구현하세요.
        6. number2의 k번째 요소를 반환하는 함수를 구현하세요.
    */

    uint[] public number;
    uint[4] public number2;

    // 1. 숫자들이 들어가는 동적 array number를 만들고 1~n까지 들어가는 함수를 만드세요.
    function createArray(uint n) public {
        assembly {
            let size := mul(n, 0x20)
            sstore(number.slot, size)
            for { let i := 0 } lt(i, n) { i := add(i, 1) } {
                sstore(add(add(number.slot, 1), i), i)
            }
        }
    }

    // 2. 숫자들이 들어가는 길이 4의 array number2를 만들고 여기에 4개의 숫자를 넣어주는 함수를 만드세요.
    function createArray2(uint a, uint b, uint c, uint d) public {
        assembly {
            sstore(add(number2.slot, 0), a)
            sstore(add(number2.slot, 1), b)
            sstore(add(number2.slot, 2), c)
            sstore(add(number2.slot, 3), d)
        }
    }

    // 3. number의 모든 요소들의 합을 반환하는 함수를 구현하세요.
    function sumNumber() public view returns (uint sum) {
        assembly {
            let len := sload(number.slot)
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                sum := add(sum, sload(add(add(number.slot, 1), i)))
            }
        }
    }

    // 4. number2의 모든 요소들의 합을 반환하는 함수를 구현하세요.
    function sumNumber2() public view returns (uint sum) {
        assembly {
            for { let i := 0 } lt(i, 4) { i := add(i, 1) } {
                sum := add(sum, sload(add(number2.slot, i)))
            }
        }
    }

    // 5. number의 k번째 요소를 반환하는 함수를 구현하세요.
    function getElementNumber(uint k) public view returns (uint element) {
        assembly {
            element := sload(add(add(number.slot, 1), k))
        }
    }

    // 6. number2의 k번째 요소를 반환하는 함수를 구현하세요.
    function getElementNumber2(uint k) public view returns (uint element) {
        assembly {
            element := sload(add(number2.slot, k))
        }
    }

}