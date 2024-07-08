// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 < 0.9.0;


contract TEST1 {
    /*
        여러분은 선생님입니다. 학생들의 정보를 관리하려고 합니다. 
        학생의 정보는 이름, 번호, 점수, 학점 그리고 듣는 수업들이 포함되어야 합니다.

        번호는 1번부터 시작하여 정보를 기입하는 순으로 순차적으로 증가합니다.

        학점은 점수에 따라 자동으로 계산되어 기입하게 합니다. 90점 이상 A, 80점 이상 B, 70점 이상 C, 60점 이상 D, 나머지는 F 입니다.

        필요한 기능들은 아래와 같습니다.

        * 학생 추가 기능 - 특정 학생의 정보를 추가
        * 학생 조회 기능(1) - 특정 학생의 번호를 입력하면 그 학생 전체 정보를 반환
        * 학생 조회 기능(2) - 특정 학생의 이름을 입력하면 그 학생 전체 정보를 반환
        * 학생 점수 조회 기능 - 특정 학생의 이름을 입력하면 그 학생의 점수를 반환
        * 학생 전체 숫자 조회 기능 - 현재 등록된 학생들의 숫자를 반환
        * 학생 전체 정보 조회 기능 - 현재 등록된 모든 학생들의 정보를 반환
        * 학생들의 전체 평균 점수 계산 기능 - 학생들의 전체 평균 점수를 반환
        * 선생 지도 자격 자가 평가 시스템 - 학생들의 평균 점수가 70점 이상이면 true, 아니면 false를 반환
        * 보충반 조회 기능 - F 학점을 받은 학생들의 숫자와 그 전체 정보를 반환
        -------------------------------------------------------------------------------
        * S반 조회 기능 - 가장 점수가 높은 학생 4명을 S반으로 설정하는데, 이 학생들의 전체 정보를 반환하는 기능 (S반은 4명으로 한정)

        기입할 학생들의 정보는 아래와 같습니다.

        Alice, 1, 85
        Bob,2, 75
        Charlie,3,60
        Dwayne, 4, 90
        Ellen,5,65
        Fitz,6,50
        Garret,7,80
        Hubert,8,90
        Isabel,9,100
        Jane,10,70
    */

    struct Student{
        string name;
        uint number;
        uint score;
        string grade;
        string[] sub;
    }

    Student[] students;

    //학생 추가 기능
    function setStudent(string memory _name, uint _score, string[] memory _sub) public  {
        
        string memory _grade;

        if(_score >= 90){
            _grade = "A";
        }else if(_score >=80){
            _grade = "B";
        }else if(_score >=70){
            _grade = "C";
        }else if(_score >= 60){
            _grade = "D";
        }else{
            _grade = "F";
        }

        
        
        students.push(Student(_name, students.length + 1, _score, _grade, _sub));

    }

    //학생 조회 기능(1)
    function getStudent(uint _number) public view returns(Student memory) {
        
        for(uint i = 0; i < students.length; i++){
            if(students[i].number == _number){

                return students[i];   
            }    
        }

        revert("not found");
    }

    //학생 조회 기능(2)
    function getStudent2(string memory _name) public view returns(Student memory) {
        
        for(uint i = 0; i < students.length; i++){
            if(keccak256(abi.encodePacked(students[i].name)) == keccak256(abi.encodePacked(_name))){

                return students[i];   
            }    
        }

        revert("not found");
    }

    //학생 점수 조회 기능
    function getScore(string memory _name) public view returns(uint) {

        for(uint i = 0; i < students.length; i++){
            if(keccak256(abi.encodePacked(students[i].name)) == keccak256(abi.encodePacked(_name))){

                return students[i].score;   
            }    
        }

        revert("not found");
    }

    //학생 전체 숫자 조회 기능
    function getTotalNunber() public view returns(uint) {

        return students.length;
    }

    //학생 전체 정보 조회 기능
    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    //학생들의 전체 평균 점수 계산 기능
    function getAvg() public view returns(uint) {
        uint sum;

        for(uint i = 0; i < students.length; i++){
            sum += students[i].score;
        }

        return sum / students.length;
    }

    //선생 지도 자격 자가 평가 시스템
    function getAssess() public view returns(bool) {
        
        uint avg = getAvg();

        if(avg >= 70){
            return true;
        }else {
            return false;
        }
    }

    //보충반 조회 기능
    function getFStudents() public view returns(uint, Student[] memory)  {
        
        uint cnt;
        Student[] memory arr = new Student[](students.length);//


        for(uint i = 0; i < students.length; i++){
            if(keccak256(abi.encodePacked(students[i].grade)) == "F"){
                cnt ++;
                arr[i] = students[i];
            }
        }

        return (cnt, arr);
    }






    //S반 조회 기능
    // function getSClass() public view returns(Student[] memory)  {
        


       

    //     return arr;
    // }





}