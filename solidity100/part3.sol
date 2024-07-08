// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.26;

contract Q21 {
    /*
        3의 배수만 들어갈 수 있는 array를 구현하세요.
    */

    uint[] arr;

    function setArr(uint _num) public {
        if(_num % 3 == 0){
            arr.push(_num);
        }else {
            revert("no");
        }
    }

}

contract Q22 {
    /*
        뺄셈 함수를 구현하세요. 임의의 두 숫자를 넣으면 자동으로 둘 중 큰수로부터 작은 수를 빼는 함수를 구현하세요.
        예) 2,5 input → 5-2=3(output)
    */

    function sub(uint _a, uint _b) public pure returns(uint) {
        if(_a > _b){
            return _a - _b;
        }else{
            return _b - _a;
        }
    }
}

contract Q23 {
    /*
        3의 배수라면 “A”를, 나머지가 1이 있다면 “B”를, 나머지가 2가 있다면 “C”를 반환하는 함수를 구현하세요.
    */

    function get3(uint _num) public pure returns(string memory) {
        if(_num % 3 == 0){
            return "A";
        }else if(_num % 3 == 1){
            return "B";
        }else if(_num % 3 == 2){
            return "C";
        }else{
            revert("no");
        }
    }
}

contract Q24 {
    /*
        string을 input으로 받는 함수를 구현하세요. “Alice”가 들어왔을 때에만 true를 반환하세요.
    */

    function q(string memory _str) public pure returns(bool) {
        if(keccak256(abi.encodePacked(_str)) == keccak256(abi.encodePacked("Alice"))){
            return true;
        }else {
            return false;
        }
    }
}

contract Q25 {
    /*
        배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
    */

    uint[] A;

    function setArr(uint n) public  {
        
        for(uint i = 0; i <= n; i++){
            A.push(n - i);
        }
    }
}

contract Q26 {
    /*
        홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고
        숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
    */
    uint[] oddArr;
    uint[] evenArr;

    function setArr(uint _num) public {

        if(_num % 2 == 0){
            evenArr.push(_num);
        }else{
            oddArr.push(_num);
        }
    }
    
}

contract Q27 {
    /*
        string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요.
        해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
    */

    mapping(string=>bytes32) mp;

    function set(string memory _key, bytes32 _value) public {
        mp[_key] = _value;
    }

    function del(string memory _name) public {
        delete mp[_name];
    }

    function get(string memory _key) public view returns(bytes32) {
        return mp[_key];
    }
}

contract Q28 {
    /*
        ID와 PW를 넣으면 해시함수(keccak256)에 둘을 같이 해시값을 반환해주는 함수를 구현하세요.
    */

    function get(string memory id, string memory pw) public pure returns(bytes32) {
        
        return keccak256(abi.encodePacked(id,pw));
    }
}

contract Q29 {
    /*
        숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
    */

    uint a;
    string b;

    constructor() {
        a = 10;
        b = "A";
    }
}

contract Q30 {//버블 정렬 알고리즘 참고
    /*
        10. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
        (sorting 코드 응용 → 약간 까다로움)
            
        예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
    */   
    
    uint[] numbers;

    function getDesc(uint _num) public {

        numbers.push(_num);

         for(uint i = 0; i < numbers.length; i++){
            
            for (uint j = 0; j < numbers.length - 1 - i; j++) {
                if (numbers[j] < numbers[j + 1]) {
                
                    uint temp = numbers[j];
                    numbers[j] = numbers[j + 1];
                    numbers[j + 1] = temp;
                }
            }
        }
    }

    // function get()public view returns(uint[] memory) {

    //     return numbers;
    // }
    

}