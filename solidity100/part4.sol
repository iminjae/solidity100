// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;

contract Q31 {
    /*
        string을 input으로 받는 함수를 구현하세요. "Alice"나 "Bob"일 때에만 true를 반환하세요.
    */

    function test(string memory str) public pure returns(bool) {
        
        if(keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked("Alice")) || keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked("Bob"))){
            return true;
        }else {
            return false;
        }
    }
}

contract Q32 {
    /*
        2. 3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
        예) 3 → o , 9 → o , 15 → o , 30 → x
    */

    uint[] public arr;

    function test(uint num) public {

        if(num % 3 == 0){
            
            if(num % 10 == 0){
                revert("10");
            }else {
                arr.push(num);
            }
        }
    }
}

contract Q33 {
    /*
        이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요.
        고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
    */

    mapping(string => Customer) info;

    struct Customer{
        string name;
        uint number;
        address adrs;
        uint birth;
    }

    function setCustomer(string memory _name, uint _number, address _adrs, uint _birth) public  {
        info[_name] = Customer(_name, _number, _adrs, _birth);
    }

    function getCustomer(string memory _name) public view returns(Customer memory) {
        return info[_name];
    }
}

contract Q34 {
    /*
        이름, 번호, 점수가 들어간 학생 구조체를 선언하세요. 학생들을 관리하는 자료구조도 따로 선언하고 학생들의 전체 평균을 계산하는 함수도 구현하세요.
    */

    struct Student{
        string name;
        uint number;
        uint score;
    }

    Student[] public students;

    function getAvg() public view returns(uint) {
        uint sum = 0;
        for(uint i = 0; i < students.length; i++){
            sum += students[i].score;
        }

        return sum / students.length;
    }

    // function setStudent(string memory s, uint n, uint sc) public {
    //     students.push(Student(s, n, sc));
    // }
}

contract Q35 {//2차
    /*
        5. 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
        예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]
    */

    function getArr(uint[] memory _arr) public pure returns(uint[] memory) {
        
        uint cnt = _arr.length / 2;

        uint[] memory resultArr = new uint[](cnt);
        uint resultCnt = 0;

        for(uint i = 0; i < _arr.length; i++){
            if(i % 2 == 1){
                resultArr[resultCnt] = _arr[i];
                resultCnt ++;
            }
        }

        return resultArr;
    }
}

contract Q36 {
    /*
        high, neutral, low 상태를 구현하세요.
        a라는 변수의 값이 7이상이면 high,
        4이상이면 neutral
        그 이후면 low로 상태를 변경시켜주는 함수를 구현하세요.
    */

    enum Status { high, neutral, low }

    Status public s;

    function changeStatus(uint _num) public {

        if(_num >= 7){
            s = Status.high;
        }else if(_num >= 4){
            s = Status.neutral;
        }else{
            s = Status.low;
        }
    }
}

contract Q37 {//2차
    /*
        1 wei를 기부하는 기능, 1finney를 기부하는 기능 그리고 1 ether를 기부하는 기능을 구현하세요.
        최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 다른 이들은 못하게 막는 함수도 구현하세요.
        (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)
    */

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function donateWei() public payable {
        require(msg.value == 1 wei, "1 wei");
    }

    function donateFinney() public payable {
        require(msg.value == 0.001 ether, "1 finney");
    }

    function donateEther() public payable {
        require(msg.value == 1 ether, "1 ether");
    }

    function withdraw() public {

        require(msg.sender == owner, "only owner");

        payable(owner).transfer(address(this).balance);
    }

}

contract Q38 {
    /*
        상태변수 a를 "A"로 설정하여 선언하세요.
        이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요.
        단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
        (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)
    */

    address public owner;

    string public a;

    constructor() {
        owner = msg.sender;
        a = "A";
    }

    modifier chkOwner() {
        require(msg.sender == owner, "only owner");
        _;
    }

    function setB() public chkOwner{
        a = "B";
    }

    function setC() public chkOwner{
        a = "C";
    }
}

contract Q39 {//2차
    /*
        9. 특정 숫자의 자릿수까지의 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
        예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개) 
           100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)
    */
    

    /*
        uint two = 0;
        uint three = 0;
        uint five = 0;
        uint seven = 0;

        for(uint i = 1; i <= _num; i++){

            if(i % 2 == 0){
                two ++;
            }

            if(i % 3 == 0){
                three ++;
            }

            if(i % 5 == 0){
                five ++;
            }

            if(i % 7 == 0){
                seven ++;
            }
        }

        return (two, three, five, seven);
    */


    function chk(uint number) public pure returns (uint, uint, uint, uint) {
        return (number / 2, number / 3, number / 5, number / 7);
    }
}

contract Q40 {//2차
    /*
        10. 숫자를 임의로 넣었을 때 내림차순으로 정렬하고 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.
        예) [5,2,4,7,1] -> [1,2,4,5,7], 4 // [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 // [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
    */

    function desc(uint[] memory _arr) public pure returns(uint[] memory) {

        for(uint i = 0; i < _arr.length; i++) {
            for(uint j=i+1; j<_arr.length; j++) {
                if(_arr[i] < _arr[j]) {
                    (_arr[i], _arr[j]) = (_arr[j], _arr[i]);
                }
            }
        }

        return _arr;
    }

    /*
        function test(uint[] memory _arr) public pure returns(uint, uint){

            uint[] memory descArr = desc(_arr);
            uint index = descArr.length / 2;


            if(descArr.length % 2 == 0){

                return (descArr[index], descArr[index - 1]);

            }else {

                return (descArr[index], 0);
            }
            
        }
    */

    function getMedian(uint[] memory _a) public pure returns(uint[] memory) {
        _a = desc(_a);

        uint[] memory median = new uint[](2 - _a.length % 2);

        if(median.length == 1){
            median[0] = _a[_a.length / 2];
        }else {
            median[0] = _a[_a.length / 2 - 1];
            median[1] = _a[_a.length / 2];
        }

        return median;
    }
}