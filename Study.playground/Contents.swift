import UIKit

//----- 변수, 상수, 함수

var name : String = "ABC"
let age : Int = 20
name = "ltsme"
name = "My name is \(name) and \(age) years old"

func sayHello (name : String) -> String {
    return "Nice To Meet you \(name)"
}

sayHello(name: "Yang")

func add(one : Int, two : Int) -> Int {
    return one + two
}

add(one: 10, two: 20)

//----- 데이터 타입
var isChecked : Bool = true
isChecked = false

// Int : 64bit 정수형 타입
var valueA : Int = 100
valueA = -100

// UInt : 64bit 양수 정수형 타입 (Unsigned ~)
var valueB : UInt = 100
// valueB = -100 에러 발생

// Float : 32bit 실수
var pi : Float = 3.14
pi = -3.14

// Double : 64bit 실수
var pi2 : Double = 3.14
pi2 = -3.14

// Character : 문자
var chaA : Character = "A"
chaA = "가"
// chaA = "가A" // 에러 발생

// String : 문자열
var strA : String = "가나다라"
strA = "가A나B다C"

// Any : 모든 타입을 지칭, 타입 추론
var anyTest : Any = "테스트"
type(of: anyTest) // String
anyTest = 123
type(of: anyTest) // Int

// nil : 없음, 존재하지 않음을 나타냄
var nilInt : Int? = nil
type(of: nilInt) // Optional<Int>

//----- 조건문
var time : Int = 10
if(time == 12){
    print("점심시간 입니다.")
}else if(time == 18){
    print("저녁시간 입니다.")
}else{
    print("자유시간 입니다.")
}

let colorG : UIColor = UIColor.green
switch colorG {
case UIColor.red :
    print("레드")
case UIColor.green :
    print("그린")
case UIColor.blue :
    print("블루")
    
default :
    print("그 외 색상입니다.")
}


func getName(name: String?) -> String{
    guard let nameG = name else {
        return "이름이 존재하지 않습니다."
    }
    return nameG
}

getName(name: "Davies")
getName(name: nil)
