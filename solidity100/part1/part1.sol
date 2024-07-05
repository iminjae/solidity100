// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Q1 {
    /*
    더하기, 빼기, 곱하기, 나누기 그리고 제곱을 반환받는 계산기를 만드세요.
    */
    uint a;
    uint b;

    function add() public view returns(uint) {
        return  a + b;
    }

    function sub() public view returns(uint) {
        return  a - b;
    }

    function mul() public view returns(uint) {
        return  a * b;
    }

    function div() public view returns(uint) {
        return  a / b;
    }

    function pow() public view returns(uint) {
        return  a ** b;
    }
}


contract Q2 {
    /*
        2개의 Input값을 가지고 1개의 output값을 가지는 4개의 함수를 만드시오. 각각의 함수는 더하기, 빼기, 곱하기, 나누기(몫)를 실행합니다.
    */

    function add(uint _a, uint _b) public pure  returns(uint) {
        return _a + _b;
    }

    function sub(uint _a, uint _b) public pure  returns(uint) {
        return _a - _b;
    }

    function mul(uint _a, uint _b) public pure  returns(uint) {
        return _a * _b;
    }

    function div(uint _a, uint _b) public pure  returns(uint) {
        return _a / _b;
    }
    
}

contract Q3 {
    /*
        1개의 Input값을 가지고 1개의 output값을 가지는 2개의 함수를 만드시오. 각각의 함수는 제곱, 세제곱을 반환합니다.
    */

    function pow(uint _a) public pure returns(uint) {
        return _a ** 2;
    }

    function pow2(uint _a) public pure returns(uint) {
        return _a ** 3;
    }

}

contract Q4 {
    /*
        이름(string), 번호(uint), 듣는 수업 목록(string[])을 담은 student라는 구조체를 만들고 
        그 구조체들을 관리할 수 있는 array, students를 선언하세요.
    */

    struct student {
        string name;
        uint number;
        string[] items;
    }

    student[] students;
}

contract Q5 {
    /*
        아래의 함수를 만드세요
        1~3을 입력하면 입력한 수의 제곱을 반환받습니다.
        4~6을 입력하면 입력한 수의 2배를 반환받습니다.
        7~9를 입력하면 입력한 수를 3으로 나눈 나머지를 반환받습니다.
    */

    function test(uint _a) public pure returns(uint) {
        
        if(_a >= 1 && _a <= 3){
            return _a ** 2;
        }else if(_a >= 4 && _a <= 6){
            return _a * 2;
        }else if(_a > 7 && _a <= 9){
            return _a % 3;
        }else{
            revert("no");
        }
    }

}

contract Q6 {
    /*
        숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 9까지 자동으로 채우는 함수를 구현하세요.(for 문)
    */

    uint[] numbers;

    function setArr() public {
        for(uint i = 0; i < 10; i++){
            numbers.push(i);
        }
    }

}

contract Q7 {
    /*
        숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와
        array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
    */

    uint[] numbers;

    function setArr() public  {
        for(uint i = 0; i < 6; i++){
            numbers.push(i);
        }
    }

    function getSumArr() public view returns(uint) {
        uint sum;

        for(uint i = 0; i < numbers.length; i++){
            sum += numbers[i];
        }

        return sum;
    }
}