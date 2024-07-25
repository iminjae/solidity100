// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST9 {
    /*
        흔히들 비밀번호 만들 때 대소문자 숫자가 각각 1개씩은 포함되어 있어야 한다 
        등의 조건이 붙는 경우가 있습니다. 그러한 조건을 구현하세요.

        입력값을 받으면 그 입력값 안에 대문자, 
        소문자 그리고 숫자가 최소한 1개씩은 포함되어 있는지 여부를 
        알려주는 함수를 구현하세요.
    */

    function checkPw(string memory _pw) public pure returns(string memory) {
        
        bool haveNumber;
        bool haveBig;
        bool haveSmall;


        bytes memory b = bytes(_pw);

        for(uint i = 0; i < b.length; i++){
            
            if(b[i] >= 0x41 && b[i] <= 0x5A){
                haveBig = true;
            }

            if(b[i] >= 0x61 && b[i] <= 0x7A){
                haveSmall = true;
            }

            if(b[i] >= 0x30 && b[i] <= 0x39){
                haveNumber = true;
            }
        }

        if(haveNumber && haveBig && haveSmall){
            return "success";
        }else{
            return "again";
        }

    }



}