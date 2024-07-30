// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract TEST12 {
    /*
        주차정산 프로그램을 만드세요. 주차시간 첫 2시간은 무료, 그 이후는 1분마다 200원(wei)씩 부과합니다. 
        주차료는 차량번호인식을 기반으로 실행됩니다.
        주차료는 주차장 이용을 종료할 때 부과됩니다.
        ----------------------------------------------------------------------
        차량번호가 숫자로만 이루어진 차량은 20% 할인해주세요.
        차량번호가 문자로만 이루어진 차량은 50% 할인해주세요.
    */

    mapping(string => uint) parkingTime;

    function carIn(string memory car) public {
        
        parkingTime[car] = block.timestamp;
    }

    function carOut(string memory car) public view returns(uint){

        uint fee = ((block.timestamp - parkingTime[car]) ) / 1 minutes;
        uint discount = discountFee(car);

        return fee * (100 - discount) / 100;
    }

    function discountFee(string memory _car) internal pure returns(uint){
        
        bool onlyNum = false;
        bool onlyStr = false;
        
        for (uint i = 0; i < bytes(_car).length; i++) {
            
            bytes1 char = bytes(_car)[i];

            if(char[i] >= 0x30 && char[i] <= 0x39){
                onlyNum = true;
            }

            if(char[i] >= 0x41 && char[i] <= 0x5A || char[i] >= 0x61 && char[i] <= 0x7A){
                onlyStr = true;
            }
        }

        if (onlyNum && !onlyStr) {
            return 20;
        }
        if (!onlyNum && onlyStr) {
            return 50; 
        }

        return 0;
    }
}