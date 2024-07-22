// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Name {
    /*
        숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
        예) 2 -> 1,   2 // 45 -> 2,   4,5 // 539 -> 3,   5,3,9 // 28712 -> 5,   2,8,7,1,2
        --------------------------------------------------------------------------------------------
        문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
        예) abde -> 4,   a,b,d,e // fkeadf -> 6,   f,k,e,a,d,f
    */


    //숫자를 넣었을 때 그 숫자의 자릿수와 각 자릿수의 숫자를 나열한 결과를 반환하세요.
    function uintLength(uint _num) public pure returns(uint, uint[] memory) {
        
        uint length = 0;

        while (_num != 0) {
            length++;
            _num /= 10;
        }

        uint[] memory arr = new uint[](length);

        for(uint i = 0; i < length; i++){

            
        }


        return (length, arr);

    }


    //문자열을 넣었을 때 그 문자열의 자릿수와 문자열을 한 글자씩 분리한 결과를 반환하세요.
    function strLength(string memory _str) public pure returns(uint, string[] memory){

        bytes memory strToBytes = bytes(_str);
        string[] memory arr = new string[](strToBytes.length);

        for(uint i = 0; i < strToBytes.length; i++){

            bytes memory char = new bytes(1);

            char[0] = strToBytes[i];
            arr[i] = string(char);
        }


        return (strToBytes.length, arr);
    }

}